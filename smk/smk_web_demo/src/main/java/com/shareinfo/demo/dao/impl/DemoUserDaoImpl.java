package com.shareinfo.demo.dao.impl;

import org.springframework.stereotype.Repository;

import com.shareinfo.base.dao.mybatis.BaseDaoImpl;
import com.shareinfo.demo.dao.DemoUserDao;
import com.shareinfo.demo.model.DemoUserModel;

@Repository("demoUserDao")
public class DemoUserDaoImpl extends BaseDaoImpl<DemoUserModel, Integer> implements DemoUserDao{
	
	public String getMyBatisMapperNamesapce() {
		return "DemoUser";
	}

}
