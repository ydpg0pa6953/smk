package ${packageName}.model;

import lombok.Data;

public @Data class ${className}Model {
	<#list table.columns as column>
		private ${column.classDataType} ${column.classColumnName};
	</#list>

}