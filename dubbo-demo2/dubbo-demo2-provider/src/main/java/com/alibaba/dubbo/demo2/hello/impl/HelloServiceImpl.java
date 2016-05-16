package com.alibaba.dubbo.demo2.hello.impl;

import com.alibaba.dubbo.demo2.hello.HelloService;
import com.alibaba.dubbo.demo2.hello.Order;

public class HelloServiceImpl implements HelloService {
	public Order hello(Order name) {
		return name;
	}
}
