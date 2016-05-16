#!/bin/bash

if [ -z "$BASE" ] ; then
	cd `dirname $0`/..
	BASE=`pwd`
fi

#CLASSPATH=.:$JAVA_HOME/lib/*:$BASE/conf:$BASE/libs/*

PROJECT_DIR_NAME=`basename \`pwd\``
ISRUN=$(ps ux|grep "$PROJECT_DIR_NAME/" |grep java |wc -l |sed 's/ //g')

#-XX:+ExplicitGCInvokesConcurrent or -XX:+DisableExplicitGC
#JAVA_CONF="-server -Xmx1G -Xms1G -Xmn600M -XX:PermSize=64M -XX:MaxPermSize=128M -Xss256K -XX:+ExplicitGCInvokesConcurrent -XX:SurvivorRatio=1 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:+UseCMSCompactAtFullCollection -XX:CMSFullGCsBeforeCompaction=0 -XX:+CMSClassUnloadingEnabled -XX:LargePageSizeInBytes=128M -XX:+UseFastAccessorMethods -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=80 -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+PrintClassHistogram -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintHeapAtGC -Xloggc:gc.log -Dfile.encoding=UTF-8"
