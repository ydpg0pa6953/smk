package com.shareinfo.adminManage.auto.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shareinfo.base.dao.BaseDao;
import com.shareinfo.base.service.impl.BaseServiceImpl;
import com.shareinfo.adminManage.auto.model.AutoDbModel;
import com.shareinfo.adminManage.auto.dao.AutoDbDao;
import com.shareinfo.adminManage.auto.service.AutoDbService;

@Service("autoDbService")
public class AutoDbServiceImpl extends BaseServiceImpl<AutoDbModel, java.lang.Integer>
		implements AutoDbService {

	@Resource(name = "autoDbDao")
	private AutoDbDao autoDbDao;

	@Override
	public BaseDao getBaseDao() {
		return autoDbDao;
	}

}
