#!/bin/bash

. setenv.sh

case $1 in
compile)
  echo ">>>>>>>>start compile"
  mvn clean test-compile package
  echo ">>>>>>>>finish compile"
  ;;
start)
  java -Xms2G -Xmx2G -classpath ./target/test-classes:./target/dubbo-demo2-provider-2.8.4/lib/*  -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:gc1.log -Dwrite.statistics=true com.alibaba.dubbo.demo2.provider.DemoProvider
  ;;
clean)
  rm -rf target
  ;;
*)
  echo "Usage:"
  echo "    compile                     : compile the test source"
  echo "    start                       : start the server"
  echo "    clean 			            : clean log file"
  ;;
esac
