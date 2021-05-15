<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/mytags.jsp"%>
<%@ include file="/common/easyui.jsp"%>

<!DOCTYPE script PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			title : '数据字典记录',
			fit : true,
			url : 'dictionary_data.json',
			columns : [ [ {
				field : 'code',
				title : 'Code',
				width : 100
			}, {
				field : 'name',
				title : 'Name',
				width : 100
			}, {
				field : 'price',
				title : 'Price',
				width : 100,
				align : 'right'
			} ] ],
			toolbar : [ {
				iconCls : 'icon-add',
				text : '新增',
				handler : function() {
					alert('编辑按钮')
				}
			}, '-', {
				iconCls : 'icon-edit',
				text : '修改',
				handler : function() {
					alert('编辑按钮')
				}
			}, '-', {
				iconCls : 'icon-remove',
				text : '删除',
				handler : function() {
					alert('删除按钮')
				}
			}, '-', {
				iconCls : 'icon-help',
				handler : function() {
					alert('帮助按钮')
				}
			} ]
		});
	});
</script>
</head>

<body>
	<div style="width: 100%; height: 100%;">
		<!-------------------------------搜索框----------------------------------->
		<fieldset>
			<legend>查询条件</legend>
			<form id="ffSearch" method="post">
				系统编号：<input type="text">
				系统编号：<input type="text">
				系统编号：<input type="text">
				系统编号：<input type="text"><br />
				I P 地 址：<input type="text"><br />
				<div style="margin-bottom: 5px">
					<label for="txtSystemType_ID">系统编号：</label> <input
						class="easyui-combobox" type="text" ID="txtSystemType_ID"
						name="txtSystemType_ID" style="width: 100px" />&nbsp;&nbsp;&nbsp;

					<label for="txtLoginName">登录名称：</label> <input type="text"
						ID="txtLoginName" name="txtLoginName" style="width: 100px" />&nbsp;&nbsp;&nbsp;

					<label for="txtFullName">真实名称：</label> <input type="text"
						ID="txtFullName" name="txtFullName" style="width: 100px" />&nbsp;&nbsp;&nbsp;

					<label for="txtNote">日志描述：</label> <input type="text" ID="txtNote"
						name="txtNote" style="width: 100px" />&nbsp;&nbsp;&nbsp;
				</div>
				<div>
					<label for="txtIPAddress"> I P 地 址：</label> <input type="text"
						ID="txtIPAddress" name="txtIPAddress" style="width: 100px" />&nbsp;&nbsp;&nbsp;

					<label for="txtMacAddress">Mac地址：</label> <input type="text"
						ID="txtMacAddress" name="txtMacAddress" style="width: 100px" />&nbsp;&nbsp;&nbsp;

					<label for="txtLastUpdated">开始时间：</label> <input
						class="easyui-datebox" type="text" ID="txtLastUpdated"
						name="txtLastUpdated" style="width: 100px" />&nbsp;&nbsp;&nbsp; <label
						for="txtLastUpdated2">结束时间：</label> <input class="easyui-datebox"
						type="text" ID="txtLastUpdated2" name="txtLastUpdated2"
						style="width: 100px" />&nbsp;&nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" iconcls="icon-search" id="btnSearch">查询</a>
				</div>
			</form>
		</fieldset>
		
		<table id="dg"></table>
	</div>
</body>
</html>