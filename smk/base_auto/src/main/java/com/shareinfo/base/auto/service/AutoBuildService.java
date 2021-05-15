package com.shareinfo.base.auto.service;

import com.shareinfo.base.auto.vo.ConfigureInit;
import com.shareinfo.base.auto.vo.ResultInfo;

public interface AutoBuildService {
	public ResultInfo run(ConfigureInit configureInit);
}
