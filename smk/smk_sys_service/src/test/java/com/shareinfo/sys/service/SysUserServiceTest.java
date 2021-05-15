package com.shareinfo.sys.service;

import java.util.Date;
import java.util.List;

import org.junit.Test;

import test.BaseTest;

import com.shareinfo.base.factory.SpringBeanFactory;
import com.shareinfo.sys.model.SysUserModel;
import com.shareinfo.sys.query.SysUserQuery;

public class SysUserServiceTest extends BaseTest {
	private SysUserService sysUserService = (SysUserService) SpringBeanFactory.getBean("sysUserService");

	/** 查询数据 */
	@Test
	public void selectListTest(){
		SysUserQuery query=new SysUserQuery();
		List<SysUserModel> list=sysUserService.selectList(query);
		System.out.println(list);
	}
	
	/** 增加数据 */
	@Test
	public void saveTest() {
		try {
			SysUserModel model = new SysUserModel();
			model.setUserId("94300453");
			model.setPwd("123456");
			model.setJoinDate(new Date());
			model.setLogins(0);
			model.setLastLoginDate(new Date());
			model.setLastLoginIp("127.0.0.1");
			model.setState(0);
			model.setMobile("18107218207");
			model.setEmail("94300452@qq.com");
			model.setUserRemark("");
			model.setDeptId(1);
			int result = sysUserService.save(model);
			System.out.println("result:" + result);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/** 删除数据 */
	@Test
	public void deleteByIdTest() {
		java.lang.String id = null;
		SysUserModel model = (SysUserModel) sysUserService.getById(id);
		if (model != null) {
			int result = sysUserService.deleteById(id);
			System.out.println("result:" + result);
		} else {
			System.out.println("未找到对象");
		}
	}

	/** 修改数据 */
	@Test
	public void updateTest() {
		java.lang.String id = null;
		SysUserModel model = sysUserService.getById(id);
		if (model != null) {
			int result = sysUserService.update(model);
			System.out.println("result:" + result);
		} else {
			System.out.println("未找到对象");
		}
	}
	
	/** 查询数据 */
	@Test
	public void getByIdTest(){
		java.lang.String id = "hp";
		SysUserModel model = sysUserService.getById(id);
		if (model != null) {
			System.out.println( model);
		} else {
			System.out.println("未找到对象");
		}
	}
	/*
	*//** 查询数据 */
	/*
	 * public Object getById(PK id){
	 * 
	 * }
	 *//** 根据id检查是否插入或是更新数据 */
	/*
	 * public void saveOrUpdate(E entity){
	 * 
	 * }
	 *//** 查询总数 */
	/*
	 * public Integer count(BaseQuery query){
	 * 
	 * }
	 *//** 查询所有数据 */
	/*
	 * public List<E> selectList(BaseQuery query){
	 * 
	 * }
	 */

}