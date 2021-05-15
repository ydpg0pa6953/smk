package com.shareinfo.base.auto.query;

import java.io.Serializable;
import lombok.Data;
import com.shareinfo.base.query.BaseQuery;

public @Data class AutoDictionaryQuery extends BaseQuery implements Serializable{
		private java.lang.String id;
		private java.lang.String dictionaryName;
		private java.lang.String dictionaryValue;
		private java.lang.String classId;

}