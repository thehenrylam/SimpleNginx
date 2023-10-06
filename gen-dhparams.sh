#!/bin/bash

cd ./config/
openssl dhparam -out dhparams.pem 4096 
cd ..

