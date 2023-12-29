package main

import (
	"fmt"
	"io/ioutil"
	"net/url"
	"os"
	"os/exec"
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
		err := ioutil.WriteFile(filePath, []byte(content), 0644)
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

	return nil
}
