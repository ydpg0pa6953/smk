/*
 * %W% %E%
 * Copyright (c)
 */
package com.shareinfo.base.auto.vo;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

import lombok.Data;

/**
 * @ClassName: TableInfo
 * @Description: TODO
 * @author Huangpeng@shareinfo.com.cn
 * @date 2013年9月3日 上午9:22:51
 */
@Data
public class TableInfo {
	// 表主键信息
	private List<String> keyColumn = new ArrayList<String>();
	// 表字段信息
	private List<ColumnInfo> columns = new ArrayList<ColumnInfo>();
	// 主键字段
	private List<ColumnInfo> keyColumns;
	// 非主键字段
	private List<ColumnInfo> notKeyColumns;
	// 主键类型
	private Object keyJavaType;

	public List<ColumnInfo> initKeyColumns() {
		keyColumns = new ArrayList<ColumnInfo>();
		notKeyColumns = new ArrayList<ColumnInfo>();
		for (int i = 0; i < keyColumn.size(); i++) {
			for (int j = 0; j < columns.size(); j++) {
				// 判断是否和主键相同的话
				if (keyColumn.get(i).equals(columns.get(j).getSqlColumnName())) {
					keyColumns.add(columns.get(j));
					columns.get(j).setPK(true);
				}else{
					notKeyColumns.add(columns.get(j));
				}
			}
		}
		if (keyColumn.size() == 1) {
			keyJavaType = keyColumns.get(0).getClassDataType();
		} else {
			keyJavaType = "java.util.HashMap";
		}
		return keyColumns;
	}
	
}
