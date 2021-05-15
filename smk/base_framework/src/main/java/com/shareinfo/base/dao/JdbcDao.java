package com.shareinfo.base.dao;

import java.util.Map;

import javax.sql.DataSource;

public interface JdbcDao {
	
	public void setDataSource(DataSource dataSource);

	public Map<String,Object> execQueryForMap(String sql,Object[] args);
}
