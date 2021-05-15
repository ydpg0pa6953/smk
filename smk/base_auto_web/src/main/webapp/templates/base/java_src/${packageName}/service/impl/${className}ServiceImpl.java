<#assign classNameLower = className?uncap_first>
package ${packageName}.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shareinfo.base.dao.BaseDao;
import com.shareinfo.base.service.impl.BaseServiceImpl;
<#include "/serviceimpl_import.include"/>

@Service("sysUserService")
public class ${className}ServiceImpl extends BaseServiceImpl<${className}Model, ${table.keyJavaType}>
		implements ${className}Service {

	@Resource(name = "${classNameLower}Dao")
	private ${className}Dao ${classNameLower}Dao;

	@Override
	public BaseDao getBaseDao() {
		return ${classNameLower}Dao;
	}

}
