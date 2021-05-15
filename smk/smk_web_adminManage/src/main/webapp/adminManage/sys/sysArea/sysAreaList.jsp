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
	<table class="table table-striped table-bordered table-condensed">
 		<thead>
            <tr>
            	 <th>区域名称</th>
            	 <th>区域编码</th>
            	 <th>区域类型</th>
            	 <th>备注信息</th>
              <th>操作</th>
            </tr>
          </thead>
	      <tbody>
	        <c:forEach items="${pageInfo.list}" var="obj">
			<tr>
	             	 	<td>${obj.name}</td>
	             	 	<td>${obj.code}</td>
	             	 	<td>${obj.type}</td>
	             	 	<td>${obj.remarks}</td>
				<td>修改 删除</td>
			</tr>
			</c:forEach>
		  </tbody>
	</table>
</body>
</html>
