package com.shareinfo.base.service;

import java.io.Serializable;

import org.springframework.dao.DataAccessException;

import com.shareinfo.base.pagination.PageInfo;
import com.shareinfo.base.query.BaseQuery;

public interface BaseService<E, PK extends Serializable> {
	/** 增加数据 */
	public Integer save(E entity) throws DataAccessException;

	/** 删除数据 */
	public Integer deleteById(PK id) throws DataAccessException;

	/** 修改数据 */
	public Integer update(E entity) throws DataAccessException;

	/** 查询数据 */
	public E getById(PK id) throws DataAccessException;

	/** 根据id检查是否插入或是更新数据 */
	public void saveOrUpdate(E entity) throws DataAccessException;

	/** 查询总数 */
	public Integer count(BaseQuery query) throws DataAccessException;

	/** 查询所有数据 */
	public PageInfo<E> selectList(PageInfo<E> pageInfo,E entity) throws DataAccessException;

}
