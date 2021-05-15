/*
 * %W% %E%
 *
 * Copyright (c)
 */
package com.shareinfo.base.auto.dao;

import java.util.List;

import com.shareinfo.base.auto.vo.ColumnInfo;
import com.shareinfo.base.auto.vo.ConfigureInit;
import com.shareinfo.base.auto.vo.ResultInfo;
import com.shareinfo.base.dao.JdbcDao;

/** 
 * @ClassName: ITableDao 
 * @Description: TODO
 * @author Huangpeng@shareinfo.com.cn
 * @date 2013年9月10日 下午2:30:12 
 *  
 */
public interface ITableDao extends JdbcDao{

	/**
	 * 
	 * @Title: getKeyColumn
	 * @Description: 获取主键列表
	 */
	public ResultInfo getKeyColumn(ConfigureInit configureInit);

	/**
	 * @Title: getColumns
	 * @Description: 获取分类
	 */
	public ResultInfo getColumns(ConfigureInit configureInit);

}