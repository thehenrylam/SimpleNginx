# SimpleNginx
A simple Nginx instance powered by Docker

## Setup Instructions

Execute the following commands:

``` BASH
# This command will generate ./config/dhparams.pem (To enable SSL) (NOTE: This takes a while)
./gen-dhparams.sh 
# This command will generate ./certs/privkey.pem and ./certs/fullchain.pem (To enable SSL)
./gen-certs.sh
```

## Start/Stop Instructions

Commands:
* Start: `docker compose up -d`
* Stop: `docker compose down`

