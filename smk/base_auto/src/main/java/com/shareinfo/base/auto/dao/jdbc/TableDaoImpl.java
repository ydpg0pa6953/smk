/*
 * %W% %E%
 * Copyright (c)
 */
package com.shareinfo.base.auto.dao.jdbc;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.shareinfo.base.auto.dao.ITableDao;
import com.shareinfo.base.auto.vo.ColumnInfo;
import com.shareinfo.base.auto.vo.ConfigureDatabase;
import com.shareinfo.base.auto.vo.ConfigureInit;
import com.shareinfo.base.auto.vo.ResultInfo;
import com.shareinfo.base.dao.jdbc.SpringJdbcDaoImpl;

/**
 * @ClassName: TableDaoImpl
 * @Description: TODO
 * @author Huangpeng@shareinfo.com.cn
 * @date 2013年9月9日 下午4:52:57
 */
@Repository("tableDao")
public class TableDaoImpl extends SpringJdbcDaoImpl implements ITableDao {


	// 获得当前数据库是什么数据库。比如oracle，access等
	// dbMetaData.getDatabaseProductName()
	private String databaseProductName;

	/**
	 * 获取数据库连接
	 */
	private Connection getConnection(ConfigureDatabase configureDatabase) {
		try {
			Class.forName(configureDatabase.getDriver());
			Connection conn = DriverManager.getConnection(configureDatabase.getUrl(), configureDatabase.getUsername(), configureDatabase.getPassword());
			return conn;
		} catch (Exception ex) {
			return null;
		}
	}
	
	/**
	 * @Title: getKeyColumn
	 * @Description: 获取主键列表
	 */
	public ResultInfo getKeyColumn(ConfigureInit configureInit) {
		ResultInfo resultInfo = new ResultInfo();
		ConfigureDatabase configureDatabase = configureInit.getConfigureDatabase();
		List<String> list = new ArrayList<String>();
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = getConnection(configureDatabase);
			if (conn == null) {
				resultInfo.setMsg("数据库连接未建立");
				return resultInfo;
			}
			DatabaseMetaData dbMetaData = conn.getMetaData();
			rs = dbMetaData.getPrimaryKeys(configureDatabase.getCatalog(),configureDatabase.getSchema(),configureInit.getTableName());
			while (rs.next())
				list.add(rs.getString("COLUMN_NAME"));
			resultInfo.setResult(true);
			resultInfo.setObj(list);
			return resultInfo;
		} catch (SQLException e) {
			e.printStackTrace();
			resultInfo.setMsg("获取主键失败");
			return resultInfo;
		} 
	}

	/**
	 * @Title: getColumns
	 * @Description: 获取分类
	 */
	public ResultInfo getColumns(ConfigureInit configureInit) {
		ResultInfo resultInfo = new ResultInfo();
		ConfigureDatabase configureDatabase = configureInit.getConfigureDatabase();
		List<ColumnInfo> list = new ArrayList<ColumnInfo>();
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = getConnection(configureDatabase);
			if (conn == null) {
				resultInfo.setMsg("数据库连接未建立");
				return resultInfo;
			}
			DatabaseMetaData dbMetaData = conn.getMetaData();
			databaseProductName = dbMetaData.getDatabaseProductName();
			// 获得当前数据库是什么数据库。比如oracle，access等
			// System.out.println("数据库类型："+dbMetaData.getDatabaseProductName());
			rs = dbMetaData.getColumns(configureDatabase.getCatalog(),
					configureDatabase.getSchema(),
					configureInit.getTableName(), null);
			while (rs.next()) {
				list.add(getColumnInfo(rs));
			}
			resultInfo.setResult(true);
			resultInfo.setObj(list);
			return resultInfo;
		} catch (SQLException e) {
			e.printStackTrace();
			resultInfo.setMsg("获取表字段失败");
			return resultInfo;
		} 
	}

	/**
	 * @Title: 获取字段
	 */
	public ColumnInfo getColumnInfo(ResultSet rs) throws SQLException {
		// 打印测试
		//打印测试和后面的赋值不能同时开启，要不会报流关闭的异常，这个问题未发现原因
		//printRs(rs);
		ColumnInfo columnInfo = new ColumnInfo();
		columnInfo.setSqlColumnName(rs.getString("COLUMN_NAME"));
		columnInfo.setSqlDataType(rs.getInt("DATA_TYPE"));
		columnInfo.setSqlNullAble(rs.getInt("NULLABLE"));
		columnInfo.setSqlColumnSize(rs.getInt("COLUMN_SIZE"));
		columnInfo.setSqlRemarks(rs.getString("REMARKS"));
		if (columnInfo.getSqlRemarks() == null && isOracleDataBase()) {
			columnInfo.setSqlRemarks(getOracleColumnComments(rs.getString("TABLE_NAME"), rs.getString("COLUMN_NAME")));
		}
		//System.out.println("rs.getString(\"COLUMN_NAME\"):"+rs.getString("COLUMN_NAME"));
		columnInfo.setSqlColumnDef(rs.getString("COLUMN_DEF"));
		columnInfo.setSqlColumnSize(rs.getInt("COLUMN_SIZE"));
		columnInfo.setSqlDecimalDigits(rs.getInt("DECIMAL_DIGITS"));
		// columnInfo.setSqlIsAutoIncrement(rs.getString("IS_AUTOINCREMENT"));
		return columnInfo;
	}

	/**
	 * @Title: 判断是否是oracle数据库
	 */
	public boolean isOracleDataBase() {
		return databaseProductName.toLowerCase().equals("oracle");
	}

	/**
	 * @Title: 获取oracle的表描述
	 */
	public String getOracleTableComments(String table) {
		String sql = "SELECT comments FROM user_tab_comments WHERE table_name='"
				+ table + "'";
		Map<String, Object> map = execQueryForMap(sql, null);
		return map == null ? null : (String) map.get("comments");
	}

	/**
	 * @Title: 获取oracle的字段描述
	 */
	public String getOracleColumnComments(String table, String column) {
		String sql = "SELECT comments FROM user_col_comments WHERE table_name='"
				+ table + "' AND column_name = '" + column + "'";
		Map<String, Object> map = execQueryForMap(sql, null);
		return map == null ? null : (String) map.get("comments");
	}

	public void printRs(ResultSet rs) {
		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			for (int i = 1; i <= rsmd.getColumnCount(); i++) {
				System.out.println(rsmd.getColumnName(i) + ":"
						+ rs.getString(rsmd.getColumnName(i)));
			}
			System.out.println();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
