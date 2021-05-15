package com.shareinfo.base.dao.mybatis;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shareinfo.base.dao.BaseDao;
import com.shareinfo.base.pagination.PageInfo;
import com.shareinfo.base.query.BaseQuery;

/**
 * @ClassName: MybatisBaseDaoImpl
 * @Description: 基于Mybatis的基础泛型DAO实现类
 * @author Huangpeng@shareinfo.com.cn
 * @date 2014年5月14日 上午10:39:17
 */
@Repository("mybatisBaseDao")
public class BaseDaoImpl<E, PK extends Serializable> extends SqlSessionDaoSupport implements BaseDao<E, PK> {

	public static final String SQLNAME_SEPARATOR = "_";

	public static final String SQL_INSERT = "insert";
	public static final String SQL_UPDATE = "update";
	public static final String SQL_GETBYID = "getById";
	public static final String SQL_DELETEBYID = "deleteById";
	public static final String SQL_SELECTLIST = "selectList";
	public static final String SQL_COUNT = SQL_SELECTLIST+SQLNAME_SEPARATOR+"count";

	/**
	 * 设置SqlMapping命名空间。
	 * 此方法只用于注入SqlMapping命名空间，以改变默认的SqlMapping命名空间，
	 * 不能滥用此方法随意改变SqlMapping命名空间。
	 * 
	 * @param sqlNamespace
	 *            SqlMapping命名空间
	 */
	public String getMyBatisMapperNamesapce() {
		throw new RuntimeException("需要设置MyBatisSqlMapping命名空间");
	}

	/**
	 * 将SqlMapping命名空间与给定的SqlMapping名组合在一起。
	 * 
	 * @param sqlName
	 *            SqlMapping名
	 * @return 组合了SqlMapping命名空间后的完整SqlMapping名
	 */
	protected String getSqlName(String sqlName) {
		return getMyBatisMapperNamesapce() + SQLNAME_SEPARATOR + sqlName;
	}

	@Override
	public E getById(Serializable id) throws DataAccessException {
		return this.getSqlSession().selectOne(getSqlName(SQL_GETBYID), id);
	}

	@Override
	public Integer deleteById(Serializable id) throws DataAccessException {
		return this.getSqlSession().delete(getSqlName(SQL_DELETEBYID), id);
	}

	/**
	 * 生成主键值。
	 * 默认情况下什么也不做；
	 * 如果需要生成主键，需要由子类重写此方法根据需要的方式生成主键值。
	 * 
	 * @param entity
	 *            要持久化的对象
	 */
	protected void generateId(E entity) {

	}

	@Override
	public Integer save(E entity) throws DataAccessException {
		generateId(entity);
		return this.getSqlSession().insert(getSqlName(SQL_INSERT), entity);
	}

	@Override
	public Integer update(Object entity) throws DataAccessException {
		return this.getSqlSession().update(getSqlName(SQL_UPDATE), entity);
	}

	@Override
	public void saveOrUpdate(Object entity) throws DataAccessException {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean isUnique(Object entity, String uniquePropertyNames) throws DataAccessException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void flush() throws DataAccessException {
		// TODO Auto-generated method stub

	}

	/** 查询总数 */
	public Integer count(BaseQuery query) throws DataAccessException{
		Number totalCount = (Number) this.getSqlSession().selectOne(getSqlName(SQL_COUNT));
		if (totalCount == null || totalCount.longValue() <= 0) {
			return 0;
		}else{
			return totalCount.intValue();
		}
	}

	@Override
	public List selectAll(BaseQuery query) throws DataAccessException {
		return this.getSqlSession().selectList(getSqlName(SQL_SELECTLIST), query);
	}
	
	@Override
	public PageInfo<E> selectList(PageInfo<E> pageInfo,E entity) throws DataAccessException {
		if(pageInfo==null){
			pageInfo=new PageInfo<E>();
		}
		Number totalCount = (Number) this.getSqlSession().selectOne(getSqlName(SQL_COUNT),entity);
		if (totalCount == null || totalCount.longValue() <= 0) {
			pageInfo.setTotalRecord(0);
			return null;
		}else{
			pageInfo.setTotalRecord(totalCount.intValue());
		}
		List<E> list=this.getSqlSession().selectList(getSqlName(SQL_SELECTLIST), entity, new RowBounds((pageInfo.getPageNo() - 1) * pageInfo.getPageSize(), pageInfo.getPageSize()));
		pageInfo.setList(list);
		return pageInfo;
	}

}
