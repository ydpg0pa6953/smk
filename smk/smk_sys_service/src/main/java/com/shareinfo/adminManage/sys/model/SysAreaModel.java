package com.shareinfo.adminManage.sys.model;

import lombok.Data;

public @Data class SysAreaModel {
		private java.lang.String id;//编号
		private java.lang.String parentId;//父级编号
		private java.lang.String parentIds;//所有父级编号
		private java.lang.String code;//区域编码
		private java.lang.String name;//区域名称
		private java.lang.String type;//区域类型
		private java.lang.String createBy;//创建者
		private java.util.Date createDate;//创建时间
		private java.lang.String updateBy;//更新者
		private java.util.Date updateDate;//更新时间
		private java.lang.String remarks;//备注信息
		private java.lang.String delFlag;//删除标记

}