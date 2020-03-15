<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
	.topword{
		color: #f4f9f4;
	}
	.navbar-inverse{
		background-color:#9C231B !important;
		border-color:#9C231B !important;
		/*border-color:#CC6699 !important;*/
	}
</style>
<nav class="navbar navbar-default navbar-static-top navbar-inverse" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="#" class="navbar-brand"><span class="topword">莆院商城后台管理</span></a>
		</div>
		<p class="navbar-text navbar-right"><span class="topword">当前管理员:<font style="vertical-align:1px">${admin.username}</font></span></p>
	</div>
</nav>


