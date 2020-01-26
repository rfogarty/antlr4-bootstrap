#!/bin/bash

# Product may check one or more areas to see if it is fully laid,
# i.e. all artifacts of the product have been pulled down.
bootstraplocateegg antlr4
if [ $? -ne 0 ] ; then
   #echo "ANTLR4 is not yet laid"
   exit 1
else
   exit 0
fi
