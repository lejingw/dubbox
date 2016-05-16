#!/bin/bash

. setenv.sh

case $1 in
package)
  echo ">>>>>>>>start package"
  mvn clean package -Dmaven.test.skip=true
  echo ">>>>>>>>finish package"
  ;;
warmup)
  java -Xms2G -Xmx2G -classpath ./target/classes:./target/dubbo-demo2-consumer-2.8.4/lib/*  -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:gc1.log -Dwrite.statistics=true com.alibaba.dubbo.demo2.consumer.DubboTest warmup $2
  ;;
start)
  java -Xms2G -Xmx2G -classpath ./target/classes:./target/dubbo-demo2-consumer-2.8.4/lib/*  -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:gc1.log -Dwrite.statistics=true com.alibaba.dubbo.demo2.consumer.DubboTest start $2 $3 >>benchmark$2.log
  ;;
clean)
  rm -rf target
  rm -rf benchmark*.log
  rm -rf gc1.log
  ;;
*)
  echo "Usage:"
  echo "    package                     : package the test source"
  echo "    warmup <count>              : warm-up the jvm for test"
  echo "    start <threads> <perCount>  : execute test"
  echo "    clean 			: clean log file"
  ;;
esac
