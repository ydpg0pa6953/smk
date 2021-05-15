<#assign classNameLower = className?uncap_first>
package ${packageName}.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtilsBean;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.WebUtils;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;
import java.util.List;
<#include "/controller_import.include">

@Controller
@Scope("prototype")
public class ${className}Controller {
	
  @Resource(name = "${classNameLower}Service")
  private ${className}Service ${classNameLower}Service;
  
  	/** 
	 * 执行搜索 
	**/
	public ModelAndView list(HttpServletRequest request,HttpServletResponse response,${className}Query query) {
		List<${className}Model> list = ${classNameLower}Service.selectList(query);
		
		ModelAndView result = new ModelAndView("/${className}/list");
		result.addObject("list",list);
		result.addObject("query",query);
		return result;
	}
	
	/** 
	 * 查看对象
	 **/
	public ModelAndView show(HttpServletRequest request,HttpServletResponse response) throws Exception {
		<@generateIdParameter/>
		${className}Model ${classNameLower} = (${className}Model)${classNameLower}Service.getById(id);
		return new ModelAndView("/${className}/show","${classNameLower}",${classNameLower});
	}
	
	/** 
	 * 进入新增页面
	 **/
	public ModelAndView create(HttpServletRequest request,HttpServletResponse response,${className}Model ${classNameLower}Model) throws Exception {
		return new ModelAndView("/${className}/create","${classNameLower}",${classNameLower}Model);
	}
	
	/** 
	 * 保存新增对象
	 **/
	public ModelAndView save(HttpServletRequest request,HttpServletResponse response,${className}Model ${classNameLower}Model) throws Exception {
		${classNameLower}Service.save(${classNameLower}Model);
		return new ModelAndView("list");
	}
	
	/**
	 * 进入更新页面
	 **/
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response) throws Exception {
		<@generateIdParameter/>
		${className}Model ${classNameLower}Model = (${className}Model)${classNameLower}Service.getById(id);
		return new ModelAndView("/${className}/edit","${classNameLower}",${classNameLower}Model);
	}
	
	/**
	 * 保存更新对象
	 **/
	public ModelAndView update(HttpServletRequest request,HttpServletResponse response) throws Exception {
		<@generateIdParameter/>
		
		${className}Model ${classNameLower}Model = (${className}Model)${classNameLower}Service.getById(id);
		Map params = WebUtils.getParametersStartingWith(request, "");
		BeanUtilsBean beanUtils = new BeanUtilsBean();
		beanUtils.copyProperties(${classNameLower}Model, params);
		${classNameLower}Service.update(${classNameLower}Model);
		return new ModelAndView("list");
	}
	
	/**
	 *删除对象
	 **/
	public ModelAndView delete(HttpServletRequest request,HttpServletResponse response) {
		String[] ids = request.getParameterValues("ids");
		for(int i = 0; i < ids.length; i++) {
			${classNameLower}Service.deleteById(ids[i]);
		}
		return new ModelAndView("list");
	}

}

<#macro generateIdParameter>
<#if table.keyJavaType="java.util.HashMap">
	HashMap id = new HashMap();
	<#list table.keyColumns as column>
		id.put("${column.classColumnName}",request.getParameter("${column.classColumnName}"));
	</#list>
<#else>
	<#list table.keyColumns as column>
		${table.keyJavaType} id = new ${table.keyJavaType}(request.getParameter("${column.classColumnName}"));
	</#list>
</#if>
</#macro>