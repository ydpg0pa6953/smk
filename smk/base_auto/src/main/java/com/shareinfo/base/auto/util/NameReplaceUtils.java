package com.shareinfo.base.auto.util;

import java.util.ResourceBundle;
import java.util.regex.Pattern;

import com.shareinfo.base.auto.vo.ConfigureInit;
import com.shareinfo.base.auto.vo.TableInfo;

/**
 * @ClassName: NameReplaceUtils
 * @Description: 名称替换
 * @author Huangpeng@shareinfo.com.cn
 * @date 2014年1月14日 下午2:09:33
 */
public class NameReplaceUtils {

	/**
	 * @Title: nameReplace
	 * @Description: 替换目录名称
	 * @param @param directoryName
	 * @param @param rb
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 */
	public static String nameReplace(String name, ConfigureInit configureInit) {
		if (name.indexOf("${packageName}") > -1) {
			String basepackage = configureInit.getPackageName();
			name = name.replaceAll(Pattern.quote("${packageName}"), basepackage.replaceAll("\\.", "/"));
		}
		if (name.indexOf("${className}") > -1) {
			name = name.replaceAll(Pattern.quote("${className}"), configureInit.getClassName());
		}
		if (name.indexOf("${classNameLower}") > -1) {
			name = name.replaceAll(Pattern.quote("${classNameLower}"), configureInit.getClassName().toLowerCase());
		}
		return name;
	}

}
