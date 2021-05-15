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
public class SmkSzhd {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/applicationContext-*.xml");

		ConfigureInit conf = new ConfigureInit();
		conf.setConfigureTemplate(getConfigureTemplate());
		conf.setConfigureDatabase(getConfigureDatabase());
		conf.setPackageName("net.share_info.dxw");
		conf.setClassName("SmkSmkCode");
		conf.setTableName("smksmkcode".toUpperCase());
		conf.setComments("企业用户管理");

		AutoBuildService autoBuildService = (AutoBuildService) context.getBean("autoBuildService");
		ResultInfo resultInfo = autoBuildService.run(conf);
		System.out.println(resultInfo);
	}

	// 获取配置模板
	public static ConfigureTemplate getConfigureTemplate() {
		ConfigureTemplate configureTemplate = new ConfigureTemplate();
		configureTemplate.setTemplateId("SMK_SZHD");
		configureTemplate.setPath("F:/Git/projects/CodeAutoBuild/HP_Code_AutoBuild/templates/smk/szhd");
		configureTemplate.setOutPath("D:/output");
		return configureTemplate;
	}

	// 获取模板数据库
	public static ConfigureDatabase getConfigureDatabase() {
		ConfigureDatabase configureDatabase = new ConfigureDatabase();
		configureDatabase.setDriver("oracle.jdbc.driver.OracleDriver");
		configureDatabase.setUrl("jdbc:oracle:thin:@192.168.18.101:1521:orcl");
		configureDatabase.setUsername("DYW_SMSMAIN");
		configureDatabase.setPassword("DYW_SMSMAIN");
		configureDatabase.setSchema("DYW_SMSMAIN");
		configureDatabase.setCatalog(null);
		return configureDatabase;
	}
}
