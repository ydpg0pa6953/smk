package com.shareinfo.demo.service.impl;

import javax.annotation.Resource;

import lombok.Setter;

import org.springframework.stereotype.Service;

import com.shareinfo.base.dao.BaseDao;
import com.shareinfo.base.service.impl.BaseServiceImpl;
import com.shareinfo.demo.dao.DemoUserDao;
import com.shareinfo.demo.model.DemoUserModel;
import com.shareinfo.demo.service.DemoUserService;

@Service("demoUserService")
public class DemoUserServiceImpl extends BaseServiceImpl<DemoUserModel, Integer> implements DemoUserService {

	@Setter
	private DemoUserDao demoUserDao;

	@Override
	public BaseDao<DemoUserModel, Integer> getBaseDao() {
		return demoUserDao;
	}

	public void saveList() {
		DemoUserModel model = new DemoUserModel();
		model.setAccount("94300452@qq.com");
		model.setName("黄鹏");
		model.setPassword("hp");
		model.setEmail("94300452@qq.com");
		for (int i = 0; i < 5; i++) {
			getBaseDao().save(model);
			System.out.println("model.id:" + model.getId());
			if (i == 2) {
				throw new RuntimeException();
			}
		}
	}
}
