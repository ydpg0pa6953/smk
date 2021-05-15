package com.shareinfo.base.auto.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shareinfo.base.auto.service.AutoBuildService;
import com.shareinfo.base.auto.vo.ConfigureDatabase;
import com.shareinfo.base.auto.vo.ConfigureInit;
import com.shareinfo.base.auto.vo.ConfigureTemplate;
import com.shareinfo.base.auto.vo.ResultInfo;

/**
 * @ClassName: SmkSzhd
 * @Description: 企信通_深圳核电
 * @author Huangpeng@shareinfo.com.cn
 * @date 2014年2月21日 下午2:56:03
 */
public class BaseAuto {
	
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/applicationContext-*.xml");

		ConfigureInit conf = new ConfigureInit();
		conf.setConfigureTemplate(getConfigureTemplate());
		conf.setConfigureDatabase(getConfigureDatabase());
		conf.setPackageName("com.shareinfo.sys");
		conf.setClassName("SysDepartment");
		conf.setTableName("sys_department".toUpperCase());
		conf.setComments("部门信息");

		AutoBuildService autoBuildService = (AutoBuildService) context.getBean("autoBuildService");
		ResultInfo resultInfo = autoBuildService.run(conf);
		System.out.println(resultInfo);
	}

	// 获取配置模板
	public static ConfigureTemplate getConfigureTemplate() {
		ConfigureTemplate configureTemplate = new ConfigureTemplate();
		configureTemplate.setTemplateId("SMK_SZHD");
		configureTemplate.setPath("H:/jobCode/smk/base/smk/base_auto_web/src/main/webapp/templates/temp");
		configureTemplate.setOutPath("D:/output");
		return configureTemplate;
	}

	// 获取模板数据库
	public static ConfigureDatabase getConfigureDatabase() {
		ConfigureDatabase configureDatabase = new ConfigureDatabase();
		configureDatabase.setDriver("com.mysql.jdbc.Driver");
		configureDatabase.setUrl("jdbc:mysql://localhost:3306/smk?useUnicode=true&characterEncoding=UTF-8");
		configureDatabase.setUsername("root");
		configureDatabase.setPassword("root");
		configureDatabase.setSchema(null);
		configureDatabase.setCatalog(null);
		return configureDatabase;
	}
}
