package com.shareinfo.demo.service.impl;

import org.springframework.stereotype.Service;

import com.shareinfo.demo.service.DemoTestService;

@Service("demoTestService")
public class DemoTestServiceImpl implements DemoTestService{

	@Override
	public void sayHello() {
		System.out.println("hello!");
	}

}
