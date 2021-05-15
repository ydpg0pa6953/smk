package com.shareinfo.base.pagination.mybatis;

/**
 * @ClassName: Dialect
 * @Description: 数据库方言
 * @author Huangpeng@shareinfo.com.cn
 * @date 2014年5月14日 下午5:32:08
 */
public interface Dialect {
	public static enum Type {
		MYSQL {
			public String getValue() {
				return "mysql";
			}
		},
		SQLSERVER {
			public String getValue() {
				return "sqlserver";
			}
		},
		ORACLE {
			public String getValue() {
				return "oracle";
			}
		};

		public abstract String getValue();
	}

	/**
	 * 获取分页sql
	 * 
	 * @param sql
	 *            原始查询sql
	 * @param offset
	 *            开始记录索引（从0开始计数）
	 * @param limit
	 *            每页记录大小
	 * @return 数据库相关的分页sql
	 */
	public String getPaginationSql(String sql, int offset, int limit);

}
