package com.shareinfo.base.auto.vo;

import lombok.Data;

/**
 * @ClassName: SysDbInfo
 * @Description: 系统数据库信息
 * @author Huangpeng@shareinfo.com.cn
 * @date 2014年2月21日 上午11:22:29
 */
public @Data
class ConfigureDatabase {

	private String driver;

	private String url;

	private String username;

	private String password;
	// 数据库名，对于oracle来说就用户名
	private String schema;
	// 目录名称，一般都为空
	private String catalog;

}
