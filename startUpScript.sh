#!/bin/bash
docker pull ubuntu
docker build --tag=forkbomb .
docker run -p 4000:80 forkbomb
