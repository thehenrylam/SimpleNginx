#!/bin/bash

function gen_privkey {
	if [[ ! -f "./privkey.pem" ]]; then
		echo "Generating privkey.pem!"
		openssl genrsa > privkey.pem
		TMP_STATUS_CODE=$?
		if [[ $TMP_STATUS_CODE -ne 0 ]]; then
			echo "ERROR: Generation of the privkey.pem file failed."
			exit 1
		fi 
	else 
		echo "The privkey.pem file already exists, skipping..."
	fi
}

function gen_fullchain {
	if [[ ! -f "./fullchain.pem" ]]; then
		echo "Generating fullchain.pem!"
		openssl req -new -x509 -key privkey.pem > fullchain.pem
		TMP_STATUS_CODE=$?
		if [[ $TMP_STATUS_CODE -ne 0 ]]; then
			echo "ERROR: Generation of the fullchain.pem file failed."
			exit 1
		fi 
	else
		echo "The fullchain.pem file already exists, skipping..."
	fi 
}

echo "Generating key files in ./certs/ folder"

cd ./certs/
gen_privkey
gen_fullchain
cd ..

echo "Completed generating key files in ./certs/ folder"

