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

import java.util.Map;
import java.util.List;

import com.shareinfo.adminManage.sys.model.SysUserModel;
import com.shareinfo.adminManage.sys.query.SysUserQuery;
import com.shareinfo.adminManage.sys.service.SysUserService;
import com.shareinfo.base.pagination.PageInfo;

@Controller
@Scope("prototype")
@RequestMapping(value = "/adminManage/sys/sysUser")
public class SysUserController {
	
  @Resource(name = "sysUserService")
  private SysUserService sysUserService;
  
  @ModelAttribute
	public SysUserModel get(@RequestParam(required=false) java.lang.String id) {
		if (id!=null){
			return sysUserService.getById(id);
		}else{
			return new SysUserModel();
		}
	}
  
  	/** 
	 * 执行搜索 
	**/
	@RequestMapping(value = {"list", ""})
	public ModelAndView list(SysUserModel sysUserModel,HttpServletRequest request,HttpServletResponse response,SysUserQuery query) {
		PageInfo<SysUserModel> pageInfo = sysUserService.selectList(new PageInfo<SysUserModel>(),sysUserModel);
		
		ModelAndView result = new ModelAndView("sysUserList");
		result.addObject("pageInfo", pageInfo);
		return result;
	}
	
	/** 
	 * 查看对象
	 **/
	@RequestMapping(value = {"show"})
	public ModelAndView show(HttpServletRequest request,HttpServletResponse response) throws Exception {
		java.lang.String id = new java.lang.String(request.getParameter("id"));
		SysUserModel sysUser = (SysUserModel)sysUserService.getById(id);
		return new ModelAndView("sysUserShow","sysUser",sysUser);
	}
	
	/** 
	 * 进入新增页面
	 **/
	public ModelAndView create(HttpServletRequest request,HttpServletResponse response,SysUserModel sysUserModel) throws Exception {
		return new ModelAndView("sysUserCreate","sysUser",sysUserModel);
	}
	
	/** 
	 * 保存新增对象
	 **/
	public ModelAndView save(HttpServletRequest request,HttpServletResponse response,SysUserModel sysUserModel) throws Exception {
		sysUserService.save(sysUserModel);
		return new ModelAndView("sysUserList");
	}
	
	/**
	 * 进入更新页面
	 **/
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response) throws Exception {
		java.lang.String id = new java.lang.String(request.getParameter("id"));
		SysUserModel sysUserModel = (SysUserModel)sysUserService.getById(id);
		return new ModelAndView("sysUserEdit","sysUser",sysUserModel);
	}
	
	/**
	 * 保存更新对象
	 **/
	public ModelAndView update(HttpServletRequest request,HttpServletResponse response) throws Exception {
		java.lang.String id = new java.lang.String(request.getParameter("id"));
		
		SysUserModel sysUserModel = (SysUserModel)sysUserService.getById(id);
		Map params = WebUtils.getParametersStartingWith(request, "");
		BeanUtilsBean beanUtils = new BeanUtilsBean();
		beanUtils.copyProperties(sysUserModel, params);
		sysUserService.update(sysUserModel);
		return new ModelAndView("sysUserList");
	}
	
	/**
	 *删除对象
	 **/
	public ModelAndView delete(HttpServletRequest request,HttpServletResponse response) {
		String[] ids = request.getParameterValues("ids");
		for(int i = 0; i < ids.length; i++) {
			sysUserService.deleteById(ids[i]);
		}
		return new ModelAndView("sysUserList");
	}

}

