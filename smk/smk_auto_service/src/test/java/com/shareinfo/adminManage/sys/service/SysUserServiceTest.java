package com.shareinfo.adminManage.sys.service;

import java.util.List;

import org.junit.Test;
import org.springframework.dao.DataAccessException;

import test.BaseTest;

import com.shareinfo.base.query.BaseQuery;
import com.shareinfo.base.factory.SpringBeanFactory;
import com.shareinfo.adminManage.sys.model.SysUserModel;

public class SysUserServiceTest extends BaseTest{
	private SysUserService sysUserService=(SysUserService)SpringBeanFactory.getBean("sysUserService");
	
	@Test
	/** 增加数据 */
	public void saveTest(){
		SysUserModel model=new SysUserModel();
			model.setId(null);
			model.setCompanyId(null);
			model.setOfficeId(null);
			model.setLoginName(null);
			model.setPassword(null);
			model.setNo(null);
			model.setName(null);
			model.setEmail(null);
			model.setPhone(null);
			model.setMobile(null);
			model.setUserType(null);
			model.setLoginIp(null);
			model.setLoginDate(null);
			model.setCreateBy(null);
			model.setCreateDate(null);
			model.setUpdateBy(null);
			model.setUpdateDate(null);
			model.setRemarks(null);
			model.setDelFlag(null);
		int result=sysUserService.save(model);
		System.out.println("result:"+result);
	}

	@Test
	/** 删除数据 */
	public void deleteByIdTest(){
		java.lang.String id=null;
		SysUserModel model=(SysUserModel)sysUserService.getById(id);
		if(model!=null){
			int result=sysUserService.deleteById(id);
			System.out.println("result:"+result);
		}else{
			System.out.println("未找到对象");
		}
	}

	@Test
	/** 修改数据 */
	public void updateTest(){
		java.lang.String id=null;
		SysUserModel model=(SysUserModel)sysUserService.getById(id);
		if(model!=null){
			int result=sysUserService.update(model);
			System.out.println("result:"+result);
		}else{
			System.out.println("未找到对象");
		}
	}

	/** 查询数据 */
	public Object getById(PK id) throws DataAccessException;

	/** 根据id检查是否插入或是更新数据 */
	public void saveOrUpdate(E entity) throws DataAccessException;

	/** 查询总数 */
	public Integer count(BaseQuery query) throws DataAccessException;

	/** 查询所有数据 */
	public List<E> selectList(BaseQuery query) throws DataAccessException;

}