package ${packageName}.dao;

import com.shareinfo.base.dao.BaseDao;
<#include "/dao_imports.include">

public interface ${className}Dao extends BaseDao<${className}Model, ${table.keyJavaType}>{

}
