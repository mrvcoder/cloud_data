package main

import (
	"flag"
	"fmt"
	"net/url"
	"os"
	"path"
	"regexp"
	"strconv"
	"strings"

	"github.com/jszwec/csvutil"
	"github.com/projectdiscovery/gologger"
	"github.com/projectdiscovery/gologger/levels"
)

type TrickSetCloud_Data struct {
	IP                   string `csv:"IP Address"`
	CN                   string `csv:"Common Name"`
	Org                  string `csv:"Organization"`
	Alternative_DNS_Name string `csv:"Subject Alternative DNS Name"`
	Alternative_IP       string `csv:"Subject Alternative IP address"`
}

func main() {
	ExecShell("rm outputs/*.txt ")
	ExecShell("rm outputs/*.csv ")
	flag.Parse()
	gologger.DefaultLogger.SetMaxLevel(levels.LevelDebug)
	// GetTargetDomains_TricksetData()
	GetkaeferjaegerDatas()

}

func GetTricksetData() int {
	gologger.Info().Msg("Getting Data ...")
	ExecShell("git clone https://github.com/trickest/cloud")
	c := ExecShell("ls -l ./cloud/ssl | wc -l")
	count, _ := strconv.Atoi(c)
	gologger.Info().Msg("Got Data !")
	return count - 1
}

func GetTargetDomains_TricksetData() {
	gologger.Info().Msg("Getting TricksetData!")

	file_count := GetTricksetData()
	minValue := 0          // Replace with your minimum value
	maxValue := file_count // Replace with your maximum value

	for i := minValue; i < maxValue; i++ {
		gologger.Info().Msg(fmt.Sprintf("Scanning %d/%d", i+1, maxValue))
		filename := fmt.Sprintf("ssl%04d", i)
		file_data, _ := readFileContent("./cloud/ssl/" + filename + ".csv")
		var Datas []TrickSetCloud_Data
		if err := csvutil.Unmarshal([]byte(file_data), &Datas); err != nil {
			gologger.Fatal().Msg("error: " + err.Error())
		}
		d, err := readFileContent("./targets.txt")
		if d != "" && err == nil {
			subs := []string{}
			targets := strings.Split(d, "\n")
			for _, target := range targets {

				for _, data := range Datas {

					hostname, tld := ExtractHostAndTld(target)
					// Define the regex pattern
					pattern := fmt.Sprintf(`\.%s\.%s`, hostname, tld)

					// Compile the regex pattern
					regex, err := regexp.Compile(pattern)
					if err != nil {
						fmt.Println("Error compiling regex:", err)
						return
					}

					if regex.MatchString(data.CN) || regex.MatchString(data.Alternative_DNS_Name) {
						data := fmt.Sprintf("\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"", data.IP, data.CN, data.Org, data.Alternative_DNS_Name, data.Alternative_IP)
						subs = append(subs, data)
					}
				}

				if len(subs) > 0 {

					filePath := "./outputs/" + target + "_data.csv"
					if _, err := os.Stat(filePath); os.IsNotExist(err) {
						// create a csv file
						createFile(filePath, "IP Address,Common Name,Organization,Subject Alternative DNS Name,Subject Alternative IP address\n")
					}

					csv_plain := "\n"
					for _, d := range subs {
						csv_plain += d + "\n"
					}
					appendToFile(filePath, csv_plain)
					gologger.Info().Msg("Got [" + target + "] Data !")
					subs = []string{}

				} else {
					gologger.Warning().Msg("No Subs of [" + target + "] found !")

				}

			}
		} else {
			gologger.Warning().Msg("No Targets Found (./targets.txt)")
			gologger.Warning().Msg("Exiting ...")
			os.Exit(1)
		}
		gologger.Info().Msg("-------------------------")
	}

	ExecShell("rm cloud/ -rf")
	gologger.Info().Msg("Got TricksetData!")
}

func GetkaeferjaegerDatas() {
	gologger.Info().Msg("Getting kaeferjaeger Files !")
	final_data := []string{}
	datsets := []string{
		"http://kaeferjaeger.gay/sni-ip-ranges/amazon/ipv4_merged_sni.txt",
		"http://kaeferjaeger.gay/sni-ip-ranges/digitalocean/ipv4_merged_sni.txt",
		"http://kaeferjaeger.gay/sni-ip-ranges/google/ipv4_merged_sni.txt",
		"http://kaeferjaeger.gay/sni-ip-ranges/microsoft/ipv4_merged_sni.txt",
		"http://kaeferjaeger.gay/sni-ip-ranges/oracle/ipv4_merged_sni.txt",
	}

	d, err := readFileContent("./targets.txt")

	if d != "" && err == nil {
		targets := strings.Split(d, "\n")
		for _, filelink := range datsets {
			fmt.Println()
			parsedURL, err := url.Parse(filelink)
			if err != nil {
				gologger.Fatal().Msg("Error parsing URL: " + err.Error())
				return
			}
			fileName := path.Base(parsedURL.Path)
			resp, err := makeHTTPRequest(filelink)
			if err != nil {
				gologger.Fatal().Msg("Error make http req on :" + err.Error())
			}
			err = createFile("./outputs/kaeferjaeger/"+fileName, resp)
			if err != nil {
				gologger.Fatal().Msg("Error make http req on :" + err.Error())
			}
			gologger.Info().Msg("Got " + filelink + " File !")

			for _, target := range targets {
				d := ExecShell(fmt.Sprintf("cat ./outputs/kaeferjaeger/%s | grep -F \".%s\" | sed -E 's/([^ ]+:[0-9]+) -- \\[([^ ]+( \\*.[^ ]+)?)\\]/\\1,\\2/' | sed 's/ /,/g'", fileName, target))
				final_data = []string{}
				Datas := strings.Split(d, "\n")
				for _, data := range Datas {

					mini_array := strings.Split(data, ",")
					subs := mini_array[1:]
					final_string_data := mini_array[0]

					for _, sub := range subs {
						sub = strings.ReplaceAll(sub, "[", "")
						sub = strings.ReplaceAll(sub, "]", "")
						hostname, tld := ExtractHostAndTld(target)
						// Define the regex pattern
						pattern := fmt.Sprintf(`\.%s\.%s`, hostname, tld)

						// Compile the regex pattern
						regex, err := regexp.Compile(pattern)
						if err != nil {
							fmt.Println("Error compiling regex:", err)
							return
						}

						if regex.MatchString(sub) {
							final_string_data += "|" + sub
						}
					}

					final_data = append(final_data, final_string_data)
				}

				filePath := fmt.Sprintf("./outputs/kaeferjaeger/%s.csv", target)
				if _, err := os.Stat(filePath); os.IsNotExist(err) {
					// create a csv file
					createFile(filePath, "IP Address,Common Name\n")
				}

				// append data in csv format to it
				csv_plain := "\n"
				for _, d := range final_data {
					csv_plain += d + "\n"
				}
				appendToFile(filePath, csv_plain)
			}
		}

		ExecShell("rm outputs/kaeferjaeger/*.txt ")
	} else {
		gologger.Warning().Msg("No Targets Found (./targets.txt)")
		gologger.Warning().Msg("Exiting ...")
		os.Exit(1)
	}
}
