<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/13
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
<script src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/static/bs/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bs/js/holder.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/paging.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<script>
    $(function () {
        var t=$("input[name='pname']").val();
        $("input[name='pname']").val("").focus().val(t);
        $('#myli a:eq(2)').addClass("active");
        if('${result}'!=null&&'${result}'!=""){
            layer.alert('${result}');
        }
        $("option[value='${condition.isHot[0]}']").prop("selected",true);
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/getLevel?level=4",
            async:true,
            success:function(data){
                var  data=JSON.parse(data);
                $.each(data,function (index,item) {
                    var oP=$("<option>"+item.cname+"</option>");
                    $(oP).val(item.cid);
                    $('.myselect').append(oP);
                })
                $(".myselect option[value='${condition.cid[0]}']").prop("selected",true);
            }
        })
    })

    function findPage(currentPage) {
        if(currentPage!=0){
            $(".currentPage").val(currentPage);
            $('.myform').submit();
        }
    }

    function deleteProduct(pid) {
        layer.confirm("确认删除吗",function () {
            window.location.href="${pageContext.request.contextPath}/admin/product/delete?pid="+pid;
        })
    }

    function resetForm() {
        $(".form-inline").find("input").each(function(){
            $(this).val("");
        });
        $(".form-inline").find("select").each(function () {
            $(this).find("option:selected").attr("selected", false);
            $(this).find("option").first().attr("selected", true);
        });
    }

</script>
<style>
    .mytr td{
        vertical-align:middle !important;
    }
</style>
<body>
<div id="route">
    <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/admin/index">系统菜单</a></li>
        <li class="active">商品管理</li>
    </ol>
</div>
<div class="panel panel-default">
    <div class="panel-heading">
        <form action="${pageContext.request.contextPath}/admin/product/list" method="post" class="form-inline myform">
            <a class="btn btn-success" href="${pageContext.request.contextPath}/admin/addProduct" style="margin-right:15px" ><i class="fa fa-plus"></i>&nbsp;添加</a>

            <div class="form-group">
                <input type="hidden" name="pageNum" class="currentPage">
                <input type="text" name="pname" placeholder="商品名称" class="form-control" value="${condition.pname[0]}" autofocus="">
            </div>

            <label for="" style="margin-left:15px">是否热门:</label>
            <select name="isHot" id="" class="form-control">
                <option value="">不限</option>
                <option value="1">是</option>
                <option value="0">否</option>
            </select>

            <label for="" style="margin-left:15px">所属分类:</label>
            <select name="cid"class="form-control myselect">
                <option value="">不限</option>
            </select>

            <button type="submit" class="btn btn-default pull-right"><i class="fa fa-search"></i>&nbsp;查询</button>
            <button type="button" class="btn btn-default pull-right" style="margin-right:5px" onclick="resetForm();"><i class="fa fa-repeat"></i>&nbsp;重置</button>
        </form>
    </div>
    <div class="panel-body">
        <table class="table table-bordered table-striped table-hover table-condensed">
            <tr>
                <th width="25%">商品名称</th>
                <th>商品图片</th>
                <th>商品价格</th>
                <th>是否热门</th>
                <th>商品种类</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="product"  varStatus="vs">
                <tr class="mytr">
                    <td>${product.pname}</td>
                    <td><img src="${pageContext.request.contextPath}/static/images/${product.pimage}" alt=""  width="40" height="45"></td>
                    <td>${product.shopPrice}</td>
                    <td>${product.isHot==1?'是':'否'}</td>
                    <td>${product.cname}</td>
                    <td>
                        <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/admin/editProduct?pid=${product.pid}"><i class="fa fa-plus"></i>&nbsp;编辑</a>
                        <a class="btn btn-danger btn-xs" href="javascript:deleteProduct(${product.pid})"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h5>当前是第${pageInfo.pages==0?0:pageInfo.pageNum}页,共${pageInfo.pages}页，总记录数为${pageInfo.total}条。</h5>
        <div id="page" class="page_div" style="text-align: center">

        </div>
    </div>
</div>
</body>
<script>
    $("#page").paging({
        pageNo:${pageInfo.pageNum},
        totalPage:${pageInfo.pages},
        totalSize:${pageInfo.total},
        callback: function(num) {
            console.log(isNaN(num));
            if(!isNaN(num)){
                $('.currentPage').val(num);
                $('.myform').submit();
            }
        }
    })
</script>
</html>
