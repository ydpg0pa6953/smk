package com.shareinfo.base.auto.vo;

import lombok.Data;

/**
 * @ClassName: HibernateInfo
 * @Description: hibernate信息
 * @author Huangpeng@shareinfo.com.cn
 * @date 2014年2月21日 上午10:38:52
 */
public @Data class ConfigureHibernate {
	//主键生成策略
	private String generator;
	//若生成策略为序列方式的话则序列值
	private String sequenceName;
	
}
