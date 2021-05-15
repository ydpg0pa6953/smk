package com.shareinfo.base.auto.dao.mybatis;

import org.springframework.stereotype.Repository;

import com.shareinfo.base.dao.mybatis.BaseDaoImpl;
import com.shareinfo.base.auto.model.AutoDictionaryModel;
import com.shareinfo.base.auto.dao.AutoDictionaryDao;

/**
 * @author 黄鹏 email:94300452@qq.com
 * @version 1.0
 * @since 1.0
 */
@Repository("autoDictionaryDao")
public class AutoDictionaryDaoImpl extends BaseDaoImpl<AutoDictionaryModel, java.lang.String> implements AutoDictionaryDao{
	
	public String getMyBatisMapperNamesapce() {
		return "AutoDictionary";
	}
}
