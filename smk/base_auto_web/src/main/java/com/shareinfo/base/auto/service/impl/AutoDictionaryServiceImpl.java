package com.shareinfo.base.auto.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shareinfo.base.dao.BaseDao;
import com.shareinfo.base.service.impl.BaseServiceImpl;
import com.shareinfo.base.auto.model.AutoDictionaryModel;
import com.shareinfo.base.auto.dao.AutoDictionaryDao;
import com.shareinfo.base.auto.service.AutoDictionaryService;

@Service("sysUserService")
public class AutoDictionaryServiceImpl extends BaseServiceImpl<AutoDictionaryModel, java.lang.String>
		implements AutoDictionaryService {

	@Resource(name = "autoDictionaryDao")
	private AutoDictionaryDao autoDictionaryDao;

	@Override
	public BaseDao getBaseDao() {
		return autoDictionaryDao;
	}

}
