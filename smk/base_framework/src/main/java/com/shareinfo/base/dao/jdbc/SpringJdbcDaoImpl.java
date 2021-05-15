package com.shareinfo.base.dao.jdbc;

import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.shareinfo.base.dao.JdbcDao;

public class SpringJdbcDaoImpl implements JdbcDao {

	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public DataSource getDataSource() {
		return dataSource;
	}
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Override
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public Map<String, Object> execQueryForMap(String sql, Object[] args) {
		return jdbcTemplate.queryForMap(sql, args);
	}

}
