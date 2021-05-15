package com.shareinfo.demo.test;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.shareinfo.demo.model.DemoUserModel;

public class MybatisLoad {

	public static void main(String[] args) {
		try {
			System.out.println("******************");
			System.out.println("mybatis使用配置文件方式加载配置文件");
			System.out.println("******************");
			String resource = "com/shareinfo/demo/test/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

			DemoUserModel model = new DemoUserModel();
			model.setAccount("94300452@qq.com");
			model.setName("黄鹏");
			model.setPassword("hp");
//			model.setEmail("94300452@qq.com");

			// 新增
			SqlSession session = sqlSessionFactory.openSession();
			session.insert("DemoUser_insert", model);
			session.commit();
			System.out.println("model.id:"+model.getId());
			
			// 查询
			List<DemoUserModel> list = session.selectList("DemoUser_findPage");
			System.out.println(list);
			
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
