package com.shareinfo.base.auto.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shareinfo.base.auto.dao.ITableDao;
import com.shareinfo.base.auto.service.AutoBuildService;
import com.shareinfo.base.auto.util.NameReplaceUtils;
import com.shareinfo.base.auto.vo.ColumnInfo;
import com.shareinfo.base.auto.vo.ConfigureInit;
import com.shareinfo.base.auto.vo.ConfigureTemplate;
import com.shareinfo.base.auto.vo.ResultInfo;
import com.shareinfo.base.auto.vo.TableInfo;
import com.shareinfo.base.common.freemarker.FreeMarkerTools;

/**
 * @ClassName: AutoBuildService
 * @Description: 自动构建服务
 * @author Huangpeng@shareinfo.com.cn
 * @date 2014年2月21日 下午3:43:16
 */
@Service("autoBuildService")
public class AutoBuildServiceImpl implements AutoBuildService {

	@Resource(name = "tableDao")
	private ITableDao tableDao;

	public ResultInfo run(ConfigureInit configureInit) {
		ResultInfo resultInfo = new ResultInfo();
		// 获取表的相关信息
		TableInfo tableInfo = getTableInfo(configureInit, resultInfo);
		if (tableInfo != null) {
			configureInit.setTableInfo(tableInfo);
			// 进行相关替换工作
			templateScan(configureInit,resultInfo);
			resultInfo.setResult(true);
			resultInfo.setObj(tableInfo);
		}
		return resultInfo;
	}

	// 获取表的相关信息
	public TableInfo getTableInfo(ConfigureInit configureInit, ResultInfo resultInfo) {
		// 获取表的主键
		List<String> keyColumn = getKeyColumn(configureInit, resultInfo);
		if (keyColumn == null){
			resultInfo.setMsg("表的主键未找到");
			return null;
		}
		// 获取表字段
		List<ColumnInfo> columnsList = getColumns(configureInit, resultInfo);
		if (columnsList == null){
			resultInfo.setMsg("表的字段未找到");
			return null;
		}
		TableInfo tableInfo = new TableInfo();
		tableInfo.setKeyColumn(keyColumn);
		tableInfo.setColumns(columnsList);
		tableInfo.initKeyColumns();
		return tableInfo;
	}

	// 获取表的主键
	public List<String> getKeyColumn(ConfigureInit configureInit, ResultInfo resultInfo) {
		resultInfo = tableDao.getKeyColumn(configureInit);
		if (!resultInfo.isResult())
			return null;
		List<String> list = (List<String>) resultInfo.getObj();
		if (list == null || list.size() == 0) {
			resultInfo.setResult(false);
			resultInfo.setMsg("未发现主键信息");
			return null;
		}
		return list;
	}

	// 获取表字段
	public List<ColumnInfo> getColumns(ConfigureInit configureInit, ResultInfo resultInfo) {
		resultInfo = tableDao.getColumns(configureInit);
		if (!resultInfo.isResult())
			return null;
		List<ColumnInfo> list = (List<ColumnInfo>) resultInfo.getObj();
		if (list == null || list.size() == 0) {
			resultInfo.setResult(false);
			resultInfo.setMsg("未发现表字段信息");
			return null;
		}
		return list;
	}

	// 模板扫描
	public void templateScan(ConfigureInit configureInit, ResultInfo resultInfo) {
		ConfigureTemplate configureTemplate = configureInit.getConfigureTemplate();
		File file = new File(configureTemplate.getPath());
		if (!file.exists()) {
			resultInfo.setMsg("模板路径不存在！");
		} else {
			String[] dealList = file.list();
			// 扫描模板路径信息
			for (int i = 0; i < dealList.length; i++) {
				file = new File(configureTemplate.getPath() + File.separator + dealList[i]);
				repeat(configureInit, file, dealList[i]);
			}
		}
	}

	//递归调用
	private void repeat(ConfigureInit configureInit, File directoryFile, String directoryPath) {
		ConfigureTemplate configureTemplate = configureInit.getConfigureTemplate();
		if(directoryFile.isDirectory())
		for (String fileName : directoryFile.list()) {
			// 如果是目录的话，则替换
			File srcFile = new File(directoryFile.getAbsolutePath() + File.separator + fileName);
			if (srcFile.isDirectory()) {
				repeat(configureInit, srcFile, directoryPath + File.separator + fileName);
			}
			if (srcFile.isFile()) {
				// 新文件的名字
				String newFileName = NameReplaceUtils.nameReplace(fileName, configureInit);

				// 输出路径
				String outputFile = configureTemplate.getOutPath() + File.separator + NameReplaceUtils.nameReplace(directoryPath, configureInit);
				File file = new File(outputFile);
				file.mkdirs();

				FreeMarkerTools.analysisTemplate(configureTemplate.getPath(), directoryPath+File.separator +fileName, outputFile + File.separator + newFileName, getRoot(configureInit));
			}
		}
	}
	
	private Map<String, Object> getRoot(ConfigureInit configureInit){
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("packageName", configureInit.getPackageName());
		root.put("className", configureInit.getClassName());
		root.put("tableName", configureInit.getTableName());
		root.put("comments", configureInit.getComments());
		root.put("table", configureInit.getTableInfo());
		return root;
	}
}
