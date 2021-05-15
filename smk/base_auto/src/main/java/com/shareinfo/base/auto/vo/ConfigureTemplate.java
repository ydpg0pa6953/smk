package com.shareinfo.base.auto.vo;

import lombok.Data;

/**
 * @ClassName: TemplateInfo
 * @Description: 模板信息
 * @author Huangpeng@shareinfo.com.cn
 * @date 2014年2月21日 上午11:24:19
 */
public @Data
class ConfigureTemplate {
	// 模板编号 SMK_HBLT
	private String templateId;
	// 模板路径
	private String path;
	// 输出路径
	private String outPath;
}
