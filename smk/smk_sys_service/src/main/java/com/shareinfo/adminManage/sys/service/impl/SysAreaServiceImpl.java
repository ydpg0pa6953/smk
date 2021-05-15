package com.shareinfo.adminManage.sys.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shareinfo.base.dao.BaseDao;
import com.shareinfo.base.service.impl.BaseServiceImpl;
import com.shareinfo.adminManage.sys.model.SysAreaModel;
import com.shareinfo.adminManage.sys.dao.SysAreaDao;
import com.shareinfo.adminManage.sys.service.SysAreaService;

@Service("sysAreaService")
public class SysAreaServiceImpl extends BaseServiceImpl<SysAreaModel, java.lang.String>
		implements SysAreaService {

	@Resource(name = "sysAreaDao")
	private SysAreaDao sysAreaDao;

	@Override
	public BaseDao getBaseDao() {
		return sysAreaDao;
	}

}
