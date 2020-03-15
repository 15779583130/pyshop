<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/27
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

</style>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>首页</title>

    <LINK rel=stylesheet type=text/css href="${pageContext.request.contextPath}/static/user/styles/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/top.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/superMar.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/BGoods.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/buttom.css"/>
    <script src="${pageContext.request.contextPath}/static/user/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/holder.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/kxbdSuperMarquee.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>
    body{
        height:100%;
    }
    .myfooter{
        position: fixed;
        right: 0;
        left: 0;
        z-index: 1030;
        bottom: 0;
        margin-bottom: 0;
        border-width: 1px 0 0;
    }
</style>
<body >
<div>

    <!--top灰色区域-->
    <%@include file="top.jsp"%>
    <div class="container">
        <!--搜索一排-->
        <div class="row searchBox">
            <div class="col-md-3 column">
                <img  src="${pageContext.request.contextPath}/static/images/logo7.png" width="140" height="70"/>
            </div>
            <div class="col-md-3 column"></div>
            <div class="col-md-6 ">
                <div class="searchInput">
                    <form class="form-horizontal searchForm" action="${pageContext.request.contextPath}/user/search" role="search" style="padding: 0px;" method="post">
                        <input type="text" name="keywords" placeholder="莆院商城超级品牌日 爆品最高立减2000元" class="form-control searchWidth"/>
                        <button type="submit" class="btn btn-danger">搜索</button>
                    </form>
                </div>
            </div>

        </div>

        <div class="row">
            <!--侧边导航栏-->
            <div class="col-sm-2">

                <div class="hc_lnav ">
                    <div class="allbtn">
                        <h2><a href="#">全部商品分类:</a></h2>
                        <ul style="width:190px">
                            <c:forEach items="${firstCategories}" var="firstCategory">
                                <li>
                                    <div class=tx>
                                        <a href="${pageContext.request.contextPath}/user/product_list?cid=${firstCategory.cid}"><i>&nbsp;</i>${firstCategory.cname}</a>
                                    </div>
                                    <div class=pop>
                                        <c:forEach items="${secondCategories}" var="secondCategory">
                                            <c:if test="${secondCategory.cparentId eq firstCategory.cid}">
                                                <dl>
                                                    <dt id="second"><a href="${pageContext.request.contextPath}/user/product_list?cid=${secondCategory.cid}">${secondCategory.cname}<span class="glyphicon glyphicon-chevron-down"></span></a></dt>
                                                    <dd>
                                                        <c:forEach items="${thirdCategories}" var="thirdCategory">
                                                            <c:if test="${thirdCategory.cparentId eq secondCategory.cid}">
                                                                <a class="ui-link" href="${pageContext.request.contextPath}/user/product_list?cid=${thirdCategory.cid}">${thirdCategory.cname}</a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </dd>
                                                </dl>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="col-sm-10">
                <!--横向导航栏和轮播图-->
                <div class="row lbtAndNavH">
                    <!--横向导航-->

                    <!--轮播图10-->
                    <div class="col-md-10">
                        <div class="carousel slide lbtBootstrap" id="carousel-310789">
                            <ol class="carousel-indicators lbtdot">
                                <li class="active" data-slide-to="0" data-target="#carousel-310789">
                                </li>
                                <li data-slide-to="1" data-target="#carousel-310789">
                                </li>
                                <li data-slide-to="2" data-target="#carousel-310789">
                                </li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img alt="" src="${pageContext.request.contextPath}/static/user/images/lb1.jpg" />
                                </div>
                                <div class="item">
                                    <img alt="" src="${pageContext.request.contextPath}/static/user/images/lb2.jpg" />
                                </div>
                                <div class="item">
                                    <img alt="" src="${pageContext.request.contextPath}/static/user/images/lb3.jpg" />
                                </div>
                            </div>
                            <a class="left carousel-control left_right" href="#carousel-310789" data-slide="prev">
                                <span class="left_right"><img src="${pageContext.request.contextPath}/static/user/images/left1.png"/></span>
                            </a>
                            <a class="right carousel-control left_right" href="#carousel-310789" data-slide="next">
                                <span ><img src="${pageContext.request.contextPath}/static/user/images/right1.png"/></span>
                            </a>
                        </div>
                    </div>
                    <!--超级滚动-->
                    <div class="col-md-2">
                        <div id="marquee">
                            <div class="col-md-2">
                                <div id="control6">资讯</div>
                            </div>
                            <div id="marquee6">
                                <ul>
                                    <li><a href="#">小米 为发烧而生</a></li>
                                    <li><a href="#">华为 世界500强</a></li>
                                    <li><a href="#">索尼 留住美妙瞬间</a></li>
                                    <li><a href="#">理光 想象 改变</a></li>
                                    <li><a href="#">失去联想，将会怎样</a></li>
                                    <li><a href="#">神州 顶级享受</a></li>
                                    <li><a href="#">方寸世界，掌中无限</a></li>
                                    <li><a href="#">e切尽在掌控</a></li>
                                    <li><a href="#">平板 让生活平行世界</a></li>
                                    <li><a href="#">时尚网络，“平”添色彩</a></li>
                                    <li><a href="#">手随心动，触享畅通</a></li>
                                    <li><a href="#">玩世界于股掌之中</a></li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>




            <!--商品浏览-->
            <div>
                <div class="zxsp">
                    <div class="col-lg-12 h3border">
                        <h3>热门商品</h3>
                    </div>

                    <div class="row">
                        <c:forEach items="${hotProductList}" var="hotProduct">
                            <div class="col-md-2 splr">
                                <a href="${pageContext.request.contextPath}/user/product_info?pid=${hotProduct.pid}">
                                    <img alt="140x140" src="${pageContext.request.contextPath}/static/images/${hotProduct.pimage}" width="140" height="140"/>
                                    <p class="textover">${hotProduct.pdesc}</p>
                                    <div class="row">
                                        <p class="price col-xs-8"><i>￥</i><span class="money">${hotProduct.shopPrice}</span></p>
                                        <button class="btn btn-danger glyphicon glyphicon-shopping-cart shoppingCar col-xs-4"></button>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="zxsp">
                    <div class="col-lg-12 h3border">
                        <h3>最新商品</h3>
                    </div>

                    <div class="row">
                        <c:forEach items="${newProductList}" var="newProductList">
                            <div class="col-md-2 splr">
                                <a href="${pageContext.request.contextPath}/user/product_info?pid=${newProductList.pid}">
                                    <img alt="140x140" src="${pageContext.request.contextPath}/static/images/${newProductList.pimage}" width="140" height="140"/>
                                    <p class="textover">${newProductList.pdesc}</p>
                                    <div class="row">
                                        <p class="price col-xs-8"><i>￥</i><span class="money">${newProductList.shopPrice}</span></p>
                                        <button class="btn btn-danger glyphicon glyphicon-shopping-cart shoppingCar col-xs-4"></button>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--底部维权-->
    <%@include file="bottom.jsp"%>
    <script>
        $('#carousel-310789').carousel({
            interval: 2000
        })
    </script>
    <script type="text/javascript">
        $(function(){
            $('#marquee6').kxbdSuperMarquee({
                isMarquee:true,
                isEqual:false,
                scrollDelay:30,
                controlBtn:{up:'#goUM',down:'#goDM'},
                direction:'up'
            });
        });
    </script>
</body>
<script src="${pageContext.request.contextPath}/static/user/js/footer.js"></script>
</html>
