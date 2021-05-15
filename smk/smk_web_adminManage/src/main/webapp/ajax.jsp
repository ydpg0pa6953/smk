<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/mytags.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ctx}plug-in/easyui/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:'${ctx}adminManage/sys/sysUser/list7.do?userId=94300452',
				dataType:'json',
				success: function (data) {
					alert(data.success);
				}
		});
	})
</script>
</head>
<body>
123
</body>
</html>