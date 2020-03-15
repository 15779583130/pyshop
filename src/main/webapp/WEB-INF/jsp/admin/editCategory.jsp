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

</script>
<style>

</style>
<body>
<div class="container" style="margin:15px auto;height:300px;">
    <form class="form-horizontal myform" action="${pageContext.request.contextPath}/admin/category/update" method="post">


        <div class="form-group">
            <label for="address" class="col-sm-2 col-sm-offset-3 control-label">分类名称</label>
            <div class="col-sm-3">
                <input type="hidden" value="${category.cid}" name="cid">
                <input type="text" class="form-control" id="address" name="cname" value="${category.cname}">
            </div>
        </div>

        <div class="form-group">
            <label for="address" class="col-sm-2 col-sm-offset-3 control-label">分类级别</label>
            <div class="col-sm-3">
                <input type="text" class="form-control"  name="clevel" value="${category.clevel}" readonly="">
            </div>
        </div>

        <div class="form-group">
            <label for="address" class="col-sm-2 col-sm-offset-3 control-label">所属分类</label>
            <div class="col-sm-3">
                <input type="text" class="form-control"  name="belong" value="${category.belong}" readonly="">
            </div>
        </div>


        <div class="form-group" style="margin-top:30px;margin-bottom:15px">
            <label  class="col-sm-2 col-sm-offset-3 control-label"></label>
            <div class="col-sm-3">
                <button type="button" class="btn btn-success mysub" style="margin-right:30px" onclick="mysub()">确定</button>
                <button type="reset" class="btn btn-primary" >重置</button>

            </div>
        </div>


    </form>

</div> <!-- /container -->
</body>
<script>
    function mysub() {
        $.ajax({
            type:'post',
            url:"${pageContext.request.contextPath}/admin/category/update",
            data:$('.myform').serialize(),
            async:true,
            success:function (data) {
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index);
                // window.parent.location.reload();
                window.parent.location.reload();
            },
        })
    }
</script>
</html>