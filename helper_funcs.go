package main

import (
	"fmt"
	"io/ioutil"
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

func createFile(filePath, content string) error {
	// Extract the directory and filename from the provided file path
	if strings.Contains(filePath, "/") {
		dir := filepath.Dir(filePath)
		err := os.MkdirAll(dir, os.ModePerm)
		if err != nil {
			return err
		}
	}

	err = ioutil.WriteFile(filePath, []byte(content), 0644)
	if err != nil {
		return err
	}
	return nil
}
