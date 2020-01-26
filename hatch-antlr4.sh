#!/bin/bash

function exitWithError() {
   
   local scriptname=$1
   local exitErrVal=$2
   shift 2
   for errmsg in "$@" ; do
      echo "$errmsg" > /dev/stderr
   done
   echo "Aborting $scriptname" > /dev/stderr
   exit $exitErrVal
}

# STEP 1: Attempt to locate antlr artifact directory
bootstraplocateegg antlr4 || exitWithError $0 1

# STEP 2: Attempt to copy jar to installation area
installdir="$(bootstrapinstalldir)"
if [ $? -ne 0 ] ; then
   exitWithError $0 1 "ERROR: unable to locate BootstrapBuild installation area."
   exit 1
fi

antlrjarname=$(ls antlr*.jar 2> /dev/null)

if [ -z "${antlrjarname}" ] ; then
   exitWithError $0 1 "ERROR: unable to locate antlr's jar file."
   exit 1
fi

mkdir -p "${installdir}/lib/jars" || exitWithError $0 1 "ERROR: unable to create \"${installdir}/lib/jars\" folder"

cp ${antlrjarname} "${installdir}/lib/jars/" || exitWithError $0 1 "ERROR: unable to copy ${antlrjarname} to \"${installdir}/lib/jars\" folder"

# If no errors exit with success (0), yeah, this doesn't need to be explicitly called...
exit 0

