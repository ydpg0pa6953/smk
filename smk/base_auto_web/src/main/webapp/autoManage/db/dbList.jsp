<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/mytags.jsp"%>
<%@ include file="/common/easyui.jsp"%>

<div class="easyui-layout" fit="true">
	<div class="datagrid-toolbar" title="数据库列表" data-options="region:'north',border:false" style="height: 100;">
		<div id="tb" style="padding:5px;height:auto">
		    <div style="margin-bottom:5px">  
		        Date From: <input class="easyui-datebox" style="width:80px">  
		        To: <input class="easyui-datebox" style="width:80px">  
		        Language:   
		        <input class="easyui-combobox" style="width:100px"  
		                url="data/combobox_data.json"  
		                valueField="id" textField="text">  
		        <a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>  
		    </div>  
		    <div>  
		        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>  
		        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>  
		        <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"></a>  
		        <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>  
		        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>  
		    </div>
		</div>  
	</div>

	<div region="center" style="padding:1px;">
		<table class="easyui-datagrid" style="padding:1px;"
				data-options="fit:true,singleSelect:true,pagination:true,pageSize:10,url:'db_data.json'">
			<thead>
				<tr>
					<th field="dbName">数据库名称</th>
					<th field="dbType">类型</th>
					<th field="dbUrl">url</th>
					<th field="dbAccount">账号</th>
					<th field="dbPwd">密码</th>
				</tr>
			</thead>
		</table>	
	</div>
</div>