package com.shareinfo.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shareinfo.demo.model.DemoUserModel;
import com.shareinfo.demo.service.DemoUserService;

@Controller
@RequestMapping("/demo/user/")
public class DemoUserController {

	@Resource
	private DemoUserService demoUserService;
	
	@RequestMapping(value = "list.do")
	public ModelAndView list() {
		System.out.println(demoUserService);
		System.out.println("DemoUserController.list");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("list");
		List<DemoUserModel> list = new ArrayList<DemoUserModel>();
		DemoUserModel demoUserModel = new DemoUserModel();
		demoUserModel.setId(1);
		demoUserModel.setAccount("94300452@qq.com");
		demoUserModel.setEmail("94300452@qq.com");
		demoUserModel.setName("hp");
		demoUserModel.setPassword("hp");
		list.add(demoUserModel);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "save.do")
	public String save() {
		return "save";
	}

}
