(function($, window, document, undefined) {
	//定义分页类
	function Paging(element, options) {
		this.element = element;
		//传入形参
		this.options = {
			pageNo: options.pageNo||1,
			totalPage: options.totalPage,
			totalSize:options.totalSize,
			callback:options.callback
		};
		//根据形参初始化分页html和css代码
		this.init();
	}
	//对Paging的实例对象添加公共的属性和方法
	Paging.prototype = {
		constructor: Paging,
		init: function() {
			this.creatHtml();
			this.bindEvent();
		},
		creatHtml: function() {
			var me = this;
			var content = "";
			var current = me.options.pageNo;
			var total = me.options.totalPage;
			var totalNum = me.options.totalSize;
            content += "<ul class=\"pagination\">";
			content += "<li><a id=\"firstPage\">首页</a><a id='prePage'>上一页</a></li>";
			//总页数大于6时候
			if(total > 6) {
				//当前页数小于5时显示省略号
				if(current < 5) {
					for(var i = 1; i < 6; i++) {
						if(current == i) {
							content += "<li class='active'><a class='current'>" + i + "</a></li>";
						} else {
							content += "<li><a>" + i + "</a></li>";
						}
					}
                    content += "<li><a href='javascript:void();'>. . .</a></li>";
					content += "<li><a>"+total+"</a></li>";
				} else {
					 //判断页码在末尾的时候
					if(current < total - 3) {
						for(var i = current - 2; i < current + 3; i++) {
							if(current == i) {
								content += "<li class='active'><a class='current'>" + i + "</a></li>";
							} else {
								content += "<li><a>" + i + "</a></li>";
							}
						}
                        content += "<li><a>. . .</a></li>";
						content += "<li><a>"+total+"</a></li>";
					//页码在中间部分时候	
					} else {
						content += "<li><a>1</a></li>";
						content += "<li><a>. . .</a></li>";
						for(var i = total - 4; i < total + 1; i++) {
							if(current == i) {
								content += "<li class='active'><a class='current'>" + i + "</a></li>";
							} else {
								content += "<li><a>" + i + "</a></li>";
							}
						}
					}
				}
				//页面总数小于6的时候
			} else {
				for(var i = 1; i < total + 1; i++) {
					if(current == i) {
						content += "<li class='active'><a class='current'>" + i + "</a></li>";
					} else {
						content += "<li><a>" + i + "</a></li>";
					}
				}
			}
			content += "<li><a id='nextPage'>下一页</a></li>";
			content += "<li><a id=\"lastPage\">尾页</a></li></ul>";
			me.element.html(content);
		},
		//添加页面操作事件
		bindEvent: function() {
			var me = this;
			me.element.off('click', 'a');
			me.element.on('click', 'a', function() {
				var num = $(this).html();
				var id=$(this).attr("id");
				if(id == "prePage") {
					if(me.options.pageNo == 1) {
						me.options.pageNo = 1;
					} else {
						me.options.pageNo = +me.options.pageNo - 1;
					}
				} else if(id == "nextPage") {
					if(me.options.pageNo == me.options.totalPage) {
						me.options.pageNo = me.options.totalPage
					} else {
						me.options.pageNo = +me.options.pageNo + 1;
					}

				} else if(id =="firstPage") {
					me.options.pageNo = 1;
				} else if(id =="lastPage") {
					me.options.pageNo = me.options.totalPage;
				}else{
					me.options.pageNo = +num;
				}
				me.creatHtml();
				if(me.options.callback) {
					me.options.callback(me.options.pageNo);
				}
			});
		}
	};
	//通过jQuery对象初始化分页对象
	$.fn.paging = function(options) {
		return new Paging($(this), options);
	}
})(jQuery, window, document);