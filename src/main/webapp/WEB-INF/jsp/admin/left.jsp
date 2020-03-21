<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/25
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
<div id="left">
	<ul class="nav nav-pills nav-stacked myul">
		<li><a href="${pageContext.request.contextPath}/admin/index">系统菜单</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/category/list">分类管理</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/product/list">商品管理</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/order/list">订单管理</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/user/list">用户管理</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/report">统计报表</a></li>
		<li id="test"><a href="${pageContext.request.contextPath}/admin/exit">安全退出</a></li>
	</ul>
</div>--%>

<a href="${pageContext.request.contextPath}/admin/index" class="list-group-item"><span class="glyphicon glyphicon-home"></span>&nbsp;系统菜单</a>
<a href="${pageContext.request.contextPath}/admin/category/list" class="list-group-item"><span class="glyphicon glyphicon-tasks"></span>&nbsp;分类管理</a>
<a href="${pageContext.request.contextPath}/admin/product/list" class="list-group-item"><span class="glyphicon glyphicon-gift"></span>&nbsp;商品管理</a>
<a href="${pageContext.request.contextPath}/admin/order/list" class="list-group-item"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;订单管理</a>
<a href="${pageContext.request.contextPath}/admin/user/list" class="list-group-item"><span class="glyphicon glyphicon-user"></span>&nbsp;用户管理</a>
<a href="${pageContext.request.contextPath}/admin/report" class="list-group-item"><span class="glyphicon glyphicon-globe"></span>&nbsp;统计报表</a>
<a href="${pageContext.request.contextPath}/admin/exit" class="list-group-item"><span class="glyphicon glyphicon-off"></span>&nbsp;安全退出</a>





