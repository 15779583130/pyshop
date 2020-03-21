<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/3
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>我的足迹</title>
    <LINK rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userLeftNav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userNavH.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userSearch.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/topOther.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/buttom.css" />
    <script src="${pageContext.request.contextPath}/static/user/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/holder.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/Calculation.js"></script>
</head>
<style>
    div.collectDiv .imgDiv img {
        width: 180px;
        height: 180px;
        vertical-align: middle;
    }

    div.collectDiv .backGeZi {
        display: none;
        position: absolute;
        top: 0px;
        text-align: center;
        vertical-align: middle;
        width: 180px;
        height: 180px;
        background-color: rgba(255, 255, 255, .2);
        opacity: 0;
    }

    div.collectDiv .photoGeZi:hover div.backGeZi {
        display: block;
        opacity: 1;
        z-index: 999;
    }

    div.collectDiv .photoGeZi:hover .collectDele {
        margin-top: 2px;
        margin-left: 70%;
    }
    div.collectDiv .photoGeZi:hover .collectDele span{
        font-size: 14px;
    }
    div.collectDiv .photoGeZi:hover .collectDele span:hover {
        background: #EEA236;
        color: #FFFFFF;
        font-size: 14px;
    }
    div.collectDiv .photoGeZi:hover div.backGeZiButton {
        margin-top: 65%;
    }
    div.collectDiv .collectDes{
        width: 180px;
    }
    div.collectDiv .collectDes .collectPrice p{
        display: inline;
        font-size: 14px;
    }
    div.collectDiv .collectDes .collectPrice span.money{
        color: #D43F3A;
        font-weight: bold;
        margin-right: 5px;
    }
    div.collectDiv .collectDes .collectPrice span.moneyDele{
        text-decoration: line-through;
        font-size: 12px;
        color: #999999;
    }
    div.collectDiv .collectBt{
        margin-bottom: 5px;
    }
    div.collectDiv .collectBt p {
        font-size: 14px;
        text-align: left;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        margin: 2px;
        width: 180px;
    }

    div.collectDiv .collectBt a {
        color: #666;
    }

    div.collectDiv .collectBt a:hover {
        color: #D43F3A;
    }
    div.userLeftNavDiv li a.myactive{
        color: #D43F3A;
    }
    legend{
        position: relative;
    }
    legend span{
        position: absolute;
        top:-14px;
        background: #FFFFFF;
        text-align: left;
        width: 110px;
        font-size: 22px;
        line-height: 28px;
    }
</style>
<script>
    $(function () {
        $('.userLeftNavDiv .list-group li:eq(2) a').addClass("myactive");
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
                <a href="${pageContext.request.contextPath}/user/index">首页</a>
            </li>
            <li>
                我的足迹
            </li>
        </ul>
    </div>
    <div class="col-md-5 " >

    </div>
</div>
<div class="container">
    <div class="row">
        <!--侧边导航-->
        <div class="col-md-2">
            <div class="userLeftNavDiv">
                <ul class="list-group">
                    <h4>个人中心</h4>
                    <li class="list-group-item userlist">
                        <a href="${pageContext.request.contextPath}/user/userInfo?uid=${user.uid}">用户信息</a>
                    </li>
                    <li class="list-group-item userlist">
                        <a href="${pageContext.request.contextPath}/user/myorder?uid=${user.uid}" >我的订单</a>
                    </li>
                    <li class="list-group-item">
                        <a href="${pageContext.request.contextPath}/user/foots?uid=${user.uid}">我的足迹</a>
                    </li>
                    <li class='list-group-item'>
                        <a href="${pageContext.request.contextPath}/user/favourite?uid=${user.uid}" >我的收藏</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-10 size">
            <div class="row">
                <div class="collectDiv">
                        <c:forEach items="${dateList}" var="date">
                                <div class="col-md-12" style="margin-top: 30px;">
                                    <fieldset>
                                        <legend><span>${date}</span></legend>
                                    </fieldset>
                                </div>
                                <c:forEach items="${footsList}" var="foot">
                                    <c:set var="testtime">
                                        <fmt:formatDate value="${foot.htime}" pattern="yyyy.MM.dd"></fmt:formatDate>
                                    </c:set>
                                    <c:if test="${date==testtime}">
                                        <div class="col-md-3">
                                            <div class="photoGeZi">
                                                <div class="imgDiv">
                                                    <img src="${pageContext.request.contextPath}/static/images/${foot.product.pimage}"/>
                                                </div>
                                                <div class="backGeZi">
                                                    <div class="collectDele">
                                                        <a onclick="deleteFoot('${foot.product.pid}','${user.uid}')">
                                                            <span class="btn btn-sm glyphicon glyphicon-trash "></span>
                                                        </a>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="collectDes">
                                                <div class="collectPrice">
                                                    <p><span class="money"><i>￥</i>${foot.product.shopPrice}</span></p>
                                                    <p><span class="moneyDele"><i>￥</i>${foot.product.marketPrice}</span></p>
                                                </div>
                                                <div class="collectBt">
                                                    <p>
                                                        <a href="${pageContext.request.contextPath}/user/product_info?pid=${foot.product.pid}">${foot.product.pname}</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            <%--</c:if>--%>
                        </c:forEach>


                </div>
            </div>
        </div>
    </div>
</div>
<!--底部维权-->
<%@include file="bottom.jsp"%>
</body>
<script>
    function deleteFoot(pid,uid) {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/deleteFoot?uid="+uid+"&pid="+pid,
            dataType:'json',
            success:function (data) {
                window.location.reload();
            }
        })
    }
</script>
<script src="${pageContext.request.contextPath}/static/user/js/footer.js"></script>
</html>
