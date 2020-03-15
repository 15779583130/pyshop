<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/userSearch.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/common.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/userLeftNav.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userNavH.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/buttom.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap-datetimepicker.min.css" />
    <script src="${pageContext.request.contextPath}/static/user/scripts/jquery-1.11.0.min.js" type="text/javascript"></script>
    <%--<script src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="${pageContext.request.contextPath}/static/user/scripts/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/Calculation.js"></script>
    <!--数量加减-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/num-alignment.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/holder.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<style>
    /*购物车*/

    .col-md-4 {
        text-align: center;
        width: 240px;
    }

    .col-md-8 {
        margin-top: 2%;
    }

    .table {
        margin-top: 20px;
        text-align: center;
    }

    .table th {
        text-align: center;
    }

    div.submitDiv {
        text-align: right;
    }

    tr td{
        vertical-align:middle !important;
    }
</style>
<script>
    function updateCart(now,pid,uid) {
        var buyNum=$(now).val();
        if(buyNum!=0){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/updateCart?buyNum="+buyNum+"&pid="+pid+"&uid="+uid,
                data:'json',
                success:function (data) {
                    var a=$(now).parents('.mytr').find('.oldmoney');

                    var b=$(now).parents('.mytr').find('.submoney');

                    var tol=buyNum*a.text();
                    b.text(tol.toFixed(2));

                    mytotal();
                },
                error:function (data) {
                    alert("error:"+data);
                }
            })
        }else {
            window.location.href="${pageContext.request.contextPath}/user/CartItemDelete?uid="+uid+"&pid="+pid;
        }

    }
    function mytotal(){
        var total=$('.mytbody').find('.submoney');
        var sum=0;
        $.each(total,function(index,item){
            sum+=parseFloat(item.innerText);
        })
        $('.totalmoney').text(sum.toFixed(2));
    }
    // $(function () {
    //     $('.mynum').change(function () {
    //         var buyNum=$('.mynum').val();
    //         alert(buyNum);
    //     })
    // })
    <%--$(function () {--%>
        <%--$('.mynum').change(function () {--%>
            <%--var buyNum = $('.mynum').val();--%>
            <%--var pid = $(this).next('input').val();--%>
            <%--$.ajax({--%>
                <%--url: "${pageContext.request.contextPath}/user/addProductToCart?uid=${user.uid}&pid="+pid+"&buyNum=" + buyNum,--%>
                <%--success: function () {--%>
                    <%--window.location.reload();--%>
                <%--}--%>
            <%--})--%>
        <%--})--%>
    <%--})--%>
</script>
<body>

<!--顶部灰色区域-->
<%@include file="top.jsp"%>
<!--搜索一排-->
<div class="row searchBox">
    <div class="col-md-2 column" style="text-align: right;">
        <img  src="${pageContext.request.contextPath}/static/images/logo7.png" width="140" height="70"/>
    </div>
    <div class="col-md-5">
        <ul class="list-inline userNavH">
            <li>
                <a href="index.html">首页</a>
            </li>
            <li>
                我的购物车
            </li>
        </ul>
    </div>

</div>

<div class="container">
    <div class="row">

        <div class="row">
            <div class="col-md-12">
                <div class="content">
                    <div class="row clearfix">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <table class="table table-bordered ">
                                <thead>
                                <tr>
                                    <th>图片</th>
                                    <th>商品</th>
                                    <th>单价</th>
                                    <th>数量</th>
                                    <th>总计</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody class="mytbody">
                                <c:forEach items="${cart.cartItems}" var="entry" varStatus="vs">
                                    <tr class="mytr">
                                        <td>
                                            <img src="${pageContext.request.contextPath}/static/images/${entry.value.product.pimage}" width="80px" height="100px" />
                                        </td>
                                        <td width="270px">${entry.value.product.pname}</td>
                                        <td>
                                            <p class="price col-xs-8"><i>￥</i><span class="money oldmoney">${entry.value.product.shopPrice}</span></p>
                                        </td>
                                        <td>
                                            <div class="horizontal" style="margin-left:30px;">
                                                <input id="${vs.count}" class="buyNum" name="buyNum" data-step="1" data-min="0" data-max="50" data-digit="0" value="${entry.value.buynum}" style="width:150px;" onchange="updateCart(this,${entry.value.product.pid},${user.uid})"/>
                                            </div>
                                            <%--<input type="number" value="${entry.value.buynum}" class="mynum" onchange="updateCart($(this).val(),${entry.value.product.pid},${user.uid})">--%>
                                        </td>

                                        <td>
                                            <p class="price col-xs-8"><i>￥</i><span class="money submoney">${entry.value.subtotal}</span></p>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/user/CartItemDelete?uid=${user.uid}&pid=${entry.value.product.pid}" class="btn btn-warning btn-sm">移除购物车</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                            <div class="submitDiv">
                                <div class="clearCar pull-left" >
                                    <a href="${pageContext.request.contextPath}/user/CartItemDeleteAll?uid=${user.uid}" style="color: #D43F3A;">清空购物车</a>
                                </div>

                                <div class="moeny">
                                    <span>商品金额:</span>
                                    <i>￥</i><span class="money totalmoney">${cart.total}</span>
                                </div>
                                <br />
                                <div class="submit">

                                    <a href="${pageContext.request.contextPath}/user/index"class="btn btn-primary btn-sm">继续购物</a>
                                    <a href="${pageContext.request.contextPath}/user/order_info?uid=${user.uid}" class="btn btn-danger btn-sm">提交订单</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>

    </div>
</div>
<!--底部维权-->
<%@include file="bottom.jsp"%>
<%--<div class="row buttom navbar-fixed-bottom" id="footer">--%>
    <%--<div class="col-md-12 ">--%>
        <%--<p class="copyRight">Copyright © 2019 PTXY. All rights reserved. </p>--%>
        <%--<p>互联网违法和不良信息举报电话：12321 <a href="${pageContext.request.contextPath}/admin/login" style="margin-left:5px;color:#fff">管理员登录</a></p>--%>
    <%--</div>--%>
<%--</div>--%>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/magnifier.js" ></script>
<script type="text/javascript">
    // 自定义类型：参数为数组，可多条数据
    alignmentFns.createType([{"test": {"step" : 1, "min" : 0, "max" : 999, "digit" : 0}}]);

    // 初始化
    // alignmentFns.initialize();

    // 销毁
    // alignmentFns.destroy();

    // js动态改变数据
    // $("#4").attr("data-max", "12")
    // 初始化
    alignmentFns.initialize();

</script>
<script src="${pageContext.request.contextPath}/static/user/js/footer.js"></script>
</html>