package com.shareinfo.base.factory;

import org.springframework.beans.*;
import org.springframework.beans.factory.*;

public class SpringBeanFactory {

	private static BeanFactory bf = null;

	// 这里需要由别的地方赋值进来,赋值的调用在 ../init/InitListener中
	private SpringBeanFactory() {
	}

	public static Object getBean(String name) throws BeansException {
		return bf.getBean(name);
	}

	public static Object getBean(String name, Class requiredType)
			throws BeansException {
		return bf.getBean(name, requiredType);
	}

	public static boolean containsBean(String name) {
		return bf.containsBean(name);
	}

	public static boolean isSingleton(String name)
			throws NoSuchBeanDefinitionException {
		return bf.isSingleton(name);
	}

	public static Class getType(String name)
			throws NoSuchBeanDefinitionException {
		return bf.getType(name);
	}

	public static String[] getAliases(String name)
			throws NoSuchBeanDefinitionException {
		return bf.getAliases(name);
	}

	public static BeanFactory getBf() {
		return bf;
	}

	public static void setBf(BeanFactory b) {
		bf = b;
	}
}
