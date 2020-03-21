<%@ page import="com.fasterxml.jackson.annotation.JsonInclude" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/22
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>数码科技</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/buttom.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/top.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/shuTech.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/dhleft.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/font-awesome.css"/>


    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/jquery-1.11.0.js" ></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/holder.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/carousel.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>


</style>
<body>
<div>
<!--top-->
<%@include file="top.jsp"%>
<div class="container">
    <!--search-->
    <div class="row searchBox">
        <div class="col-md-3 column">
            <img  src="${pageContext.request.contextPath}/static/images/logo7.png" width="140" height="70"/>
        </div>
        <div class="col-md-3">
        </div>
        <div class="col-md-6">
            <div class="searchInput">
                <form class="searchForm" role="search" style="padding: 0px;" action="${pageContext.request.contextPath}/user/search" method="post">
                    <input type="text" class="form-control searchWidth" placeholder="莆院商城超级品牌日 爆品最高立减2000元"  name="keywords"/>
                    <a href="" class="btn btn-danger">搜索</a>
                </form>
            </div>
        </div>
    </div>

    <div>
        <ol class="breadcrumb breadcrumb1">
            <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
            <c:forEach items="${breadCrumbList}" var="breadCrumb" begin="0" varStatus="vs">
                <c:if test="${!vs.last}">
                    <li><a href="${pageContext.request.contextPath}/user/product_list?cid=${breadCrumb.cid}">${breadCrumb.cname}</a></li>
                </c:if>
                <c:if test="${vs.last}">
                    <li class="active">${breadCrumb.cname}</li>
                </c:if>
            </c:forEach>
        </ol>
    </div>
    <form action="${pageContext.request.contextPath}/user/product_list?cid=${cid}" method="post" class="myform">
        <input type="hidden" name="pageNum" class="currentPage">
        <input type="hidden" value="${condition.updown[0]}" name="updown">
        <input type="hidden" name="dateupdown" value="${condition.dateupdown[0]}">
        <input type="hidden" name="pricefrom" value="${condition.pricefrom[0]}">
        <input type="hidden" name="priceto" value="${condition.priceto[0]}">
        <input type="hidden" name="general" value="${condition.general[0]}">
    </form>
    <!--浏览商品-->
    <div class="row" style="min-height:690px">

        <div class="col-md-12">
            <div class="row smkj_nav ">
                <div class="col-md-12">
                    <div class="conditionCheck">
                        <form class="nav_price">
                            <ul class="nav navbar-nav">
                                <li class="active">
                                    <a href="javascript:general('desc')">综合排序
                                        <c:if test="${condition.general[0]=='desc'}">
                                            <b class="fa fa-caret-down" id="arrow"></b>
                                        </c:if>
                                    </a>

                                </li>
                                <li class="active">
                                    <a href="javascript:orderByTime('desc')">最新
                                        <c:if test="${condition.dateupdown[0]=='desc'}">
                                            <b class="fa fa-caret-down" id="arrow"></b>
                                        </c:if>
                                    </a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        价格
                                        <c:if test="${condition.updown[0]=='desc'}">
                                            <b class="fa fa-caret-down" id="arrow"></b>
                                        </c:if>
                                        <c:if test="${condition.updown[0]=='asc'}">
                                            <b class="fa fa-caret-up" id="arrow"></b>
                                        </c:if>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li class="priceup"><a href="javascript:orderByPrice('asc')">价格从低到高<b class="fa fa-arrow-up"></b></a></li>
                                        <li class="pricedown"><a href="javascript:orderByPrice('desc')">价格从高到低<b class="fa fa-arrow-down"></b></a></li>
                                    </ul>
                                </li>
                                <li class="price_range" >
                                    <div>
                                        <span class="priceText">价格区间：</span>
                                        <input class="input_price" type="text" placeholder="￥" name="price1" value="${condition.pricefrom[0]}"/>
                                        <em>-</em>
                                    </div>
                                    <div>
                                        <input class="input_price" type="text" placeholder="￥" name="price2" value="${condition.priceto[0]}"/>
                                    </div>
                                    <div>
                                        <a href="javascript:priceRange()" class="btn btn-default priceCheckSure">确定</a>
                                    </div>
                                </li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>

            <div class="smkj_goods">
                <div class="row">
                    <div class="goodsDiv smkj_phoneDiv">

                        <!--<div class="splb_div">
                            <div class="col-md-2 column ">
                            <p class="splb">商品列表</p>
                            </div>
                            <div col-md-10>
                            <ul class="pager fyButton">
                                <li><a href="#"><b><</b></a></li>
                                <li><a href="#">下一页</a></li>
                            </ul>
                            </div>
                        </div>-->
                        <div class="smkj_rowDiv">
                            <c:forEach items="${pageInfo.list}" var="product">
                                <div class="col-md-3 column smkjp_img">
                                    <a href="${pageContext.request.contextPath}/user/product_info?pid=${product.pid}">
                                        <img alt="140x140" src="${pageContext.request.contextPath}/static/images/${product.pimage}" width="140" height="140"/>
                                        <p class="textover">${product.pdesc}</p>
                                        <div class="row">
                                            <p class="price col-xs-8"><i>￥</i><span class="money">${product.shopPrice}</span></p>
                                            <button class="btn btn-danger glyphicon glyphicon-shopping-cart shoppingCar col-xs-4"></button>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
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
</div>


<!--buttom版权-->
    <%@include file="bottom.jsp"%>
</body>
<script>
    function general(order) {
        $("input[name='general']").val(order);
        $("input[name='dateupdown']").val("");
        $("input[name='updown']").val("");
        $('.myform').submit();
    }
    function priceRange() {
        var price1=$('input[name="price1"]').val();
        var price2=$('input[name="price2"]').val();
        $("input[name='pricefrom']").val(price1);
        $("input[name='priceto']").val(price2);
        $('.myform').submit();
    }
    function orderByPrice(order) {
        $("input[name='updown']").val(order);
        $("input[name='dateupdown']").val("");
        $("input[name='general']").val("");
        $('.myform').submit();
    }
    function orderByTime(order) {
        $("input[name='dateupdown']").val(order);
        $("input[name='updown']").val("");
        $("input[name='general']").val("");
        $('.myform').submit();
    }
    function findPage(pageNum) {
        if(pageNum!=0){
            $(".currentPage").val(pageNum);
            $('.myform').submit();
        }
    }
    // $('.dropdown .priceup').on('click',function(){
    //     $('.dropdown-toggle b').addClass("fa-caret-up").removeClass("fa-caret-down");
    //
    // });
    // $('.dropdown .pricedown').on('click',function(){
    //     $('.dropdown-toggle b').addClass("fa-caret-down").removeClass("fa-caret-up");
    //
    // });
</script>
</html>

