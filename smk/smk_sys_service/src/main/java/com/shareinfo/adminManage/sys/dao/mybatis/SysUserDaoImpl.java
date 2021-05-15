package com.shareinfo.adminManage.sys.dao.mybatis;

import org.springframework.stereotype.Repository;

import com.shareinfo.base.dao.mybatis.BaseDaoImpl;
import com.shareinfo.adminManage.sys.model.SysUserModel;
import com.shareinfo.adminManage.sys.dao.SysUserDao;

/**
 * @author 黄鹏 email:94300452@qq.com
 * @version 1.0
 * @since 1.0
 */
@Repository("sysUserDao")
public class SysUserDaoImpl extends BaseDaoImpl<SysUserModel, java.lang.String> implements SysUserDao{
	
	public String getMyBatisMapperNamesapce() {
		return "SysUser";
	}
}
