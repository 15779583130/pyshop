<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>人事资源管理系统</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
	<script src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
	<script src="${pageContext.request.contextPath}/static/bs/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/bs/js/holder.min.js"></script>
</head>
<script>
	$(function () {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/AjaxServlet?op=findAllDepartment",
            async:true,
            dataType:"json",
			success:function (res) {
                $.each(res,function (index,item) {
                    var oP=$("<option>"+item.d_name+"</option>");
                    $(oP).val(item.d_num);
                    $('#department').append(oP);
                })
            }

        });
    })
</script>
<style>

	form{
		margin-top:15px;
	}
</style>
<body>
<div class="container">
	<form class="form-horizontal" id="myform" action="${pageContext.request.contextPath}/ManageServlet?op=addEmployee" method="post">

		<div class="form-group">
			<label  class="col-sm-2 col-sm-offset-3 control-label">编号</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="e_num" name="e_num" >
			</div>
		</div>

		<div class="form-group">
			<label  class="col-sm-2 col-sm-offset-3 control-label">姓名</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="passowrd" name="e_name"  >
			</div>
		</div>

		<div class="form-group">
			<label for="" class="col-sm-2 col-sm-offset-3 control-label">性别</label>
			<div class="col-sm-3">
				<div class="radio-inline">
					<label for="">
						<input type="radio" name="e_gender">男
					</label>
				</div>
				<div class="radio-inline">
					<label for="">
						<input type="radio" name="e_gender">女
					</label>
				</div>
			</div>
		</div>


		<div class="form-group">
			<label  class="col-sm-2 col-sm-offset-3 control-label">身份证号</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" name="e_idcard" >
			</div>
		</div>

		<div class="form-group">
			<label for="address" class="col-sm-2 col-sm-offset-3 control-label">电话号码</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="address" name="e_tellnumber" >
			</div>
		</div>

		<div class="form-group">
			<label for="address" class="col-sm-2 col-sm-offset-3 control-label">所属部门</label>
			<div class="col-sm-3">
				<select class="form-control" id="department" name="d_num">

				</select>
			</div>
		</div>

		<div class="form-group" style="margin-top:60px">
			<label  class="col-sm-2 col-sm-offset-3 control-label"></label>
			<div class="col-sm-3">
				<button type="submit" class="btn btn-success" style="margin-right:30px">确定</button>
				<button type="reset" class="btn btn-primary" >重置</button>

			</div>
		</div>


	</form>

</div> <!-- /container -->
</body>
</html>