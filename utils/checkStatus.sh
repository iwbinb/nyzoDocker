#!/bin/bash
echo "-------------------------------------------"
if [ $# -eq 0 ]
then
    echo "Self checking, querying 127.0.0.1 (localhost)"
    echo "-------------------------------------------"
    docker exec -it nyzo-verifier java -jar /nyzoVerifier/build/libs/nyzoVerifier-1.0.jar co.nyzo.verifier.scripts.StatusRequestScript 127.0.0.1
else
    echo "Checking other node status $1" 
    echo "-------------------------------------------"
    docker exec -it nyzo-verifier java -jar /nyzoVerifier/build/libs/nyzoVerifier-1.0.jar co.nyzo.verifier.scripts.StatusRequestScript $1
fi
