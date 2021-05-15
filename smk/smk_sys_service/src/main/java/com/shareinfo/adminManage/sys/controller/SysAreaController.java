package com.shareinfo.adminManage.sys.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.WebUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.lang3.StringUtils;

import com.shareinfo.adminManage.sys.model.SysUserModel;
import com.shareinfo.base.pagination.PageInfo;

import java.util.Map;
import java.util.List;
import com.shareinfo.adminManage.sys.model.SysAreaModel;
import com.shareinfo.adminManage.sys.query.SysAreaQuery;
import com.shareinfo.adminManage.sys.service.SysAreaService;

@Controller
@Scope("prototype")
@RequestMapping(value = "/adminManage/sys/sysArea")
public class SysAreaController {
	
  @Resource(name = "sysAreaService")
  private SysAreaService sysAreaService;
  
  @ModelAttribute
	public SysAreaModel get(@RequestParam(required=false) java.lang.String id) {
		if (id!=null){
			return sysAreaService.getById(id);
		}else{
			return new SysAreaModel();
		}
	}
  
  	/** 
	 * 执行搜索 
	**/
	@RequestMapping(value = {"list", ""})
	public ModelAndView list(SysAreaModel sysAreaModel,HttpServletRequest request,HttpServletResponse response) {
		PageInfo<SysAreaModel> pageInfo = sysAreaService.selectList(new PageInfo<SysAreaModel>(),sysAreaModel);
		
		ModelAndView result = new ModelAndView("sysAreaList");
		result.addObject("pageInfo", pageInfo);
		return result;
	}
	
	/** 
	 * 查看对象
	 **/
	@RequestMapping(value = {"show"})
	public ModelAndView show(HttpServletRequest request,HttpServletResponse response) throws Exception {
		java.lang.String id = new java.lang.String(request.getParameter("id"));
		SysAreaModel sysArea = (SysAreaModel)sysAreaService.getById(id);
		return new ModelAndView("sysAreaShow","sysArea",sysArea);
	}
	
	/** 
	 * 进入新增页面
	 **/
	public ModelAndView create(HttpServletRequest request,HttpServletResponse response,SysAreaModel sysAreaModel) throws Exception {
		return new ModelAndView("sysAreaCreate","sysArea",sysAreaModel);
	}
	
	/** 
	 * 保存新增对象
	 **/
	public ModelAndView save(HttpServletRequest request,HttpServletResponse response,SysAreaModel sysAreaModel) throws Exception {
		sysAreaService.save(sysAreaModel);
		return new ModelAndView("sysAreaList");
	}
	
	/**
	 * 进入更新页面
	 **/
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response) throws Exception {
		java.lang.String id = new java.lang.String(request.getParameter("id"));
		SysAreaModel sysAreaModel = (SysAreaModel)sysAreaService.getById(id);
		return new ModelAndView("sysAreaEdit","sysArea",sysAreaModel);
	}
	
	/**
	 * 保存更新对象
	 **/
	public ModelAndView update(HttpServletRequest request,HttpServletResponse response) throws Exception {
		java.lang.String id = new java.lang.String(request.getParameter("id"));
		
		SysAreaModel sysAreaModel = (SysAreaModel)sysAreaService.getById(id);
		Map params = WebUtils.getParametersStartingWith(request, "");
		BeanUtilsBean beanUtils = new BeanUtilsBean();
		beanUtils.copyProperties(sysAreaModel, params);
		sysAreaService.update(sysAreaModel);
		return new ModelAndView("sysAreaList");
	}
	
	/**
	 *删除对象
	 **/
	public ModelAndView delete(HttpServletRequest request,HttpServletResponse response) {
		String[] ids = request.getParameterValues("ids");
		for(int i = 0; i < ids.length; i++) {
			sysAreaService.deleteById(ids[i]);
		}
		return new ModelAndView("sysAreaList");
	}

}

