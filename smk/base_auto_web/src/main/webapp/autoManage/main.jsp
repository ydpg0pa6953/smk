<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/mytags.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>">
<link href="${pageContext.request.contextPath}/autoManage/resources/css/main.css" rel="stylesheet" type="text/css" />
<%@ include file="/common/easyui.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/autoManage/resources/js/main.js"></script>
</head>

<body id="cc" class="easyui-layout" style="overflow-y: hidden" scroll="no">
	<noscript>
		<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
		    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
		</div>
	</noscript>
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>
	<div data-options="region:'west',title:'导航菜单',split:true" style="left: 0px; top: 60px; width: 200px;">
		<div id="nav" class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
				
		</div>
	</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	<!-- 中间-->
	<div id="mainPanle" data-options="region:'center'" style="overflow: hidden;">
		<div id="tabs" class="easyui-tabs"  fit="true" border="false" style="padding:2px; overflow: hidden;">
			<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">
				<h1>Welcome to jQuery UI!</h1>
			</div>
		</div>
	</div>
</body>
</html>
