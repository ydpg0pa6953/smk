<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/mytags.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>登录</title>
<%@ include file="/common/bootstrap.jsp"%>
<link href="resources/css/login.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="${ctx}plug-in/bootstrap/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="${ctx}plug-in/bootstrap/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container">

      <form action="${ctx}/adminManage/sys/main.jsp" class="form-signin" role="form">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="email" class="form-control" placeholder="Email address" required autofocus>
        <input type="password" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="${ctx}plug-in/bootstrap/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>