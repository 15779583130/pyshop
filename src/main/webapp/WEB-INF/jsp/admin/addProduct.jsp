<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>莆院商城后台管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <script src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/static/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bs/js/holder.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/kd/kindeditor.js"></script>
</head>
<script>
    KindEditor.ready(function(K) {
        editor = K.create('#tid',{
            resizeType : 0,
            allowPreviewEmoticons : false,
            allowImageUpload : true,
            items : [
                'source', 'fontname', 'fontsize', 'forecolor','preview','fullscreen'
            ],
        });
    });
</script>
<script>
$(function () {
    $('#myli a:eq(2)').addClass("active");
    $.ajax({
        type:"get",
        url:"${pageContext.request.contextPath}/getChild?cparentId=0",
        async:true,
        success:function(data){
            var  data=JSON.parse(data);
            $.each(data,function (index,item) {
                var oP=$("<option>"+item.cname+"</option>");
                $(oP).val(item.cid);
                $('#firstcid').append(oP);
            })
        }
    });
    $('#firstcid').change(function(){
        $('#secondcid').html("<option>请选择二级品类</option>");
        $('#firsthidden').removeClass('hidden');
        var x=$(this).val();
        //var x=$('option').index($(this));
        $.ajax({
            url:"${pageContext.request.contextPath}/getChild?cparentId="+x,
            async:true,
            success:function(data){
                var  data=JSON.parse(data);
                $.each(data,function (index,item) {
                    var oP=$("<option>"+item.cname+"</option>");
                    $(oP).val(item.cid);
                    $('#secondcid').append(oP);
                })
            }
        });
    });
    $('#secondcid').change(function(){
        $('#cid').html("<option>请选择三级品类</option>");
        $('#secondhidden').removeClass('hidden');
        var x=$(this).val();
        //var x=$('option').index($(this));
        $.ajax({
            url:"${pageContext.request.contextPath}/getChild?cparentId="+x,
            async:true,
            success:function(data){
                var  data=JSON.parse(data);
                $.each(data,function (index,item) {
                    var oP=$("<option>"+item.cname+"</option>");
                    $(oP).val(item.cid);
                    $('#cid').append(oP);
                })
            }
        });
    });


})
function showImage() {
        var docObj = document.getElementById("doc");
        var imgObjPreview = document.getElementById("preview");
        if (docObj.files && docObj.files[0]) {
            //火狐下，直接设img属性
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '300px';
            imgObjPreview.style.height = '120px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        } else {
            //IE下，使用滤镜
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag");
            //必须设置初始大小
            localImagId.style.width = "250px";
            localImagId.style.height = "200px";
            //图片异常的捕捉，防止用户修改后缀来伪造图片
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters
                    .item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
        return true;
    }
</script>
<style>
    .ke-container{
        width: 800px !important;
    }
</style>
<body>
<ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/admin/index">系统菜单</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/product/list">商品管理</a></li>
    <li class="active">商品添加</li>
</ol>
<form action="${pageContext.request.contextPath}/admin/product/add" method="post" enctype="multipart/form-data" class="myform">
    <div class="form-horizontal" style="padding:0px 10px">
        <div class="form-group">
            <label for="pname" class="col-sm-1 control-label">商品名称</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="pname"  placeholder="请输入商品名称" required>
            </div>
            <label for="isHot" class="col-sm-1 control-label">是否热门</label>
            <div class="col-sm-4">
                <select name="isHot" class="form-control cate-select col-sm-5">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="price" class="col-sm-1 control-label">市场价格</label>
            <div class="col-sm-4">
                <div class="input-group">
                    <input type="number" class="form-control" placeholder="市场价格" name="marketPrice" value="">
                    <div class="input-group-addon">元</div>
                </div>
            </div>

            <label for="price" class="col-sm-1 control-label">商城价格</label>
            <div class="col-sm-4">
                <div class="input-group">
                    <input type="number" class="form-control" placeholder="商城价格" name="shopPrice" value="">
                    <div class="input-group-addon">元</div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="col-sm-1 control-label">所属分类</label>
            <div class="col-sm-3">
                <select name="firscid" id="firstcid" type="password" class="form-control cate-select col-sm-5" required>
                    <option>请选择一级品类</option>
                </select>
            </div>
            <div class="col-sm-3 hidden" id="firsthidden">
                <select name="secondcid" id="secondcid" type="password" class="form-control cate-select col-sm-5" required>

                </select>
            </div>
            <div class="col-sm-3 hidden" id="secondhidden">
                <select name="cid" id="cid" type="password" class="form-control cate-select col-sm-5" required>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="col-sm-1 control-label">商品图片</label>
            <div class="col-sm-5">
                <input type="file" name="myfiles" accept="image/gif,image/jpeg,image/jpg,image/png"
                       id="doc" onchange="showImage()">
            </div>
        </div>

        <div class="form-group" id="localImg">
            <label for="name" class="col-sm-1 control-label"></label>
            <div class="col-sm-5">
                <img id="preview" width=-1 height=-1 style="diplay:none" />
            </div>
        </div>

        <!-- <div class="form-group">
            <label for="inputEmail3" class="col-sm-1 control-label">商品图片</label>
            <div class="img-con col-sm-10">
                <input type="file" name="myfiles" accept="image/gif,image/jpeg,image/jpg,image/png"
                id="doc" onchange="showImage()">
                <div id="imgBox">

                </div>
            </div>


            <div class="form-group" id="localImag">
                <label for="name" class="col-sm-1 control-label"></label>
                <div class="col-sm-5">
                    <img id="preview" width=-1 height=-1 style="diplay:none" />
                </div>
            </div>

        </div> -->

        <div class="form-group">
            <label for="name" class="col-sm-1 control-label">商品描述</label>
            <div class="col-sm-10">
                <textarea class="form-control" rows="9" id="tid" cols="2" name="pdesc"></textarea>
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-1">
                <button type="submit" class="btn btn-xl btn-primary">确定</button>
            </div>
            <div class="col-sm-1">
                <button class="btn btn-default" onclick="history.back(-1)">返回</button>
            </div>
        </div>
    </div>
</form>
</body>

</html>
