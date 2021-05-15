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
	<form class="form-inline" action="index.html" method="get">    
	    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
	    <button type="button" class="btn btn-success" id="addnew">新增用户</button>
	</form>
	<table class="table table-striped table-bordered table-hover">
 		<thead>
               <tr>
               	    <th>编号</th>
               	 	<th>归属公司</th>
               	 	<th>归属部门</th>
               	 	<th>登录名</th>
               	 	<th>工号</th>
               	 	<th>姓名</th>
               	 	<th>删除标记</th>
                 <th>操作</th>
               </tr>
             </thead>
             <tbody>
               	<c:forEach items="${pageInfo.list}" var="obj">
				<tr>
               	 	<td>${obj.id}</td>
               	 	<td>${obj.companyId}</td>
               	 	<td>${obj.officeId}</td>
               	 	<td><a href="adminManage/sys/sysUser/show.do?id=${obj.id}">${obj.loginName}</a></td>
               	 	<td>${obj.no}</td>
               	 	<td>${obj.name}</td>
               	 	<td>${obj.delFlag}</td>
					<td>修改 删除</td>
				</tr>
				</c:forEach>
	</table>
</body>
</html>
