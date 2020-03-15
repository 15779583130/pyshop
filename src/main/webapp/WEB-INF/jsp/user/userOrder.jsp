<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/4
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/topOther.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userSearch.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/common.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/allorders.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userNavH.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userLeftNav.css" />
    <script src="${pageContext.request.contextPath}/static/user/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/layer/layer.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/Calculation.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/holder.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/holder.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>
    div.userLeftNavDiv li a.myactive{
        color: #D43F3A;
    }
</style>
<script>
    $(function () {
        $('.userLeftNavDiv .list-group li:eq(1) a').addClass("myactive");
    })
</script>
<body>

<!--顶部灰色区域-->
<%@include file="top.jsp"%>
<!--搜索一排-->
<div class="row searchBox">
    <div class="col-md-2 column" style="text-align: right;">
        <img  src="${pageContext.request.contextPath}/static/images/logo7.png" width="140" height="70"/>
    </div>
    <div class="col-md-5 userBt" style="line-height: 70px;">
        <ul class="list-inline userNavH">
            <li>
                <a href="index.html">首页</a>
            </li>
            <li>
                全部订单
            </li>
        </ul>
    </div>
</div>

<div class="container size">
    <div class="row">
        <!--侧边导航-->
        <div class="col-md-2">
            <div class="userLeftNavDiv">
                <ul class="list-group ">
                    <h4>个人中心</h4>
                    <li class="list-group-item userlist">
                        <div class="">
                            <a href="${pageContext.request.contextPath}/user/userInfo" >用户信息</a>
                        </div>
                    </li>
                    <li class="list-group-item userlist">
                        <div class=''>
                            <a href="${pageContext.request.contextPath}/user/myorder?uid=${user.uid}">我的订单</a>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="">
                            <a href="${pageContext.request.contextPath}/user/foots?uid=${user.uid}">我的足迹</a>
                        </div>
                    </li>
                    <li class='list-group-item'>
                        <div class="">
                            <a href="${pageContext.request.contextPath}/user/favourite?uid=${user.uid}">我的收藏</a>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="col-md-12 dingDiv">
                <table class="table table-bordered " style="width: 100%;">
                    <tbody>
                    <tr style="height: 50px;">
                        <th style="width: 50%">宝贝信息</th>
                        <th style="width: 15%">单价</th>
                        <th style="width: 15%">数量</th>
                        <th style="width: 20%">实付款</th>

                    </tr>
                    </tbody>
                </table>
                <div class="dingOne">
                    <c:forEach items="${pageInfo.list}" var="order">
                        <table class="" style="width: 100%; border: 1px #DDDDDD solid;border-top: none;background: #F8F8F8;">
                            <tr class="">
                                <td class="borTBNone padTb">
                                    <div class="ddxx" >
                                        <span class="ddsj"><b><fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></b></span>
                                        <span class="ddbh">订单编号:${order.oid}</span>
                                        <span class="ddzt">${order.state==0?'<span>未支付</span>':'<span class="text-success">已支付</span>'}</span>
                                        <span>合计:<i>￥</i>${order.total}</span>
                                        <span class="ddzt">
                                            <c:if test="${order.state==0}">
                                                <a href="${pageContext.request.contextPath}/user/goToPay?oid=${order.oid}">现在去支付?</a>
                                            </c:if>
                                        </span>
                                    </div>
                                </td>

                                <td>
                                    <a class="glyphicon glyphicon-trash btn btn-default btn-xs dele" onclick="deleteOrder('${order.oid}')"></a>
                                </td>
                            </tr>
                        </table>
                        <div class="dingTow">
                            <c:forEach items="${order.orderItems}" var="orderItem">
                                <table class="table table-bordered" style="width: 100%;">

                                        <tr>
                                            <td style="width: 50%">
                                                                      <div class="panel-body bbxx">
                                                                      <div>
                                                                      <img src="${pageContext.request.contextPath}/static/images/${orderItem.product.pimage}">
                                                                      </div>
                                                                      <div class="name">
                                                                      <p>${orderItem.product.pname}</p>
                                                                      </div>
                                                                      </div>
                                                                      </td>
                                            <td style="width: 15%">
                                                <p class=""><i>￥</i><span class="money">${orderItem.product.shopPrice}</span></p>
                                            </td>
                                            <td style="width: 15%">${orderItem.count}</td>
                                            <td style="width: 20%">
                                                <p class=""><i>￥</i><span class="money">${orderItem.subtotal}</span></p>
                                            </td>
                                        </tr>

                                </table>
                            </c:forEach>
                        </div>
                    </c:forEach>


                </div>
            </div>
        </div>
        <div class="col-md-2">

        </div>
        <div class="col-md-10" style="text-align: center;">
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
        </div>
    </div>
</div>

<!--底部维权-->
<%@include file="bottom.jsp"%>
</body>
<script>
    function deleteOrder(oid) {
        layer.confirm("您确定要删除该订单吗?",function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/user/deleteOrder?oid="+oid,
                dataType:'json',
                success:function (data) {
                    window.location.reload();
                }
            })
        })
    }

    function findPage(pageNum) {
        if(pageNum!=0){
            window.location.href="${pageContext.request.contextPath}/user/myorder?uid=${user.uid}&pageNum="+pageNum;
        }
    }
</script>
<script src="${pageContext.request.contextPath}/static/user/js/footer.js"></script>
</html>

