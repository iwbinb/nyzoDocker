#!/bin/bash
docker-compose build;
nmem=`cat nmem`
ncore=`cat ncore`
docker run --name nyzo-verifier --memory $nmem --cpus $ncore -p 9444:9444 -p 9446:9446/udp -d nyzo-verifier;