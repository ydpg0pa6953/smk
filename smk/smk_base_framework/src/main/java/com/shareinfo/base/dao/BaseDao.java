package com.shareinfo.base.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.shareinfo.base.pagination.PageInfo;
import com.shareinfo.base.query.BaseQuery;

public interface BaseDao<E, PK extends Serializable> {

	/** 增加数据 */
	public Integer save(E entity) throws DataAccessException;

	/** 删除数据 */
	public Integer deleteById(PK id) throws DataAccessException;

	/** 修改数据 */
	public Integer update(E entity) throws DataAccessException;

	/** 查询数据 */
	public Object getById(PK id) throws DataAccessException;

	/** 根据id检查是否插入或是更新数据 */
	public void saveOrUpdate(E entity) throws DataAccessException;

	/** 查询总数 */
	public Integer count(BaseQuery query) throws DataAccessException;

	/** 查询列表 */
	public List selectAll(BaseQuery query) throws DataAccessException;
	
	/** 查询列表 */
	public PageInfo<E> selectList(PageInfo<E> pageInfo,E entity) throws DataAccessException;

	public boolean isUnique(E entity, String uniquePropertyNames) throws DataAccessException;

	/** 用于hibernate.flush() 有些dao实现不需要实现此类 */
	public void flush() throws DataAccessException;

}
