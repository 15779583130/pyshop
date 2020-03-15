<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>人事资源管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <script src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/static/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bs/js/holder.min.js"></script>
</head>
<script>
    $(function () {

    })
</script>
<body>
<div class="panel panel-default" style="margin:15px">
    <div class="panel-heading">
        <%--<h3 class="strong">订单编号:${mapList[0].oid}</h3>--%>
        <strong>订单编号:${mapList[0].oid}</strong>
    </div>

    <table class="table table-bordered table-striped table-hover">
        <thead>
            <tr>
                <th>图片</th>
                <th>商品名称</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${mapList}" var="map">
                <tr>
                    <td><img src="${pageContext.request.contextPath}/static/images/${map.pimage}" alt="" width="50" height="50"></td>
                    <td>${map.pname}</td>
                    <td>${map.shop_price}</td>
                    <td>${map.count}</td>
                    <td>${map.subtotal}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>