if (document.body.clientHeight < document.documentElement.clientHeight) {
    /*如果body没有填充完整个浏览器时，也就是页面没有出现滚动条时，修改footer为绝对定位，并距底端为0px*/
    // document.getElementById("footer").style.position = "absolute";  //把footer定义为绝对定位
    // document.getElementById("footer").style.bottom = "0px";  //把footer距页面底端设置为0px
    $('#footer').addClass('navbar-fixed-bottom');
} else {
    /*如果body的高度超过了浏览器可视域的高度，也就是页面出现了滚动条，只需按照原来的布局，设置footer为相对定位即可*/
    // document.getElementById("footer").style.position = "relative";
    $('#footer').removeClass('navbar-fixed-bottom');
}
