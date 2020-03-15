<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/24
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>提交订单</title>

    <LINK rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/static/user/styles/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/topOther.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userNavH.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userSearch.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/common.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/BGoods.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/buttom.css"/>
    <script src="${pageContext.request.contextPath}/static/user/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link href="${pageContext.request.contextPath}/static/user/styles/buy.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/Calculation.js"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/holder.min.js" type="text/javascript" charset="utf-8"></script>
    <!--数量加减-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/num-alignment.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/distpicker.data.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/distpicker.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/main.js" ></script>
</head>
<style>
    .table{
        margin-top: 10px;
        text-align: center;
    }
    .table th{
        text-align: center;
    }
    div.submitDiv{
        text-align: right;
    }
    tr td{
        vertical-align:middle !important;
    }
</style>

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
                    提交订单
                </li>
            </ul>
        </div>
    </div>
    <div class="container">
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
                                <th>价格</th>
                                <th>数量</th>
                                <th>小计</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${order.orderItems}" var="orderItem">
                                <tr>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/static/images/${orderItem.product.pimage}" width="80px" height="100px"/>
                                    </td>
                                    <td width="270px">${orderItem.product.pname}</td>
                                    <td>
                                        <i>￥</i><span class="money">${orderItem.product.shopPrice}</span>
                                        <%--<p class="price col-xs-8"><i>￥</i><span class="money">${orderItem.product.shopPrice}</span></p>--%>
                                    </td>
                                    <td>${orderItem.count}</td>
                                    <td>
                                        <i>￥</i><span class="money">${orderItem.subtotal}</span>
                                    </td>
                                    <%--<td>--%>
                                        <%--<button type="button" class="btn btn-info btn-sm" onclick="deleteOrderItem('${orderItem.itemid}')">删除</button>--%>
                                    <%--</td>--%>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div>
                            <div class="docs-methods">
                                <form class="form-inline myform" method="post" action="${pageContext.request.contextPath}/user/confirmOrder?oid=${order.oid}">
                                    <div id="distpicker">
                                        <div class="form-group">
                                            <label class="sr-only" for="province">省</label>
                                            <select class="form-control" id="province"></select>
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="city">市</label>
                                            <select class="form-control" id="city"></select>
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="district">区</label>
                                            <select class="form-control" id="district"></select>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-primary" id="reset" type="button">获取当前</button>
                                            <button class="btn btn-warning" id="reset-deep" type="button">重置 </button>
                                        </div><br />
                                        <div class="form-group">
                                            <input type="text" name="place" id="place" placeholder="详细地址" required class="form-control"style="margin-top: 10px;width: 420px ;display: block;""/>
                                            <input type="hidden" name="address"/>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <input type="text" placeholder="收货人" name="name" required class="form-control"style="margin-top: 10px;width: 145px ;"/>
                                        </div>

                                        <div class="form-group">
                                            <input type="text" placeholder="电话" name="telephone" required class="form-control"style="margin-top: 10px;width: 145px ;"/>
                                        </div>

                                    </div>
                                    <div class="submitDiv">
                                        <div class="moeny">
                                            <span>商品金额:</span>
                                            <i>￥</i><span class="money">${order.total}</span>
                                        </div>
                                        <br />
                                        <div>
                                            <a href="javascript:pay()" class="btn btn-danger btn-sm">结算</a>
                                            <input type="submit"  class="hidden" value="提交订单" id="mysub">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
        </div>
        <div class="col-sm-1"></div>

    </div>
</div>

<!--底部维权-->
<!--底部维权-->
<%@include file="bottom.jsp"%>
</div>
</body>

<script type="text/javascript">

    // 自定义类型：参数为数组，可多条数据
    alignmentFns.createType([{"test": {"step" : 1, "min" : 1, "max" : 999, "digit" : 0}}]);

    // 初始化
    alignmentFns.initialize();

    // 销毁
    alignmentFns.destroy();

    // 初始化
    alignmentFns.initialize();

    function pay() {
        var str=[];
        var province=$('#province').val();
        var city=$('#city').val();
        var district=$('#district').val();
        var place=$('#place').val();
        str.push(province);
        str.push(city);
        str.push(district);
        str.push(place);
        var address=str.join("");
        $('input[name="address"]').val(address);
        //$(".myform").submit();
        $("#mysub").click();

    }
</script>
<script>
    function deleteOrderItem(itemid) {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/deleteOrderItem?itemid="+itemid,
            dataType:'json',
            success:function (data) {
                alert(data);
                // window.location.reload();
            }
        })
    }
</script>
<script src="${pageContext.request.contextPath}/static/user/js/footer.js"></script>
</html>

