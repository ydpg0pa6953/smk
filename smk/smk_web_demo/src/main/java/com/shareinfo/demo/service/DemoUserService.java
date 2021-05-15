package com.shareinfo.demo.service;

import com.shareinfo.base.service.BaseService;
import com.shareinfo.demo.model.DemoUserModel;

public interface DemoUserService extends BaseService<DemoUserModel, Integer> {
	public void saveList();
}
