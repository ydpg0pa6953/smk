package ${packageName}.query;

import java.io.Serializable;
import lombok.Data;
import com.shareinfo.base.query.BaseQuery;

public @Data class ${className}Query extends BaseQuery implements Serializable{
	<#list table.columns as column>
		private ${column.classDataType} ${column.classColumnName};
	</#list>

}