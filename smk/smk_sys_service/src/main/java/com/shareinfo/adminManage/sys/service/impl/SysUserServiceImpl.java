package com.shareinfo.adminManage.sys.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shareinfo.base.dao.BaseDao;
import com.shareinfo.base.service.impl.BaseServiceImpl;
import com.shareinfo.adminManage.sys.model.SysUserModel;
import com.shareinfo.adminManage.sys.dao.SysUserDao;
import com.shareinfo.adminManage.sys.service.SysUserService;

@Service("sysUserService")
public class SysUserServiceImpl extends BaseServiceImpl<SysUserModel, java.lang.String>
		implements SysUserService {

	@Resource(name = "sysUserDao")
	private SysUserDao sysUserDao;

	@Override
	public BaseDao getBaseDao() {
		return sysUserDao;
	}

}
