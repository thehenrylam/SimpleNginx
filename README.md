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

## Recommendations

Since Nginx hosts are typically exposed to the internet, its best to set up a firewall and only enable the ports that is needed:
* 80  (http)
* 443 (https)
* Stream Ports (The ports that are used in the `*.conf` files under the stream-available/ folder

### How to set it up using ufw (typically used in Ubuntu hosts)

``` 
# Check if ufw is enabled or not
bash$ sudo ufw status 
# If ufw isn't enabled, then enable it
bash$ sudo ufw enable
# Check again to make sure that ufw is enabled 
bash$ sudo ufw status

# Example: Enable HTTP(S) ports
bash$ sudo ufw allow 80
bash$ sudo ufw allow 443

# Example: Check what the what ports ufw is denying/allowing/disabling
bash$ sudo ufw status verbose
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), deny (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
80                         ALLOW IN    Anywhere                  
443                        ALLOW IN    Anywhere                  
80 (v6)                    ALLOW IN    Anywhere (v6)             
443 (v6)                   ALLOW IN    Anywhere (v6)             

# Example: Remove allowed ports (suppose you don't want to allow the http port)
bash$ sudo ufw delete allow 80
```

