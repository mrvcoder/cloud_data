# Cloud Data

## Supported clouds
- AWS
- Amazon
- Digitalocean
- Google
- Microsoft
- Oracle
- GCP

## Data Sources
- [trickset's cloud data](https://github.com/trickest/cloud)
- [kaeferjaeger.gay's cloud data](http://kaeferjaeger.gay/?dir=sni-ip-ranges)

this repo is gathering data from mentioned data sources and parse the data and finds some useful info about targets which you set them
in `targets.txt` file :D

## Usage
- Give a star to project :D
- Fork this repo
- Enable Github Actions in your forked repo
- Edit `targets.txt` file and add your targets (domain or ip)
  
**Actions will run every 7 days** And the outputs will be in `outputs/{{YourTarget.txt}}`.

You can schedule of running this app by editing actions file `app.yml` (cron value)
