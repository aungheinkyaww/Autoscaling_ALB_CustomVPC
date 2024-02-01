#!/bin/bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo docker run -p 80:8080 -d aungheinkyaw/sample-nodejs:v4