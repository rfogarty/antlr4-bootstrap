#!/bin/bash

mkdir -p antlr4
cd antlr4
bootstrapHttpGet http://www.antlr.org/download/antlr-4.8-complete.jar
curlRetval=$?
if [ $curlRetval -ne 0 ] ; then
   echo "ERROR: curl reported error $curlRetval."
   echo "       Check ANTLR4.Bootstrap configuration file $0"
   exit 1
elif [ ! -e antlr-4.8-complete.jar ] ; then
   echo "ERROR: curl did not pull antlr4 target properly."
   echo "       Check ANTLR4.Bootstrap configuration file $0"
   exit 1
fi
cd ..

# Move artifacts to the nest
bootstrapnest antlr4

