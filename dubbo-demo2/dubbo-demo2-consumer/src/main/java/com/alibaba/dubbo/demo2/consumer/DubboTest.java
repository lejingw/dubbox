package com.alibaba.dubbo.demo2.consumer;


import com.alibaba.dubbo.container.Main;

import java.util.concurrent.CountDownLatch;

/**
 * Created by nange on 2015/7/16.
 */
public class DubboTest extends TestBase {
	public static int perExeCount;

	public DubboTest(String rpc, String[] args) {
		if (args == null || args.length < 1) {
			throw new RuntimeException("must input 2 paramter:clientNum,perCount");
		}
		if("warmup".equalsIgnoreCase(args[0])){
			if (args == null || args.length != 2) {
				throw new RuntimeException("must input at least 2 arg: warmup 20000");
			}
			init(1, Integer.parseInt(args[1]));
		}else if("start".equalsIgnoreCase(args[0])){
			if (args == null || args.length != 3) {
				throw new RuntimeException("must input at least 2 arg: start 10 100000");
			}
			init(Integer.parseInt(args[1]), Integer.parseInt(args[2]));
		}
		perExeCount = getPerCount();
		this.args = args;
	}

	String[] args;

	@Override
	public void exec(CountDownLatch startLatch, CountDownLatch endLatch) {
		try {
			startLatch.await();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
//        new Gridclient().start(getPerCount());
		Main.main(null);
		endLatch.countDown();
	}


	public static void main(String[] args) {
		new DubboTest("dubbo", args).start();
	}
}
