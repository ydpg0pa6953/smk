<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/mytags.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%@ include file="/common/bootstrap.jsp"%>
<script>
    $(function () {
		$('#addnew').click(function(){
				window.location.href="autoDbAdd.jsp";
		 });
    });

	function del(id)
	{
		if(confirm("确定要删除吗？"))
		{
			var url = "index.html";
			window.location.href=url;		
		}
	}
</script>
</head>

<body>
<div class="container">
	<form class="form-inline" action="index.html" method="get">    
	    用户名称：
	    <input type="text" name="username" id="username" class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
	    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
	    <button type="button" class="btn btn-success" id="addnew">新增用户</button>
	</form>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>数据库编号</th>
				<th>数据库名称</th>
				<th>数据库类型</th>
				<th>url</th>
				<th>account</th>
				<th>pwd</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pageInfo.list}" var="autoDb">
				<tr>
					<td>${autoDb.id}</td>
					<td>${autoDb.dbName}</td>
					<td>${autoDb.dbType}</td>
					<td>${autoDb.dbUrl}</td>
					<td>${autoDb.dbAccount}</td>
					<td>${autoDb.dbPwd}</td>
					<td>修改 删除</td>
				</tr>
			</c:forEach>
	</table>
</div>
</body>
</html>
