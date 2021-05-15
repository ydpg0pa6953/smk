package com.shareinfo.base.auto.controller;

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
import com.shareinfo.base.auto.model.AutoDictionaryModel;
import com.shareinfo.base.auto.query.AutoDictionaryQuery;
import com.shareinfo.base.auto.service.AutoDictionaryService;

@Controller
@Scope("prototype")
public class AutoDictionaryController {
	
  @Resource(name = "autoDictionaryService")
  private AutoDictionaryService autoDictionaryService;
  
  	/** 
	 * 执行搜索 
	**/
	public ModelAndView list(HttpServletRequest request,HttpServletResponse response,AutoDictionaryQuery query) {
		List<AutoDictionaryModel> list = autoDictionaryService.selectList(query);
		
		ModelAndView result = new ModelAndView("/AutoDictionary/list");
		result.addObject("list",list);
		result.addObject("query",query);
		return result;
	}
	
	/** 
	 * 查看对象
	 **/
	public ModelAndView show(HttpServletRequest request,HttpServletResponse response) throws Exception {
		java.lang.String id = new java.lang.String(request.getParameter("id"));
		AutoDictionaryModel autoDictionary = (AutoDictionaryModel)autoDictionaryService.getById(id);
		return new ModelAndView("/AutoDictionary/show","autoDictionary",autoDictionary);
	}
	
	/** 
	 * 进入新增页面
	 **/
	public ModelAndView create(HttpServletRequest request,HttpServletResponse response,AutoDictionaryModel autoDictionaryModel) throws Exception {
		return new ModelAndView("/AutoDictionary/create","autoDictionary",autoDictionaryModel);
	}
	
	/** 
	 * 保存新增对象
	 **/
	public ModelAndView save(HttpServletRequest request,HttpServletResponse response,AutoDictionaryModel autoDictionaryModel) throws Exception {
		autoDictionaryService.save(autoDictionaryModel);
		return new ModelAndView("list");
	}
	
	/**
	 * 进入更新页面
	 **/
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response) throws Exception {
		java.lang.String id = new java.lang.String(request.getParameter("id"));
		AutoDictionaryModel autoDictionaryModel = (AutoDictionaryModel)autoDictionaryService.getById(id);
		return new ModelAndView("/AutoDictionary/edit","autoDictionary",autoDictionaryModel);
	}
	
	/**
	 * 保存更新对象
	 **/
	public ModelAndView update(HttpServletRequest request,HttpServletResponse response) throws Exception {
		java.lang.String id = new java.lang.String(request.getParameter("id"));
		
		AutoDictionaryModel autoDictionaryModel = (AutoDictionaryModel)autoDictionaryService.getById(id);
		Map params = WebUtils.getParametersStartingWith(request, "");
		BeanUtilsBean beanUtils = new BeanUtilsBean();
		beanUtils.copyProperties(autoDictionaryModel, params);
		autoDictionaryService.update(autoDictionaryModel);
		return new ModelAndView("list");
	}
	
	/**
	 *删除对象
	 **/
	public ModelAndView delete(HttpServletRequest request,HttpServletResponse response) {
		String[] ids = request.getParameterValues("ids");
		for(int i = 0; i < ids.length; i++) {
			autoDictionaryService.deleteById(ids[i]);
		}
		return new ModelAndView("list");
	}

}

