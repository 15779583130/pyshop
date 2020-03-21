<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<html>
<head>
    <title>Title</title>
</head>
<script>
    $(function () {
        var t=$("input[name='e_name']").val();
        $("input[name='e_name']").val("").focus().val(t);
        $('#myli a:eq(4)').addClass("active");
    })

    function findPage(pageNum) {
        if(pageNum!=0){
            $(".currentPage").val(pageNum);
            $('.myform').submit();
        }
    }

    function deleteUser(uid) {
        layer.confirm("确认删除该用户吗",function () {
            window.location.href="${pageContext.request.contextPath}/admin/user/delete?uid="+uid;
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
        $('input[name=sex]').removeAttr("checked");
        $("input:radio[name='sex']").get(0).checked=true;
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
            <li class="active">用户管理</li>
        </ol>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <form action="${pageContext.request.contextPath}/admin/user/list" method="post" class="form-inline myform">
                <div class="form-group">
                    <input type="hidden" name="pageNum" class="currentPage">
                    <input type="text" name="username" placeholder="姓名" class="form-control" value="${condition.username[0]}" autofocus="">
                </div>
                <div class="radio" style="margin-left:15px">
                    <label for="">性别:</label>
                    <input type="radio" name="sex" value="" ${condition.sex[0]==null||condition.sex[0]==""?"checked":""}>不限
                    <input type="radio" name="sex" value="男" ${condition.sex[0]=="男" ?'checked':''}>男
                    <input type="radio" name="sex" value="女" ${condition.sex[0]=="女" ?'checked':''}>女
                </div>

                <button type="submit" class="btn btn-default pull-right"><i class="fa fa-search"></i>&nbsp;查询</button>
                <button type="button" class="btn btn-default pull-right" style="margin-right:5px" onclick="resetForm();"><i class="fa fa-repeat"></i>&nbsp;重置</button>
            </form>
        </div>
        <div class="panel-body">
            <table class="table table-bordered table-striped table-hover table-condensed">
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>密码</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>电话</th>
                    <th>生日</th>
                    <th>头像</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="user"  varStatus="vs">
                    <tr class="mytr">
                        <td>${vs.count+(pageInfo.pageNum-1)*pageInfo.pageSize}</td>
                        <td>${user.username}</td>
                        <td>***</td>
                        <td>${user.sex==null?'未填':user.sex}</td>
                        <td>${user.email}</td>
                        <td>${user.telephone}</td>
                        <td>
                            <c:if test="${user.birth==null}">
                                未填
                            </c:if>
                            <c:if test="${user.birth!=null}">
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${user.birth}"></fmt:formatDate>
                            </c:if>
                        </td>
                        <td><img src="${pageContext.request.contextPath}/static/images/${user.uimage}" alt="" width="35" height="35"></td>
                        <td>
                            <a class="btn btn-danger btn-xs" href="javascript:deleteUser(${user.uid})">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <h5>当前是第${pageInfo.pages==0?0:pageInfo.pageNum}页,共${pageInfo.pages}页，总记录数为${pageInfo.total}条。</h5>
            <nav style="text-align: center;margin-top:-15px">
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
</body>
</html>
