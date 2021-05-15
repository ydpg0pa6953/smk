package com.shareinfo.base.auto.vo;

import lombok.Data;

/**
 * @ClassName: ObjectInfo
 * @Description: 初始化配置
 * @author Huangpeng@shareinfo.com.cn
 * @date 2014年2月21日 上午10:36:08
 */
public @Data
class ConfigureInit {
	// 使用的模板
	private ConfigureTemplate configureTemplate;
	// 数据库连接
	private ConfigureDatabase configureDatabase;
	// 包名（小写）
	private String packageName;
	// 实体类名（首字母大写）
	private String className;
	// 表名
	private String tableName;
	// 表描述
	private String comments;
	// 支持的框架
	private String supportFrame;
	// 支持的框架包含hibernate
	private ConfigureHibernate configureHibernate;
	// 支持的框架包含Mybatis
	private ConfigureMybatis configureMybatis;
	// 通过数据库获取表的信息
	private TableInfo tableInfo;
}
