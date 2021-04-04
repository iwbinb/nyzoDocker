#!/bin/bash
echo "Reloading new config for nyzo-verifier";
nmem=`cat nmem`
ncore=`cat ncore`
echo -e "Memory: $nmem"
echo -e "CPU: $ncore"
docker update --memory $nmem --cpus $ncore nyzo-verifier;