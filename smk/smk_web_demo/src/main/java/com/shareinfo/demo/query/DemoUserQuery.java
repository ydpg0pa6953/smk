package com.shareinfo.demo.query;

import lombok.Data;

import com.shareinfo.base.query.BaseQuery;

public @Data class DemoUserQuery extends BaseQuery {
	private long id;
	private String account;
	private String name;
	private String password;
	private String email;
}
