<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/14
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>


</head>
<script>
    $(function () {
        $("#test").click(function () {
            var index=layer.open({
                title:false,
                type:2,
                content:'addEmployee.jsp',
                closeBtn:false,
                shadeClose:true,
                area:['500px','600px'],
                success: function(layero, index){

                }




            })
        })
    })
</script>
<body>
<button class="btn btn-success" id="test">
    Launch demo modal
</button>
<div class="modal fade" id="myModal">
    <div class="row">
        <form action="">
            <input type="text">
        </form>
    </div>
</div>
</body>
</html>


