package com.shareinfo.adminManage.sys.service;

import java.util.List;

import org.junit.Test;
import org.springframework.dao.DataAccessException;

import test.BaseTest;

import com.shareinfo.base.query.BaseQuery;
import com.shareinfo.base.factory.SpringBeanFactory;
import com.shareinfo.adminManage.sys.model.SysAreaModel;

public class SysAreaServiceTest extends BaseTest{
	private SysAreaService sysAreaService=(SysAreaService)SpringBeanFactory.getBean("sysAreaService");
	
	@Test
	/** 增加数据 */
	public void saveTest(){
		SysAreaModel model=new SysAreaModel();
			model.setId(null);
			model.setParentId(null);
			model.setParentIds(null);
			model.setCode(null);
			model.setName(null);
			model.setType(null);
			model.setCreateBy(null);
			model.setCreateDate(null);
			model.setUpdateBy(null);
			model.setUpdateDate(null);
			model.setRemarks(null);
			model.setDelFlag(null);
		int result=sysAreaService.save(model);
		System.out.println("result:"+result);
	}

	@Test
	/** 删除数据 */
	public void deleteByIdTest(){
		java.lang.String id=null;
		SysAreaModel model=(SysAreaModel)sysAreaService.getById(id);
		if(model!=null){
			int result=sysAreaService.deleteById(id);
			System.out.println("result:"+result);
		}else{
			System.out.println("未找到对象");
		}
	}

	@Test
	/** 修改数据 */
	public void updateTest(){
		java.lang.String id=null;
		SysAreaModel model=(SysAreaModel)sysAreaService.getById(id);
		if(model!=null){
			int result=sysAreaService.update(model);
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