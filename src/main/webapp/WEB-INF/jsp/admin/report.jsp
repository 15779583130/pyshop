<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/26
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <script src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/echarts.min.js"></script>

</head>
<style>
    div.charts{
        /*width:500px;*/
        height:350px;
        /*margin:10px;*/
    }
</style>
<script>
    $(function () {
        var t=$("input[name='e_name']").val();
        $("input[name='e_name']").val("").focus().val(t);
        $('#myli a:eq(5)').addClass("active");
    })
</script>
<body>
<ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/admin/index">系统菜单</a></li>
    <li class="active">统计报表</li>
</ol>
<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <%--订单数量--%>
            <div class="col-md-12">
                <div id="order" style="height: 400px;" ></div>
            </div>
            <%--当月销售额--%>
            <div class="col-md-12">
                <div id="money" class="charts" ></div>
            </div>
            <%--热门产品分类--%>
            <div class="col-md-12">
                <div id="popular" class="charts"></div>
            </div>

            <%--年龄分布--%>
            <div class="col-md-6">
                <div id="age" class="charts"></div>
            </div>

            <%--数量统计--%>
            <div class="col-md-6">
                <div id="main" class="charts"></div>
            </div>


        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    var mydata=[];
    var mydata2;
    $.ajax({
        url:"${pageContext.request.contextPath}/getReport1",
        dataType:'json',
        async:false,
        success:function (data) {
            console.log(data);
            $.each(data,function (index, item) {
                mydata.push(item.name);
            })
            mydata2=data;

        }
    })
    //mydata=['数码科技', '影音家电','鞋服配饰','运动代步','书籍工具','其他'];
    // mydata2=[
    //     {value:1, name: '数码科技'},
    //     {value:2, name: '影音家电'},
    //     {value:3, name: '鞋服配饰'},
    //     {value:4, name: '运动代步'},
    //     {value:5, name: '书籍工具'},
    //     {value:6, name: '其他'}
    // ];
    var myChart = echarts.init(document.getElementById('main'));
    option = {
        title: {
            text: '2019商品数量统计',
            left: 'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            bottom: 0,
            left: 'center',
            data:mydata
        },
        series : [
            {
                type: 'pie',
                radius : '65%',
                center: ['50%', '50%'],
                selectedMode: 'single',
                data:mydata2,
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    myChart.setOption(option);

</script>
<%--年龄分布--%>
<script>
    var myChart = echarts.init(document.getElementById('age'));
    var agedate=[];
    var agedate2=[];
    $.ajax({
        url:'${pageContext.request.contextPath}/getAge',
        dataType:'json',
        async:false,
        success:function (data) {
            agedate2=data;
            //item=data[i]
            $.each(data,function (i,item) {
                agedate.push(item.name);
//                agedate2.push(item.value);
            })
        }
    })
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data:agedate
        },
        title: [{
//            top: '5%',
            left: 'center',
            text: '用户年龄分布',
        }],
        series: [
            {
                name:'用户年龄分布',
                type:'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data:agedate2
            }
        ]
    };
    myChart.setOption(option);
</script>
<%--订单数量--%>
<script>
    var myChart = echarts.init(document.getElementById('order'));
    var myorder=[];
    var myorder2 =[];
    $.ajax({
        url:'${pageContext.request.contextPath}/getOrderNum',
        dataType:'json',
        async:false,
        success:function (data) {
            console.log(data);
            //item=data[i]
            //mydata2=data;
            $.each(data,function (i,item) {
                myorder.push(item.name);
                myorder2 .push(item.value)
            })
        }
    })

    option = {
        title: [{
//            top: '5%',
            left: 'left',
            text: '每日订单数量',
        }],
        xAxis: {
            type: 'category',
            data: myorder,
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data:myorder2 ,
            type: 'line'
        }]
    };

    myChart.setOption(option);
</script>
<%--当月销售额--%>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('money'));
    var money=[];
    var money2 = [];
    $.ajax({
        url:'${pageContext.request.contextPath}/getReport3',
        dataType:'json',
        async:false,
        success:function (data) {
            console.log(data);
            $.each(data,function (i,item) {
                money.push(item.day);
                money2.push(item.money);
            })
        }
    })


    option = {
        title: {
            text: '当月销售额'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['销售额']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: money
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'销售额',
                type:'line',
                step: 'start',
                data:money2,
            }
        ]
    };
    myChart.setOption(option);
</script>
<%--热门产品数量--%>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('popular'));
    var popular=[];
    var popular2;
    $.ajax({
        url:'${pageContext.request.contextPath}/getReport2',
        dataType:'json',
        async:false,
        success:function (data) {
            console.log(data)
            popular2=data;
            //item=data[i]
            $.each(data,function (i,item) {
                popular.push(item.name);
            })
        }
    })
    //    var mydata = ['数码科技', '影音家电','鞋服配饰','运动代步','书籍工具','其他'];
    //    var mydata2 = [2.0, 4.9, 7.0, 23.2, 25.6, 76.7];
    option = {
        title : {
            text: '热门产品的分类',
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['产品数量']
        },
        toolbox: {
            show : true,
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                data : popular
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'产品数量',
                type:'bar',
                data:popular2,
            }
        ]
    };
    myChart.setOption(option);
</script>
</html>
