<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/mytags.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%@ include file="/common/bootstrap.jsp"%>
</head>

<body>
<div class="container">
	<form:form action="/adminManage/sys/sysArea/show.do" method="post" class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-sm-2 control-label">编号</label>
				<div class="col-sm-10">
					${sysArea.id}
				</div>		
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">父级编号</label>
				<div class="col-sm-10">
					${sysArea.parentId}
				</div>		
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">所有父级编号</label>
				<div class="col-sm-10">
					${sysArea.parentIds}
				</div>		
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">区域编码</label>
				<div class="col-sm-10">
					${sysArea.code}
				</div>		
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">区域名称</label>
				<div class="col-sm-10">
					${sysArea.name}
				</div>		
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">区域类型</label>
				<div class="col-sm-10">
					${sysArea.type}
				</div>		
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">创建者</label>
				<div class="col-sm-10">
					${sysArea.createBy}
				</div>		
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">创建时间</label>
				<div class="col-sm-10">
					${sysArea.createDate}
				</div>		
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">更新者</label>
				<div class="col-sm-10">
					${sysArea.updateBy}
				</div>		
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">更新时间</label>
				<div class="col-sm-10">
					${sysArea.updateDate}
				</div>		
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">备注信息</label>
				<div class="col-sm-10">
					${sysArea.remarks}
				</div>		
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">删除标记</label>
				<div class="col-sm-10">
					${sysArea.delFlag}
				</div>		
			</div>
		<div class="form-group">
    		<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">保 存</button>
				<button type="button" class="btn btn-default" onclick="history.go(-1)">返 回</button>
			</div>
		</div>	
	</form:form>
</div>	
</body>
</html>
