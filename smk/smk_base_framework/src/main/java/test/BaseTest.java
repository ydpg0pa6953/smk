package test;

import org.junit.BeforeClass;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shareinfo.base.factory.SpringBeanFactory;

public class BaseTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/*.xml");
		SpringBeanFactory.setBf(ctx);
	}
	
}
