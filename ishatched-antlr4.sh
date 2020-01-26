#/bin/bash

# First check if it is just natively installed on the system somewhere in PATH

installdir="$(bootstrapinstalldir)"
if [ $? -ne 0 ] ; then
   #echo "bootstrapinstalldir=${installdir} exited with error" > /dev/stderr
   exit 1
elif [ ! -d "${installdir}/lib/jars" ] ; then
   #echo "bootstrapinstalldir=${installdir}/bin doesn't exist" > /dev/stderr
   exit 1
fi

cd "${installdir}/lib/jars"
antlrIsInstalled=$(ls antlr-4.*.jar 2> /dev/null)
if [ -z "$antlrIsInstalled" ] ; then
   #echo "${installdir}/lib/jars/antlr*.jar doesn't exist" > /dev/stderr
   # Note return 1 is false
   exit 1
else
   #echo "Good news! Found: ${installdir}/lib/jars/antlr*.jar" > /dev/stderr
   exit 0
fi

