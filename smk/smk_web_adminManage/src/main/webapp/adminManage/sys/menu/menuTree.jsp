<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/mytags.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>菜单导航</title>
<%@ include file="/common/bootstrap.jsp"%>
</head>
<body>
	<div class="accordion" id="menu">
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse" data-parent="#menu" 
					href="#collapse1" title="权限管理">
					<i class="icon-chevron-down'}"></i>&nbsp;权限管理
				</a>
			</div>
			<div id="collapse1" class="accordion-body collapse}">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li>
							<a href="menuList.jsp" target="mainFrame">
								<i class="icon-circle-arrow-right"></i>&nbsp;菜单管理
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>