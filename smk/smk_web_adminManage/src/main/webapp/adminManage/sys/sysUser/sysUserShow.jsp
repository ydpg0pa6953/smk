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
	<form:form action="/adminManage/sys/sysUser/show.do" method="post" class="form-horizontal" role="form">
		<div class="form-group">
			<label class="col-sm-2 control-label">归属公司</label>
			<div class="col-sm-10">
				${sysUser.companyId}
			</div>		
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">归属部门</label>
			<div class="col-sm-10">
                ${sysUser.officeId}
			</div>		
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">登录名</label>
			<div class="col-sm-10">
				${sysUser.loginName}
			</div>	
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">工号</label>
			<div class="col-sm-10">
				${sysUser.no}
			</div>	
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">姓名</label>
			<div class="col-sm-10">
				${sysUser.name}
			</div>	
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">密码</label>
			<div class="col-sm-10">
				${sysUser.password}
			</div>	
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">邮箱</label>
			<div class="col-sm-10">
				${sysUser.email}
			</div>	
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">电话</label>
			<div class="col-sm-10">
				${sysUser.phone}
			</div>	
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">手机</label>
			<div class="col-sm-10">
				${sysUser.mobile}
			</div>	
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">备注</label>
			<div class="col-sm-10">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">用户角色</label>
			<div class="col-sm-10">
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
