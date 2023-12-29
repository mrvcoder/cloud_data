package main

import (
	"flag"
	"fmt"
	"regexp"
	"strconv"
	"strings"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jszwec/csvutil"
	"github.com/projectdiscovery/gologger"
	"github.com/projectdiscovery/gologger/levels"
)

// var (
// 	db  *sql.DB
// 	err error

// 	db_user = flag.String("db_user", "root", "db username")
// 	db_pass = flag.String("db_pass", "vcoder", "db pass")
// 	db_port = flag.Int("db_port", 3306, "db port")
// 	db_name = flag.String("db_name", "cloud_data", "db name")
// )

type Cloud_Data struct {
	IP                   string `csv:"IP Address"`
	CN                   string `csv:"Common Name"`
	Org                  string `csv:"Organization"`
	Alternative_DNS_Name string `csv:"Subject Alternative DNS Name"`
	Alternative_IP       string `csv:"Subject Alternative IP address"`
}

func main() {
	// ExecShell(fmt.Sprintf("cat db_init.sql > cloud_data.sql"))
	// reinit the process
	ExecShell("rm outputs/*.txt ")

	flag.Parse()
	gologger.DefaultLogger.SetMaxLevel(levels.LevelDebug)
	// file_count := GetData()
	minValue := 0 // Replace with your minimum value
	maxValue := 1 // Replace with your maximum value

	for i := minValue; i < maxValue; i++ {
		gologger.Info().Msg(fmt.Sprintf("Scanning %d/%d", i+1, maxValue))
		filename := fmt.Sprintf("ssl%04d", i)
		file_data, _ := readFileContent("./cloud/ssl/" + filename + ".csv")
		var Datas []Cloud_Data
		if err := csvutil.Unmarshal([]byte(file_data), &Datas); err != nil {
			gologger.Fatal().Msg("error: " + err.Error())
		}
		GetTargetDomainsData(Datas)
		// csv2sql(filename)
		gologger.Info().Msg("-------------------------")
	}

	// ConnectToDB()
	// GetTargetsSubdomains()
	ExecShell("rm cloud/ -rf")
}

func GetData() int {
	gologger.Info().Msg("Getting Data ...")
	ExecShell("git clone https://github.com/trickest/cloud")
	c := ExecShell("ls -l ./cloud/ssl | wc -l")
	count, _ := strconv.Atoi(c)
	gologger.Info().Msg("Got Data !")
	return count - 1
}

func GetTargetDomainsData(Datas []Cloud_Data) {
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
				csv_plain := ""
				for _, d := range subs {
					csv_plain += d + "\n"
				}
				appendToFile("./outputs/"+target+"_data.csv", csv_plain)
				gologger.Info().Msg("Got [" + target + "] Data !")

			} else {
				gologger.Warning().Msg("No Subs of [" + target + "] found !")

			}

		}
	} else {
		gologger.Error().Msg("No Targets Found (./targets.txt)")
	}
}

// ==================================================================================================================================
// these codes was for another way to handle the csv datas but because the final files were so big I changed the flow of app :D
// ==================================================================================================================================
//
//
//
//
// func ConnectToDB() {
// 	username := *db_user
// 	password := *db_pass
// 	hostname := "127.0.0.1"
// 	port := *db_port
// 	database := *db_name
// 	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s", username, password, hostname, port, database)
// 	fmt.Println(dsn)
// 	db, err = sql.Open("mysql", dsn)
// 	if err != nil {
// 		gologger.Fatal().Msg("Error at DB connect ! " + err.Error())
// 	}
// 	err = db.Ping()
// 	if err != nil {
// 		gologger.Fatal().Msg("Error at DB connect !" + err.Error())
// 	}
// 	db.SetMaxOpenConns(30)
// 	gologger.Info().Msg("Connected to DB !")
// }

// func csv2sql(csvfilename string) {
// 	ExecShell(fmt.Sprintf("./csv2sql_app -f ./cloud/ssl/%s.csv -t cloud_data -k", csvfilename))

// 	ExecShell(fmt.Sprintf("sed '/PRAGMA foreign_keys=OFF;/d; /BEGIN TRANSACTION;/d; /COMMIT;/d; /CREATE TABLE cloud_data/d;' ./SQL-%s.sql > ./raw-%s.sql ; rm ./SQL-%s.sql ./cloud/ssl/%s.csv", csvfilename,
// 		csvfilename,
// 		csvfilename,
// 		csvfilename))

// 	ExecShell(fmt.Sprintf("cat ./raw-%s.sql >> cloud_data.sql ; rm ./raw-%s.sql", csvfilename,
// 		csvfilename))

// 	gologger.Info().Msg("Added [" + csvfilename + "] csv to mysql db")
// }

// func GetTargetsSubdomains() {
// 	d, err := readFileContent("./targets.txt")
// 	if d != "" && err == nil {
// 		gologger.Info().Msg("Getting Targets Data ...")

// 		targets := strings.Split(d, "\n")
// 		for _, target := range targets {
// 			gologger.Info().Msg("Getting [" + target + "] Data ...")
// 			subs := []string{}
// 			stmt, err := db.Prepare(fmt.Sprintf("SELECT IP_Address , Common_Name , Subject_Alternative_DNS_Name FROM cloud_data WHERE Common_Name LIKE '%%.%s%%' OR Subject_Alternative_DNS_Name LIKE '%%.%s%%'", target,
// 				target))
// 			if err != nil && err != sql.ErrNoRows {
// 				gologger.Error().Msg("error checking data existence:" + err.Error())
// 			}
// 			defer stmt.Close()

// 			// Execute the query
// 			rows, err := stmt.Query()
// 			if err != nil {
// 				log.Fatal(err)
// 			}
// 			defer rows.Close()

// 			// Iterate over the rows and retrieve the data
// 			for rows.Next() {
// 				var (
// 					IP_Address                   string
// 					Common_Name                  string
// 					Subject_Alternative_DNS_Name string
// 				)
// 				if err := rows.Scan(&IP_Address, &Common_Name, &Subject_Alternative_DNS_Name); err != nil {
// 					gologger.Error().Msg("error Getting subdomains from db:" + err.Error())
// 				}

// 				data := fmt.Sprintf("%s,%s,%s", IP_Address, Common_Name, Subject_Alternative_DNS_Name)

// 				subs = append(subs, data)
// 			}

// 			WriteToFile(strings.Join(subs, "\n"), "./"+target+"_data.txt")

// 			gologger.Info().Msg("Got [" + target + "] Data !")
// 		}

// 		gologger.Info().Msg("Got All Targets Data !")

// 	}
// }
