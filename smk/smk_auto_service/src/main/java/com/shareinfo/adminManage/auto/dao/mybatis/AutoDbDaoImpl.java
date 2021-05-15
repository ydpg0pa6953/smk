package com.shareinfo.adminManage.auto.dao.mybatis;

import org.springframework.stereotype.Repository;

import com.shareinfo.base.dao.mybatis.BaseDaoImpl;
import com.shareinfo.adminManage.auto.model.AutoDbModel;
import com.shareinfo.adminManage.auto.dao.AutoDbDao;

/**
 * @author 黄鹏 email:94300452@qq.com
 * @version 1.0
 * @since 1.0
 */
@Repository("autoDbDao")
public class AutoDbDaoImpl extends BaseDaoImpl<AutoDbModel, java.lang.Integer> implements AutoDbDao{
	
	public String getMyBatisMapperNamesapce() {
		return "AutoDb";
	}
}
