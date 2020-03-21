<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/25
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/font-awesome.min.css">
    <script src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/static/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bs/js/holder.min.js"></script>
</head>
<script>

</script>
<style>

</style>

<body>
<%@include file="top.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2" id="myli">
            <%@include file="left.jsp"%>
        </div>
        <div class="col-sm-10">
            <jsp:include page="${mainPage==null?'welcome.jsp':mainPage}"></jsp:include>
        </div>
    </div>
</div>
<%@include file="bottom.jsp"%>
</body>

</html>



</div>