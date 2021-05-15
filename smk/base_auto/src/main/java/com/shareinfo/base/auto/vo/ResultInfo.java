package com.shareinfo.base.auto.vo;

import lombok.Data;

/**
 * @ClassName: ResultInfo
 * @Description: 结果信息
 * @author Huangpeng@shareinfo.com.cn
 * @date 2014年2月21日 下午3:27:43
 */
public @Data
class ResultInfo {
	//结果
	private boolean result = false;

	private String msg;

	private Object obj;
}
