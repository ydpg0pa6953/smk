<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/mytags.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<%@ include file="/common/bootstrap.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#menu a.menu").click(function() {
			$("#menu li.menu").removeClass("active");
			alert(123);
			$(this).parent().addClass("active");
			if (!$("#openClose").hasClass("close")) {
				$("#openClose").click();
			}
		});
	});
</script>
</head>

<body>
	<nav class="navbar navbar-default" role="navigation">
	  <div class="container-fluid">
	    <!-- 系统功能标题和logo -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <font class="navbar-brand">企信通</font>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <!-- 系统主功能菜单 -->	
	      <ul id="menu" class="nav navbar-nav">
	      	<li class="active"><a class="menu" target="menuFrame" href="${ctx}/adminManage/sys/menu/menuTree.jsp">权限管理</a></li>
	      	<li><a class="menu" target="menuFrame" href="${ctx}/adminManage/sys/menu/menuTree.jsp">基础数据维护</a></li>
	      	<li><a class="menu" target="menuFrame" href="${ctx}/adminManage/sys/menu/menuTree.jsp">运行监控</a></li>
	      	<li><a class="menu" target="menuFrame" href="${ctx}/adminManage/sys/menu/menuTree.jsp">用户管理</a></li>
	      	<li><a class="menu" target="menuFrame" href="${ctx}/adminManage/sys/menu/menuTree.jsp">计费管理</a></li>
	      	<li><a class="menu" target="menuFrame" href="${ctx}/adminManage/sys/menu/menuTree.jsp">统计管理</a></li>
	      </ul>
	      <!--  -->
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">操作员 <span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">个人信息</a></li>
	            <li><a href="#">我的日历</a></li>
	            <li><a href="#">收件箱</a></li>
	            <li><a href="#">我的任务</a></li>
	            <li class="divider"></li>
	            <li><a href="#">锁屏</a></li>
	            <li><a href="#">注销</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<div class="container-fluid">
      <div id="content" class="row">
      	<div id="left" width="200">
			<iframe id="menuFrame" name="menuFrame" src="${ctx}/adminManage/sys/menu/menuTree.jsp" 
				style="overflow:visible;" scrolling="yes" frameborder="no" width="100%" height="650"></iframe>
		</div>
		<div id="openClose" class="close">&nbsp;</div>
		<div id="right">
			<iframe id="mainFrame" name="mainFrame" src="" style="overflow:visible;"
				scrolling="yes" frameborder="no" width="100%" height="650"></iframe>
		</div>
      </div>
    </div>   
    
	<script type="text/javascript"> 
		var leftWidth = "160"; // 左侧窗口大小
		function wSize(){
			var minHeight = 500, minWidth = 980;
			var strs=getWindowSize().toString().split(",");
			$("#menuFrame, #mainFrame, #openClose").height((strs[0]<minHeight?minHeight:strs[0])-$("#header").height()-$("#footer").height()-32);
			$("#openClose").height($("#openClose").height()-5);
			if(strs[1]<minWidth){
				$("#main").css("width",minWidth-10);
				$("html,body").css({"overflow":"auto","overflow-x":"auto","overflow-y":"auto"});
			}else{
				$("#main").css("width","auto");
				$("html,body").css({"overflow":"hidden","overflow-x":"hidden","overflow-y":"hidden"});
			}
			$("#right").width($("#content").width()-$("#left").width()-$("#openClose").width()-5);
		}
	</script>
	<script src="${ctx}/plug-in/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>
