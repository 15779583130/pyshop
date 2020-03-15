<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/15
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    $(function () {
        var t=$("input[name='cname']").val();
        $("input[name='cname']").val("").focus().val(t);
        $('#myli a:eq(1)').addClass("active");
        $("#levela option[value='${condition.clevel[0]}']").prop("selected",true);
        //$("#parent_ida option[value='${conditon.cparentId[0]}']").prop("selected",true);
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/getLevel?level=${condition.clevel[0]}",
            async:true,
            success:function(data){
                var  data=JSON.parse(data);
                $.each(data,function (index,item) {
                    var oP=$("<option class="+item.cname+">"+item.cname+"</option>");
                    $(oP).val(item.cid);
                    $('#parent_ida').append(oP);
                })
                $("#parent_ida option[value='${condition.cparentId[0]}']").prop("selected",true);
            }
        }) ;


        $('#levela').change(function(){
            $('#parent_ida').html("<option value=''>不限</option>");
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
                        $('#parent_ida').append(oP);
                    })
                }
            });
        });
    })

    function addCategory(d_num) {
        var index=layer.open({
            title: false,
            type: 2,
            content:"${pageContext.request.contextPath}/admin/addCategory",
            closeBtn: false,
            shadeClose: true,
            area: ['330px','350px'],
        })

    }

    function editCategory(cid) {
        var index=layer.open({
            title: false,
            type: 2,
            anim: 5,
            content:"${pageContext.request.contextPath}/admin/category/edit?cid="+cid,

            closeBtn: false,
            shadeClose: true,
            area: ['330px', '350px'],
        })

    }

    function findPage(pageNum) {
        if(pageNum!=0){
            $(".currentPage").val(pageNum);
            $('.myform').submit();
        }
    }
    function deleteCategory(cid) {
        $.ajax({
            url:"${pageContext.request.contextPath}/getNumInCategory?cid="+cid,
            dataType:"json",
            success:function(res){
                if(res.status=="0"){
                    var p=layer.confirm(res.msg+",您确定删除该分类吗",function () {
                        window.location.href="${pageContext.request.contextPath}/admin/category/delete?cid="+cid;
                    });
                }else{
                    layer.alert(res.msg);
                }
            }
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

<div id="route">
    <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/admin/index">系统菜单</a></li>
        <li class="active">分类管理</li>
    </ol>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <form action="${pageContext.request.contextPath}/admin/category/list" method="post" class="form-inline myform">
            <a class="btn btn-success" href="javascript:addCategory()" style="margin-right:30px" ><i class="fa fa-plus"></i>&nbsp;添加</a>

            <div class="form-group">
                <input type="text" name="cname" placeholder="种类名称" class="form-control" value="${condition.cname[0]}" autofocus="">
                <input type="hidden" class="currentPage" name="pageNum">
            </div>

            <label for="" style="margin-left:20px">级别:</label>
            <select class="form-control" style="margin-left:0px;vertical-align:middle" name="clevel" id="levela">
                <option value="">不限</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
            <label for="" style="margin-left:15px">所属品类:</label>
            <select class="form-control" style="margin-left:0px;vertical-align:middle" name="cparentId" id="parent_ida">
                <option value="">不限</option>
            </select>

            <%--<input type="submit" value="搜索" class="btn btn-default pull-right">--%>
            <button type="submit" class="btn btn-default pull-right"><i class="fa fa-search"></i>&nbsp;查询</button>
            <button type="button" class="btn btn-default pull-right" style="margin-right:5px" onclick="resetForm();"><i class="fa fa-repeat"></i>&nbsp;重置</button>
        </form>
    </div>
    <div class="panel-body">
        <table class="table table-bordered table-striped table-hover table-condensed">
            <tr>
                <th>种类名称</th>
                <th>种类级别</th>
                <th>所属品类</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="category"  varStatus="vs">
                <tr>
                    <td>${category.cname}</td>
                    <td>${category.clevel==1?'1级':(category.clevel==2?'2级':'3级')}</td>
                    <td>${category.belong}</td>
                    <td>
                        <a class="btn btn-info btn-xs" href="javascript:editCategory(${category.cid})"><i class="fa fa-pencil"></i>&nbsp;编辑</a>
                        <a class="btn btn-danger btn-xs" href="javascript:deleteCategory(${category.cid})"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h5>当前是第${pageInfo.pages==0?0:pageInfo.pageNum}页,共${pageInfo.pages}页，总记录数为${pageInfo.total}条。</h5>
        <nav style="text-align:center">
            <ul class="pagination">
                <li><a href="javascript:findPage(1)"><span>首页</span></a></li>
                <c:if test="${pageInfo.pageNum==1}">
                    <li class="disabled"><a href="javascript:void(0)"><span>上一页</span></a></li>
                </c:if>

                <c:if test="${pageInfo.pageNum!=1}">
                    <li><a href="javascript:findPage(${pageInfo.pageNum-1})"><span>上一页</span></a></li>
                </c:if>

                <c:forEach begin="1" end="${pageInfo.pages}" var="page">
                    <c:if test="${pageInfo.pageNum==page}">
                        <li class="active"><a href="javascript:void(0)">${page}</a></li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum!=page}">
                        <li style="margin-right:5px"><a href="javascript:findPage(${page})">${page}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${pageInfo.pageNum==pageInfo.pages||pageInfo.pages==0}">
                    <li class="disabled"><a href="javascript:void(0)"> <span>下一页</span>
                    </a></li>

                </c:if>

                <c:if test="${pageInfo.pageNum!=pageInfo.pages&&pageInfo.pages!=0}">
                    <li><a href="javascript:findPage(${pageInfo.pageNum+1})"> <span>下一页</span>
                    </a></li>
                </c:if>
                <li><a href="javascript:findPage(${pageInfo.pages})"><span>尾页</span></a></li>
            </ul>
        </nav>
    </div>
</div>


