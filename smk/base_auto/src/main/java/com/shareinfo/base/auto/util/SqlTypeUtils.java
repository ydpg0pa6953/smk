package com.shareinfo.base.auto.util;

import java.sql.Types;

/**
 * @ClassName: SqlTypeToJavaType
 * @Description: sql类型转java类型
 * @author Huangpeng@shareinfo.com.cn
 * @date 2014年2月24日 下午4:35:38
 */
public class SqlTypeUtils {

	// 参数：db 数据库oracle\sqlserver\mysql
	public static String getJavaType(String db, int sqlType) {
		switch (sqlType) {
		case Types.BIGINT:
			return "java.lang.Long";
		case Types.BOOLEAN:
			return "java.lang.Boolean";
		case Types.DATE:
			return "java.util.Date";
		case Types.DOUBLE:
			return "java.lang.Double";
		case Types.FLOAT:
			return "java.lang.Float";
		case Types.INTEGER:
			return "java.lang.Integer";
		case Types.DECIMAL:
			return "java.lang.Long";
		case Types.SMALLINT:
			return "java.lang.Integer";
		case Types.TIMESTAMP:
			return "java.sql.Timestamp";
		case Types.TINYINT:
			return "java.lang.Short";
		case Types.CHAR:
			return "java.lang.String";
		case Types.VARCHAR:
			return "java.lang.String";
		case Types.NCHAR:
			return "java.lang.String";
		case Types.NVARCHAR:
			return "java.lang.String";
		case Types.BIT:
			return "java.lang.Byte";
		default:
			return null;
		}
	}

	// 参数：db 数据库oracle\sqlserver\mysql
	public static boolean isDateType(String db, int sqlType) {
		switch (sqlType) {
		case Types.DATE:
			return true;
		case Types.TIMESTAMP:
			return true;
		case Types.TINYINT:
		default:
			return false;
		}
	}
}
