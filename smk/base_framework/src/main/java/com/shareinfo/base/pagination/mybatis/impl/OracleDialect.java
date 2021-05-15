package com.shareinfo.base.pagination.mybatis.impl;

import com.shareinfo.base.pagination.mybatis.Dialect;

public class OracleDialect implements Dialect {

	@Override
	public String getPaginationSql(String sql, int offset, int limit) {
		return "select * from (select rownum rn, t.* from (" + sql
				+ ") t where rownum <= " + (offset+limit)
				+ ") t1 where t1.rn > " + offset;
	}

}
