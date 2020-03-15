<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/22
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>测试</title
    <LINK rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/static/user/styles/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/topOther.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/BGoods.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/buttom.css"/>
    <link href="${pageContext.request.contextPath}/static/user/styles/buy.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/user/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/holder.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/Calculation.js"></script>

    <!--放大镜-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/magnifier.css"/>
    <!--数量加减-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/num-alignment.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script>


</head>
<style>
    div.spInfoText{
        background: #F7F7F7;
        padding: 10px;
        margin-top: 10px;
    }
    .text{
        margin: 8% 2% 2% 6%;
    }

    .top{
        position: fixed;
        right: 3%;
        bottom: 10%;
        width: 35px;
        height: 55px;
        border: solid 1px gray;

    }
    .top p{
        text-align: center;
    }
    .top p a{
        color: #666;
    }

</style>

<body>
<div>
    <!--顶部灰色区域-->
    <%@include file="top.jsp"%>
    <div class="container">
        <!--搜索一排-->
        <div class="row searchBox">
            <div class="col-md-3 column">
                <img  src="${pageContext.request.contextPath}/static/images/logo7.png" width="140" height="70"/>
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-6 ">
                <div class="searchInput">
                    <form class="searchForm" role="search" style="padding: 0px;">
                        <input type="text" class="form-control searchWidth" />
                        <a href="" class="btn btn-danger">搜索</a>
                    </form>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
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



            <div class="col-md-12">
                <div class="content row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <div class="magnifier" id="magnifier1">
                            <div class="magnifier-container">
                                <div class="images-cover"></div>
                                <!--当前图片显示容器-->
                                <div class="move-view"></div>
                                <!--跟随鼠标移动的盒子-->
                            </div>
                            <div class="magnifier-assembly">
                                <div class="magnifier-btn">
                                    <span class="magnifier-btn-left">&lt;</span>
                                    <span class="magnifier-btn-right">&gt;</span>
                                </div>
                                <!--按钮组-->
                                <div class="magnifier-line">
                                    <ul class="clearfix animation03">
                                        <li>
                                            <div class="small-img">
                                                <img src="${pageContext.request.contextPath}/static/images/${product.pimage}" />
                                            </div>
                                        </li>
                                        <li>
                                            <div class="small-img">
                                                <img src="${pageContext.request.contextPath}/static/images/${product.pimage}" />
                                            </div>
                                        </li>
                                        <li>
                                            <div class="small-img">
                                                <img src="${pageContext.request.contextPath}/static/images/${product.pimage}" />
                                            </div>
                                        </li>
                                        <li>
                                            <div class="small-img">
                                                <img src="${pageContext.request.contextPath}/static/images/${product.pimage}" />
                                            </div>
                                        </li>
                                        <li>
                                            <div class="small-img">
                                                <img src="${pageContext.request.contextPath}/static/images/${product.pimage}" />
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <!--缩略图-->
                            </div>
                            <div class="magnifier-view"></div>
                            <!--经过放大的图片显示容器-->
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="spInfoText">
                            <div class="spmc">
                                <h2>${product.pname}</h2>
                                <p style="font-size: 16px;">${product.pdesc}</p>
                            </div>
                            <h4>市场价：<span>${product.marketPrice}</span></h4>
                            <h4>商城价:<span>${product.shopPrice}</span></h4>
                            <div class="horizontal">
                                <span>数量:</span>
                                <input id="5" class="buyNum" name="buyNum" data-step="1" data-min="1" data-max="50" data-digit="0" value="1" style="width:150px;" />
                            </div>
                            <br/>
                            <c:if test="${favour==null}">
                                <a class="btn btn-warning myadd" href="javascript:addToFavourite()"><span class="glyphicon glyphicon-heart-empty" style="margin-right:15px"></span>加入收藏</a>
                            </c:if>
                            <c:if test="${favour!=null}">
                                <a class="btn btn-warning mycancel" href="javascript:cancelFavourite()"><span class="glyphicon glyphicon-heart" style="color:#d43f3a;margin-right:15px"></span>取消收藏</a>
                            </c:if>
                            <a class="btn btn-warning hidden add" href="javascript:addToFavourite()"><span class="glyphicon glyphicon-heart-empty" style="margin-right:15px"></span>加入收藏</a>
                            <a class="btn btn-warning hidden cancel" href="javascript:cancelFavourite()"><span class="glyphicon glyphicon-heart" style="color:#d43f3a;margin-right:15px"></span>取消收藏</a>
                            <a class="btn btn-info glyphicon glyphicon-shopping-cart" href="javascript:addToCart()">&nbsp;加入购物车</a>
                            <a class="btn btn-danger glyphicon glyphicon-usd" href="javascript:buyNow()">&nbsp;立即购买</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2">

            </div>
        </div>
        <!--商品浏览-->
        <div>
            <div class="zxsp">
                <div class="col-lg-12 h3border">
                    <h3>最近浏览</h3>
                </div>

                <div class="row">
                    <c:forEach items="${historyList}" var="history">
                        <div class="col-md-2 splr">
                            <a href="${pageContext.request.contextPath}/user/product_info?pid=${history.pid}">
                                <img alt="140x140" src="${pageContext.request.contextPath}/static/images/${history.pimage}" width="100" height="100"/>
                                <p class="textover">${history.pname}</p>
                                <div class="row">
                                    <p class="price col-xs-8"><i>￥</i><span class="money">${history.shopPrice}</span></p>
                                    <button class="btn btn-danger glyphicon glyphicon-shopping-cart shoppingCar col-xs-4"></button>
                                </div>
                            </a>
                        </div>
                    </c:forEach>

                </div>
            </div>

        </div>
    </div>
    <div class="top">
        <p id="back-to-top">
            <a href="#top">
                <span class="glyphicon glyphicon-chevron-up"></span><br />
                返回顶部
            </a>
        </p>
    </div>

    <%@include file="bottom.jsp"%>



</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/magnifier.js" ></script>
<script type="text/javascript">
    function buyNow() {
        $.ajax({
            url: "${pageContext.request.contextPath}/user/isLogin",
            dataType: 'json',
            async: false,
            success: function (data) {
                if (data.status == "0") {
                    layer.alert("对不起,请先登陆",function () {
                        window.location.href="${pageContext.request.contextPath}/user/login";
                    });
                } else {
                    var buyNum = $('.buyNum').val();
                    window.location.href="${pageContext.request.contextPath}/user/buyNow?uid=${user.uid}&pid=${product.pid}&buyNum=" + buyNum;
                    <%--$.ajax({--%>
                        <%--url: "${pageContext.request.contextPath}/user/buyNow?uid=${user.uid}&pid=${product.pid}&buyNum=" + buyNum,--%>
                        <%--async: true,--%>
                        <%--dataType: 'json',--%>
                        <%--success: function (data) {--%>
                            <%--layer.alert(data.msg);--%>
                        <%--}--%>
                    <%--})--%>
                }
            }
        })
    }
    function cancelFavourite() {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/cancelFavourite?uid=${user.uid}&pid=${product.pid}",
            dataType:'json',
            success:function (data) {
                $('.mycancel').addClass('hidden');
                $('.cancel').addClass('hidden');
                $('.add').removeClass('hidden');
            }
        })
    }
    function addToFavourite(){
        $.ajax({
            url: "${pageContext.request.contextPath}/user/isLogin",
            dataType: 'json',
            async: false,
            success: function (data) {
                if (data.status == "0") {
                    layer.alert("对不起,请先登陆",function () {
                        window.location.href="${pageContext.request.contextPath}/user/login";
                    });
                } else {
                    var buyNum = $('.buyNum').val();
                    $.ajax({
                        url: "${pageContext.request.contextPath}/user/addProductToFavourite?uid=${user.uid}&pid=${product.pid}",
                        async: true,
                        dataType: 'json',
                        success: function (data) {
                            $('.myadd').addClass('hidden');
                            $('.add').addClass('hidden');
                            $('.cancel').removeClass('hidden');
                        }
                    })
                }
            }
        })
    }
    function addToCart() {
        $.ajax({
            url: "${pageContext.request.contextPath}/user/isLogin",
            dataType: 'json',
            async: false,
            success: function (data) {
                if (data.status == "0") {
                    <%--var index = layer.open({--%>
                        <%--title: false,--%>
                        <%--type: 2,--%>
                        <%--content: "${pageContext.request.contextPath}/user/login",--%>
                        <%--closeBtn: false,--%>
                        <%--shadeClose: true,--%>
                        <%--area: ['450px', '550px'],--%>
                    <%--})--%>
                    layer.alert("对不起,请先登陆",function () {
                        window.location.href="${pageContext.request.contextPath}/user/login";
                    });
                } else {
                    var buyNum = $('.buyNum').val();
                    $.ajax({
                        url: "${pageContext.request.contextPath}/user/addProductToCart?uid=${user.uid}&pid=${product.pid}&buyNum=" + buyNum,
                        async: false,
                        dataType: 'json',
                        success: function (data) {
                            layer.alert(data.msg);
                        }
                    })
                }
            }
        })

    }

    // 自定义类型：参数为数组，可多条数据
    alignmentFns.createType([{"test": {"step" : 1, "min" : 1, "max" : 999, "digit" : 0}}]);

    // 初始化
    alignmentFns.initialize();

    // 销毁
    alignmentFns.destroy();

    // js动态改变数据
    $("#4").attr("data-max", "12")
    // 初始化
    alignmentFns.initialize();

    $(function() {

        var magnifierConfig = {
            magnifier : "#magnifier1",//最外层的大容器
            width : 300,//承载容器宽
            height : 300,//承载容器高
            moveWidth : null,//如果设置了移动盒子的宽度，则不计算缩放比例
            zoom : 2//缩放比例
        };

        var _magnifier = magnifier(magnifierConfig);

        /*magnifier的内置函数调用*/
        /*
            //设置magnifier函数的index属性
            _magnifier.setIndex(1);

            //重新载入主图,根据magnifier函数的index属性
            _magnifier.eqImg();
        */
    });
</script>
</html>
