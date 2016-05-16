package com.alibaba.dubbo.demo2.consumer;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public abstract class TestBase {
	public static final CountDownLatch startLatch = new CountDownLatch(1);
	public static CountDownLatch endLatch = new CountDownLatch(0);
	int perCount;
	int clientNum;

	public void init(int clientNum, int perCount) {
		this.clientNum = clientNum;
		this.perCount = perCount;
		endLatch = new CountDownLatch(clientNum);
	}

	public abstract void exec(CountDownLatch startLatch, CountDownLatch endLatch);


	public int getPerCount() {
		return perCount;
	}

	public int getClientNum() {
		return clientNum;
	}

	public void start() {
		ExecutorService executor = Executors.newFixedThreadPool(clientNum);
		for (int j = 0; j < clientNum; j++) {
			executor.submit(new Runnable() {

				public void run() {
					exec(TestBase.startLatch, TestBase.endLatch);
				}
			});
		}

		try {
			startLatch.countDown();
			long start = System.currentTimeMillis();

			endLatch.await();

			double seconds = (System.currentTimeMillis() - start) / 1000.0;
			int totalCount = perCount * clientNum;

			System.out.println("thread count:" + clientNum);
			System.out.println("request count per thread:" + perCount);
			System.out.println("total request count:" + totalCount);
			System.out.println("total request time:" + seconds);
			System.out.println("tps:" + totalCount / seconds);

			executor.shutdown();
			System.exit(0);
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
		}

	}


}
