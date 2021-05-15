package com.shareinfo.adminManage.sys.dao.mybatis;

import org.springframework.stereotype.Repository;

import com.shareinfo.base.dao.mybatis.BaseDaoImpl;
import com.shareinfo.adminManage.sys.model.SysAreaModel;
import com.shareinfo.adminManage.sys.dao.SysAreaDao;

/**
 * @author 黄鹏 email:94300452@qq.com
 * @version 1.0
 * @since 1.0
 */
@Repository("sysAreaDao")
public class SysAreaDaoImpl extends BaseDaoImpl<SysAreaModel, java.lang.String> implements SysAreaDao{
	
	public String getMyBatisMapperNamesapce() {
		return "SysArea";
	}
}
