#!/bin/bash
#
rootPath=$1
testFile=$2
host=$3
rampUpPeriod=$4
timeDuration=$5
threads=$6
tenantId=$7

echo "Root path: $rootPath"
echo "Test file: $testFile"
echo "Host: $host"
echo "Ramp Up Period: $rampUpPeriod"
echo "Time Duration: $timeDuration"
echo "Threads: $threads"
echo "Tenant Id: $tenantId"

T_DIR=.

# Reporting dir: start fresh
R_DIR=$T_DIR/report
rm -rf $R_DIR > /dev/null 2>&1
mkdir -p $R_DIR

rm -f $T_DIR/test-plan.jtl $T_DIR/jmeter.log  > /dev/null 2>&1
ls -la
chmod 777 run.sh
ls -la
./run.sh $rootPath -Dlog_level.jmeter=DEBUG \
	-Jhost=$host \
    -Jduration=$timeDuration \
    -Jthreads=$threads \
    -Jrampup=$rampUpPeriod \
    -JtenantId=$tenantId \
	-n -t /test/$testFile -l $T_DIR/test-plan.jtl -j $T_DIR/jmeter.log \
	-e -o $R_DIR

echo "==== jmeter.log ===="
cat $T_DIR/jmeter.log

echo "==== Raw Test Report ===="
cat $T_DIR/test-plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in $R_DIR/index.html"