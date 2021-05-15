package com.shareinfo.adminManage.sys.query;

import java.io.Serializable;
import lombok.Data;
import com.shareinfo.base.query.BaseQuery;

public @Data class SysAreaQuery extends BaseQuery implements Serializable{
		private java.lang.String id;
		private java.lang.String parentId;
		private java.lang.String parentIds;
		private java.lang.String code;
		private java.lang.String name;
		private java.lang.String type;
		private java.lang.String createBy;
		private java.util.Date createDate;
		private java.lang.String updateBy;
		private java.util.Date updateDate;
		private java.lang.String remarks;
		private java.lang.String delFlag;

}