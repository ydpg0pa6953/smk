package com.shareinfo.adminManage.auto.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.shareinfo.adminManage.auto.model.AutoDbModel;
import com.shareinfo.adminManage.auto.service.AutoDbService;
import com.shareinfo.base.pagination.PageInfo;

@Controller
@Scope("prototype")
@RequestMapping(value = "/adminManage/auto/autoDb")
public class AutoDbController {

	@Resource(name = "autoDbService")
	private AutoDbService autoDbService;

	@ModelAttribute
	public AutoDbModel get(@RequestParam(required = false) Integer id) {
		if (id != null) {
			return autoDbService.getById(id);
		} else {
			return new AutoDbModel();
		}
	}

	/**
	 * 执行搜索
	 **/
	@RequestMapping(value = { "list", "" })
	public ModelAndView list(AutoDbModel autoDbModel,HttpServletRequest request,HttpServletResponse response) {
		PageInfo<AutoDbModel> pageInfo = autoDbService.selectList(new PageInfo<AutoDbModel>(),autoDbModel);

		ModelAndView result = new ModelAndView("autoDbList");
		result.addObject("pageInfo", pageInfo);
		return result;
	}

	/**
	 * 查看对象
	 **/
	@RequestMapping(value = { "show" })
	public ModelAndView show(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		java.lang.Integer id = new java.lang.Integer(request.getParameter("id"));
		AutoDbModel autoDb = (AutoDbModel) autoDbService.getById(id);
		return new ModelAndView("autoDbShow", "autoDb", autoDb);
	}

	/**
	 * 进入新增页面
	 **/
	public ModelAndView create(HttpServletRequest request,
			HttpServletResponse response, AutoDbModel autoDbModel)
			throws Exception {
		return new ModelAndView("autoDbCreate", "autoDb", autoDbModel);
	}

	/**
	 * 保存新增对象
	 **/
	public ModelAndView save(HttpServletRequest request,
			HttpServletResponse response, AutoDbModel autoDbModel)
			throws Exception {
		autoDbService.save(autoDbModel);
		return new ModelAndView("autoDbList");
	}

	/**
	 * 进入更新页面
	 **/
	public ModelAndView edit(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		java.lang.Integer id = new java.lang.Integer(request.getParameter("id"));
		AutoDbModel autoDbModel = (AutoDbModel) autoDbService.getById(id);
		return new ModelAndView("autoDbEdit", "autoDb", autoDbModel);
	}

	/**
	 * 保存更新对象
	 **/
	public ModelAndView update(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		java.lang.Integer id = new java.lang.Integer(request.getParameter("id"));

		AutoDbModel autoDbModel = (AutoDbModel) autoDbService.getById(id);
		Map params = WebUtils.getParametersStartingWith(request, "");
		BeanUtilsBean beanUtils = new BeanUtilsBean();
		beanUtils.copyProperties(autoDbModel, params);
		autoDbService.update(autoDbModel);
		return new ModelAndView("autoDbList");
	}

	/**
	 * 删除对象
	 **/
	public ModelAndView delete(HttpServletRequest request,
			HttpServletResponse response) {
		String[] ids = request.getParameterValues("ids");
		for (int i = 0; i < ids.length; i++) {
			autoDbService.deleteById(new Integer(ids[i]));
		}
		return new ModelAndView("autoDbList");
	}

}
