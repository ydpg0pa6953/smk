package com.shareinfo.base.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.shareinfo.base.dao.BaseDao;
import com.shareinfo.base.pagination.PageInfo;
import com.shareinfo.base.query.BaseQuery;
import com.shareinfo.base.service.BaseService;

@Service("baseServiceImpl")
public abstract class BaseServiceImpl<E, PK extends Serializable> implements
		BaseService<E, PK> {

	public abstract BaseDao getBaseDao();

	@Override
	public Integer save(E entity) throws DataAccessException {
		return getBaseDao().save(entity);
	}

	@Override
	public Integer deleteById(PK id) throws DataAccessException {
		return getBaseDao().deleteById(id);
	}

	@Override
	public Integer update(E entity) throws DataAccessException {
		return getBaseDao().update(entity);
	}

	@Override
	public E getById(PK id) throws DataAccessException {
		return (E)getBaseDao().getById(id);
	}

	@Override
	public void saveOrUpdate(E entity) throws DataAccessException {
		// TODO Auto-generated method stub
	}

	/** 查询总数 */
	public Integer count(BaseQuery query) throws DataAccessException {
		return getBaseDao().count(query);
	}

	@Override
	public PageInfo<E> selectList(PageInfo<E> pageInfo,E entity) throws DataAccessException {
		return getBaseDao().selectList(pageInfo,entity);
	}

}
