package main

import (
	"bufio"
	"fmt"
	"io/ioutil"
	"net/url"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"github.com/projectdiscovery/gologger"
)

func readFileContent(filePath string) (string, error) {
	// Read the entire file content
	content, err := ioutil.ReadFile(filePath)
	if err != nil {
		return "", err
	}

	// Convert the content to a string and return
	return string(content), nil
}

// execute bash shell commands
func ExecShell(command string) string {
	out, err := exec.Command("bash", "-c", "source ~/.ReconEngine ; "+command).Output()
	if err != nil && out == nil {
		fmt.Println(err)
		gologger.Fatal().Msg("Error in bash ")
	}
	return strings.TrimSpace(string(out))
}

func ExtractHostAndTld(domain string) (string, string) {
	if domain == "" {
		return "", ""
	}
	u, _ := url.Parse("https://" + domain)

	parts := strings.Split(u.Hostname(), ".")
	if len(parts) <= 1 {
		return "", ""
	}
	domain = parts[len(parts)-2] + "." + parts[len(parts)-1]

	return strings.Split(domain, ".")[0], strings.Split(domain, ".")[1]
}

func appendToFile(filePath, content string) error {
	// Check if the file exists
	if _, err := os.Stat(filePath); os.IsNotExist(err) {
		// If the file doesn't exist, create it with the given content

		init_content := "IP Address,Common Name,Organization,Subject Alternative DNS Name,Subject Alternative IP address\n" + content
		err := ioutil.WriteFile(filePath, []byte(init_content), 0644)
		if err != nil {
			return fmt.Errorf("error creating file: %v", err)
		}
	} else {
		// If the file exists, open it and append the content
		file, err := os.OpenFile(filePath, os.O_APPEND|os.O_WRONLY, 0644)
		if err != nil {
			return fmt.Errorf("error opening file: %v", err)
		}
		defer file.Close()

		// Append content to the file
		if _, err := file.WriteString(content); err != nil {
			return fmt.Errorf("error appending to file: %v", err)
		}
	}

	maxFileSize := int64(100 * 1024 * 1024) // 100 MB
	err := splitFileIfLarge(filePath, maxFileSize)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
	}
	return nil
}

func splitFileIfLarge(inputFilePath string, maxSize int64) error {
	// Open the input file
	inputFile, err := os.Open(inputFilePath)
	if err != nil {
		return fmt.Errorf("error opening file: %v", err)
	}
	defer inputFile.Close()

	// Get file information to check its size
	fileInfo, err := inputFile.Stat()
	if err != nil {
		return fmt.Errorf("error getting file information: %v", err)
	}

	// Check if the file size is larger than the specified maximum size
	if fileInfo.Size() <= maxSize {
		return nil
	}

	// Create a scanner to read the file line by line
	scanner := bufio.NewScanner(inputFile)

	// Create variables for handling the output files
	var outputFile *os.File
	var currentSize int64
	fileCounter := 1

	// Iterate through the lines of the input file
	for scanner.Scan() {
		line := scanner.Text()

		// Check if a new file needs to be created
		if outputFile == nil || currentSize >= maxSize {
			if outputFile != nil {
				// Close the previous output file
				outputFile.Close()
			}

			// Create a new output file
			outputFilePath := fmt.Sprintf("%s_part%d.txt", strings.TrimSuffix(inputFilePath, filepath.Ext(inputFilePath)), fileCounter)
			fileCounter++
			outputFile, err = os.Create(outputFilePath)
			if err != nil {
				return fmt.Errorf("error creating output file: %v", err)
			}
			defer outputFile.Close()

			// Reset the current size for the new file
			currentSize = 0
		}

		// Write the line to the current output file
		_, err := outputFile.WriteString(line + "\n")
		if err != nil {
			return fmt.Errorf("error writing to output file: %v", err)
		}

		// Update the current size
		currentSize += int64(len(line) + 1) // +1 for the newline character
	}

	if err := scanner.Err(); err != nil {
		return fmt.Errorf("error scanning file: %v", err)
	}

	fmt.Printf("File successfully split into %d parts.\n", fileCounter-1)
	return nil
}

// formatSize formats file size for display
func formatSize(size int64) string {
	const unit = 1024
	if size < unit {
		return fmt.Sprintf("%d B", size)
	}
	div, exp := int64(unit), 0
	for n := size / unit; n >= unit; n /= unit {
		div *= unit
		exp++
	}
	return fmt.Sprintf("%.2f %cB", float64(size)/float64(div), "KMGTPE"[exp])
}
