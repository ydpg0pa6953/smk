package com.shareinfo.adminManage.sys.query;

import java.io.Serializable;
import lombok.Data;
import com.shareinfo.base.query.BaseQuery;

public @Data class SysUserQuery extends BaseQuery implements Serializable{
		private java.lang.String id;
		private java.lang.String companyId;
		private java.lang.String officeId;
		private java.lang.String loginName;
		private java.lang.String password;
		private java.lang.String no;
		private java.lang.String name;
		private java.lang.String email;
		private java.lang.String phone;
		private java.lang.String mobile;
		private java.lang.String userType;
		private java.lang.String loginIp;
		private java.util.Date loginDate;
		private java.lang.String createBy;
		private java.util.Date createDate;
		private java.lang.String updateBy;
		private java.util.Date updateDate;
		private java.lang.String remarks;
		private java.lang.String delFlag;

}