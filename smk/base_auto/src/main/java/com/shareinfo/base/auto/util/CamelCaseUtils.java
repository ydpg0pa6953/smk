package com.shareinfo.base.auto.util;

/**
 * @ClassName: CamelCaseUtils
 * @Description: 驼峰命名处理
 * @author Huangpeng@shareinfo.com.cn
 * @date 2013年12月3日 下午3:18:41
 */
public class CamelCaseUtils {
	private static final char SEPARATOR = '_';
	
	 public static String toCamelCase(String s) {
	        if (s == null) {
	            return null;
	        }
	        s = s.toLowerCase();

	        StringBuilder sb = new StringBuilder(s.length());
	        boolean upperCase = false;
	        for (int i = 0; i < s.length(); i++) {
	            char c = s.charAt(i);

	            if (c == SEPARATOR) {
	                upperCase = true;
	            } else if (upperCase) {
	                sb.append(Character.toUpperCase(c));
	                upperCase = false;
	            } else {
	                sb.append(c);
	            }
	        }

	        return sb.toString();
	    }
}
