/*
 * %W% %E%
 * Copyright (c)
 */
package com.shareinfo.base.auto.vo;

import lombok.Data;

import com.shareinfo.base.auto.util.CamelCaseUtils;
import com.shareinfo.base.auto.util.SqlTypeUtils;

/**
 * @ClassName: ColumnInfo
 * @Description: 数据库表Column对象
 * @author Huangpeng@shareinfo.com.cn
 * @date 2013年9月3日 上午9:25:47
 */
public @Data
class ColumnInfo {
	// column name
	// 数据库_字段名称
	private String sqlColumnName;
	//
	private boolean isPK;
	// SQL type from java.sql.Types
	// 数据库_字段类型
	private int sqlDataType;
	// column size
	// 数据库_字段长度
	private int sqlColumnSize;
	// 如果是oracle的number的时候wei为小数点部分
	private int sqlDecimalDigits;
	// Indicates whether this column is auto incremented。YES、NO、empty string
	// 数据库_是否自增
	private String SqlIsAutoIncrement;
	// is NULL allowed
	// 数据库_是否允许为空
	private int sqlNullAble;
	// comment describing column (may be <code>null</code>)
	// 数据库_字段描述
	private String sqlRemarks;
	// default value for the column, which should be interpreted as a string
	// when the value is enclosed in single quotes (may be <code>null</code>)
	// 数据库_默认值
	private String sqlColumnDef;
	// 类_对应字段名称
	private String classColumnName;
	// 类_类型
	private String classDataType = "java.lang.String";
	// 是否是时间类型
	private boolean isDateTimeColumn = false;

	public String getClassColumnName() {
		// 数据库命名转类命名
		return CamelCaseUtils.toCamelCase(sqlColumnName);
	}

	public String getClassDataType() {
		return SqlTypeUtils.getJavaType(null, sqlDataType);
	}
	
	public boolean getIsDateTimeColumn() {
		return SqlTypeUtils.isDateType(null, sqlDataType);
	}
	
	public boolean getNullAble() {
		return sqlNullAble == 0 ? false : true;
	}

	
}
