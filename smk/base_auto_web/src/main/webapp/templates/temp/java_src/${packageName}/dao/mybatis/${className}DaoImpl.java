<#assign classNameLower = className?uncap_first>
package ${packageName}.dao.mybatis;

import org.springframework.stereotype.Repository;

import com.shareinfo.base.dao.mybatis.BaseDaoImpl;
<#include "/daoimpl_imports.include">

@Repository("${classNameLower}Dao")
public class ${className}DaoImpl extends BaseDaoImpl<${className}Model, ${table.keyJavaType}> implements ${className}Dao{
	
	public String getMyBatisMapperNamesapce() {
		return "${className}";
	}
}
