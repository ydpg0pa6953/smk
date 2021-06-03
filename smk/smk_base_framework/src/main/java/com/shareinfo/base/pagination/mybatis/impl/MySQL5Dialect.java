package com.shareinfo.base.pagination.mybatis.impl;

import com.shareinfo.base.pagination.mybatis.Dialect;

public class MySQL5Dialect implements Dialect {

	@Override
	public String getPaginationSql(String sql, int offset, int limit) {
		return sql + " limit " + offset + "," + limit;
	}

}
