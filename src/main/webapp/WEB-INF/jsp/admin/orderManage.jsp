<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/popup_layer.js"></script>
<script src="${pageContext.request.contextPath}/static/bs/js/holder.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-migrate-1.2.1.js"></script>



<html>
<head>
    <title>Title</title>
</head>
<script>
    $(function () {
        var t=$("input[name='e_name']").val();
        $("input[name='e_name']").val("").focus().val(t);
        $('#myli a:eq(3)').addClass("active");
        //$(".myselect option[value='${condition[state][0]}']").prop("selected",true);
    })

    function findPage(pageNum) {
        if(pageNum!=0){
            $(".currentPage").val(pageNum);
            $('.myform').submit();
        }
    }

    function deleteEmployee(e_id) {
        layer.confirm("确认删除吗",function () {
            window.location.href="${pageContext.request.contextPath}/ManageServlet?op=deleteEmployee&e_id="+e_id;
        })
    }

    //点击按钮查询某个订单的详情
    function findOrderInfoByOid(oid){
        var index=layer.open({
            title: false,
            type: 2,
            content:"${pageContext.request.contextPath}/admin/orderinfo?oid="+oid,
            success:function(layero,index){
                layer.iframeAuto(index);
            },
            closeBtn: false,
            shadeClose: true,
            area: ['700px', '300px'],
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
            <li class="active">订单管理</li>
        </ol>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <form action="${pageContext.request.contextPath}/admin/order/list" method="post" class="form-inline myform">
                <div class="form-group">
                    <input type="hidden" name="pageNum" class="currentPage">
                    <input type="text" name="name" placeholder="收货人" class="form-control" value="${condition.name[0]}" autofocus="" style="width:150px">
                </div>

                <div class="form-group">
                    <input type="date" name="w_starttime"  class="form-control" value="${condition.w_starttime[0]}" >
                </div>
                <span>至</span>
                <div class="form-group">
                    <input type="date" name="w_endtime" class="form-control" value="${condition.w_endtime[0]}">
                </div>
                <label>&nbsp;支付状态</label>
                <select class="form-control" style="margin-left:0px;vertical-align:middle" name="state" class="myselect">
                    <option value="" ${condition.state==null||condition.state[0]==""?'selected=true':''}>不限</option>
                    <option value="1" ${condition.state[0]=="1"?'selected=true':''}>已支付</option>
                    <option value="0"} ${condition.state[0]=="0"?'selected=true':''}>未支付</option>
                </select>

                <button type="submit" class="btn btn-default pull-right"><i class="fa fa-search"></i>&nbsp;查询</button>
                <button type="button" class="btn btn-default pull-right" style="margin-right:5px" onclick="resetForm();"><i class="fa fa-repeat"></i>&nbsp;重置</button>
            </form>
        </div>
        <div class="panel-body">
            <table class="table table-bordered table-striped table-hover table-condensed">
                <tr>
                    <th width="12%">订单序号</th>
                    <th width="15%">订单时间</th>
                    <th>收货人</th>
                    <th>手机号</th>
                    <th width="15%">收货地址</th>
                    <th>金额</th>
                    <th>支付状态</th>
                    <th>详情</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="order"  varStatus="vs">
                    <tr class="mytr">
                        <td>${vs.count+(pageInfo.pageNum-1)*pageInfo.pageSize}</td>
                        <td><fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>${order.name==null?"暂未填写":order.name}</td>
                        <td>${order.telephone==null?"暂未填写":order.telephone}</td>
                        <td>${order.address==null?'暂未填写':order.address}</td>
                        <td>${order.total}</td>
                        <td>${order.state==0?'<span class="text-danger">未支付</span>':'<span class="text-success">已支付</span>'}</td>
                        <td><a href="javascript:findOrderInfoByOid('${order.oid }')" class="btn btn-default btn-xs clickedElement">查看详情</a></td>
                    </tr>
                </c:forEach>
            </table>
            <h5>当前是第${pageInfo.pages==0?0:pageInfo.pageNum}页,共${pageInfo.pages}页，总记录数为${pageInfo.total}条。</h5>
            <nav style="text-align: center">
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
