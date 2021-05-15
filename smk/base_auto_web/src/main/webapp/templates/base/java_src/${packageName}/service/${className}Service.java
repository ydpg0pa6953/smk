<#assign classNameLower = className?uncap_first>
package ${packageName}.service;

import com.shareinfo.base.service.BaseService;
<#include "/service_import.include"/>

public interface ${className}Service extends BaseService<${className}Model, ${table.keyJavaType}>{

}