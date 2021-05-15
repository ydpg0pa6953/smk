package com.shareinfo.demo.model;

import lombok.Data;

public @Data
class DemoUserModel {
	private long id;
	private String account;
	private String name;
	private String password;
	private String email;
}
