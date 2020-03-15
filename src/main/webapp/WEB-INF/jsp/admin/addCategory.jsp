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
        $('#level').change(function(){
            $('#parent_id').html("");
            var x=$(this).val();
            //var x=$('option').index($(this));
            $.ajax({
                url:"${pageContext.request.contextPath}/getLevel?level="+x,
                async:true,
                success:function(data){
                    var  data=JSON.parse(data);
                    $.each(data,function (index,item) {
                        var oP=$("<option>"+item.cname+"</option>");
                        $(oP).val(item.cid);
                        $('#parent_id').append(oP);
                    })
                }
            });
        });
    })

</script>
<style>


</style>
<body>
<div class="container" style="margin:15px auto;height:300px;">
    <form class="form-horizontal myform">

        <div class="form-group">
            <label for="address" class="col-sm-2 col-sm-offset-4 control-label">分类名称</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="address" name="cname" required>
            </div>
        </div>


        <div class="form-group">
            <label for="address" class="col-sm-2 col-sm-offset-4 control-label">分类级别</label>
            <div class="col-sm-3">
                <select class="form-control" id="level" name="clevel" required>
                    <option value="1">1级</option>
                    <option value="2">2级</option>
                    <option value="3">3级</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="address" class="col-sm-2 col-sm-offset-4 control-label">所属分类</label>
            <div class="col-sm-3">
                <select class="form-control" id="parent_id" name="cparentId">

                </select>
            </div>
        </div>


        <div class="form-group" style="margin-bottom:15px;margin-top:30px">
            <label  class="col-sm-2 col-sm-offset-4 control-label"></label>
            <div class="col-sm-3">
                <%--<button type="submit" style="display: none" class="mysubbtn"></button>--%>
                <button type="submit" class="btn btn-success" style="margin-right:30px">确定</button>
                <button type="reset" class="btn btn-primary" >重置</button>

            </div>
        </div>


    </form>

</div> <!-- /container -->
</body>
<script>
    $('.myform').submit(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/category/add",
            data:$('.myform').serialize(),
            async:true,
            success:function (data) {

            }
        })
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index);
        window.parent.location.reload();
    })
</script>
</html>