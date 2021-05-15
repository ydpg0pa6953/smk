<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/mytags.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<%@ include file="/common/bootstrap.jsp"%>
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
	      <ul class="nav navbar-nav">
	      	<li class="active"><a href="#">权限管理</a></li>
	      	<li><a href="#">基础数据维护</a></li>
	      	<li><a href="#">运行监控</a></li>
	      	<li><a href="#">用户管理</a></li>
	      	<li><a href="#">计费管理</a></li>
	      	<li><a href="#">统计管理</a></li>
	      </ul>
	      <!--  -->
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">操作员 <span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
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
      	<div id="left">
			<iframe id="menuFrame" name="menuFrame" src="${ctx}/adminManage/menu/" style="overflow:visible;"
					scrolling="yes" frameborder="no" width="100%" height="650"></iframe>
		</div>
		<div id="right">
			<iframe id="mainFrame" name="mainFrame" src="" style="overflow:visible;"
				scrolling="yes" frameborder="no" width="100%" height="650"></iframe>
		</div>
      </div>
    </div>   
	
</body>
</html>
