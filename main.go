package main

import (
	"database/sql"
	"flag"
	"fmt"
	"strconv"

	"github.com/jszwec/csvutil"
	"github.com/projectdiscovery/gologger"
	"github.com/projectdiscovery/gologger/levels"
)

var (
	db  *sql.DB
	err error

	db_user = flag.String("db_user", "root", "db username")
	db_pass = flag.String("db_pass", "", "db pass")
	db_port = flag.Int("db_port", 3306, "db port")
	db_name = flag.String("db_name", "cloud_data", "db name")
)

type Cloud_Data struct {
	IP                   string `csv:"IP Address"`
	Domain               string `csv:"Common Name"`
	Org                  string `csv:"Organization"`
	Alternative_DNS_Name string `csv:"Subject Alternative DNS Name"`
	Alternative_IP       string `csv:"Subject Alternative IP address"`
}

func main() {

	flag.Parse()
	gologger.DefaultLogger.SetMaxLevel(levels.LevelDebug)
	ConnectToDB()
	file_count := GetData()

	minValue := 0          // Replace with your minimum value
	maxValue := file_count // Replace with your maximum value

	for i := minValue; i <= maxValue; i++ {
		filename := fmt.Sprintf("ssl%04d.csv", i)
		file_data, _ := readFileContent("./cloud/ssl/" + filename)
		var Datas []Cloud_Data
		if err := csvutil.Unmarshal([]byte(file_data), &Datas); err != nil {
			gologger.Fatal().Msg("error: " + err.Error())
		}
		for _, d := range Datas {
			AddDomain(d)
		}
	}

}

func GetData() int {
	gologger.Info().Msg("Getting Data ...")
	ExecShell("git clone https://github.com/trickest/cloud")
	c := ExecShell("ls -l ./cloud/ssl | wc -l")
	count, _ := strconv.Atoi(c)
	gologger.Info().Msg("Got Data !")
	return count - 1
}

func ConnectToDB() {
	username := *db_user
	password := *db_pass
	hostname := "localhost"
	port := *db_port
	database := *db_name
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s", username, password, hostname, port, database)
	db, err = sql.Open("mysql", dsn)
	if err != nil {
		gologger.Fatal().Msg("Error at DB connect !")
	}
	err = db.Ping()
	if err != nil {
		gologger.Fatal().Msg("Error at DB connect !")
	}
	db.SetMaxOpenConns(30)
	gologger.Info().Msg("Connected to DB !")
}

func AddDomain(domain Cloud_Data) {

	var rows *sql.Rows
	SelectedData := ""
	err := db.QueryRow("SELECT ip FROM `domains` WHERE domain = ?", domain.Domain).Scan(&SelectedData)

	if err != nil && err != sql.ErrNoRows {
		gologger.Error().Msg("error checking data existence:" + err.Error())
	}
	if rows != nil {
		rows.Close()
	}

	if SelectedData == "" {

		// Insert
		stmt, err := db.Prepare("INSERT INTO `domains`(`ip`, `domain`, `org`,`Alternative_DNS_Name`,`Alternative_IP`) VALUES ('?','?','?','?','?')")
		if err != nil {
			gologger.Error().Msg("error preparing insert statement:" + err.Error())
		}
		_, err = stmt.Exec(domain.IP, domain.Domain, domain.Org, domain.Alternative_DNS_Name, domain.Alternative_IP)
		if err != nil {
			gologger.Error().Msg("error inserting data:" + err.Error())
		}
		if stmt != nil {
			stmt.Close()
		}

		gologger.Info().Msg("Added [" + domain.Domain + "] [" + domain.IP + "] to DB !")
	}
}
