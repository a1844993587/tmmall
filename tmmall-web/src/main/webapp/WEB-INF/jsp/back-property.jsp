<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html lang="UTF-8">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="${APP_PATH}/study/backstatic/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/study/backstatic/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH}/study/backstatic/css/main.css">
	<link rel="stylesheet" href="${APP_PATH}/study/backstatic/css/pageStyle.css">
	<style>
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
	</style>
  </head>

  <body>
	<!-- 新增属性模态框 -->
  <div id="attribute_add" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="gridSystemModalLabel">新增属性</h4>
	      </div>
	      <div class="modal-body">
	      	<form id="formproperty">
			  <div class="form-group">
			    <label for="exampleInputAttribute">属性名称</label>
			    <input name="name" type="attribute" class="form-control" id="exampleInputAttribute" placeholder="属性名称">
				<input name="cid" type="hidden" value="${cid}">
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button id="submitform" type="button" class="btn btn-primary">提交</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 编辑属性模态框 -->
  <div id="attribute_edit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="gridSystemModalLabel">编辑属性</h4>
	      </div>
	      <div class="modal-body">
	      	<form id="formproperty2">
			  <div class="form-group">
			    <label for="exampleInputAttribute">属性名称</label>
			    <input name="name" id="properyname" type="attribute" class="form-control" id="exampleInputAttribute" placeholder="属性名称">
				<input name="id" type="hidden" id="propertyid">
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button id="submitform2" type="button" class="btn btn-primary">提交</button>
	      </div>
	    </div>
	  </div>
	</div>


	<jsp:include page="back-head.jsp"/>
	<div class="container-fluid">
      <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i>属性管理</h3>
			  </div>
			  <div class="panel-body">
		<form class="form-inline" role="form" style="float:left;">
		  <div class="form-group has-feedback">
		    <div class="input-group">
		      <div class="input-group-addon">查询条件</div>
		      <input class="form-control has-success" type="text" placeholder="请输入查询条件">
		    </div>
		  </div>
		  <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
		</form>
		<button type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
		<button type="button" class="btn btn-primary" style="float:right;" data-toggle="modal" data-target="#attribute_add"><i class="glyphicon glyphicon-plus"></i> 新增</button>
		<br>
		 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th>ID</th>
                  <th>属性名称</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
				<c:forEach items="${rest.rows}" var="list" varStatus="status">
					<tr>
						<td>${list.id}</td>
						<td>${list.name}</td>
						<td>
							<button type="button" onclick="getname(${list.id})" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#attribute_edit"><i class=" glyphicon glyphicon-pencil"></i></button>
							<button type="button" onclick='deleteproperty("${list.id}","${list.name}")' class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>
						</td>
					</tr>
				</c:forEach>
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="4" align="center">
						 <div id="page" class="page_div"></div>
					 </td>
				 </tr>
			  </tfoot>
            </table>
          </div>
			  </div>
			</div>
        </div>
      </div>
    </div>
    <script src="${APP_PATH}/study/backstatic/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/study/backstatic/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/study/backstatic/script/docs.min.js"></script>
	<script>
        (function ($, window, document, undefined) {
            //定义分页类
            function Paging(element, options) {
                this.element = element;
                //传入形参
                this.options = {
                    pageNo: options.pageNo || 1,
                    totalPage: options.totalPage,
                    totalSize: options.totalSize,
                    callback: options.callback
                };
                //根据形参初始化分页html和css代码
                this.init();
            }

            //对Paging的实例对象添加公共的属性和方法
            Paging.prototype = {
                constructor: Paging,
                init: function () {
                    this.creatHtml();
                    this.bindEvent();
                },
                creatHtml: function () {
                    var me = this;
                    var content = "";
                    var current = me.options.pageNo;
                    var total = me.options.totalPage;
                    var totalNum = me.options.totalSize;
                    content += "<a id=\"firstPage\">首页</a><a id='prePage'>上一页</a>";
                    //总页数大于6时候
                    if (total > 6) {
                        //当前页数小于5时显示省略号
                        if (current < 5) {
                            for (var i = 1; i < 6; i++) {
                                if (current == i) {
                                    content += "<a class='current'>" + i + "</a>";
                                } else {
                                    content += "<a>" + i + "</a>";
                                }
                            }
                            content += ". . .";
                            content += "<a>" + total + "</a>";
                        } else {
                            //判断页码在末尾的时候
                            if (current < total - 3) {
                                for (var i = current - 2; i < current + 3; i++) {
                                    if (current == i) {
                                        content += "<a class='current'>" + i + "</a>";
                                    } else {
                                        content += "<a>" + i + "</a>";
                                    }
                                }
                                content += ". . .";
                                content += "<a>" + total + "</a>";
                                //页码在中间部分时候
                            } else {
                                content += "<a>1</a>";
                                content += ". . .";
                                for (var i = total - 4; i < total + 1; i++) {
                                    if (current == i) {
                                        content += "<a class='current'>" + i + "</a>";
                                    } else {
                                        content += "<a>" + i + "</a>";
                                    }
                                }
                            }
                        }
                        //页面总数小于6的时候
                    } else {
                        for (var i = 1; i < total + 1; i++) {
                            if (current == i) {
                                content += "<a class='current'>" + i + "</a>";
                            } else {
                                content += "<a>" + i + "</a>";
                            }
                        }
                    }
                    content += "<a id='nextPage'>下一页</a>";
                    content += "<a id=\"lastPage\">尾页</a>";
                    content += "<span class='totalPages'> 共<span>" + total + "</span>页 </span>";
                    content += "<span class='totalSize'> 共<span>" + totalNum + "</span>条记录 </span>";
                    me.element.html(content);
                },
                //添加页面操作事件
                bindEvent: function () {
                    var me = this;
                    me.element.off('click', 'a');
                    me.element.on('click', 'a', function () {
                        var num = $(this).html();
                        var id = $(this).attr("id");
                        if (id === "prePage") {
                            if (me.options.pageNo === 1) {
                                me.options.pageNo = 1;
                            } else {
                                me.options.pageNo = +me.options.pageNo - 1;
                            }
                        } else if (id === "nextPage") {
                            if (me.options.pageNo === me.options.totalPage) {
                                me.options.pageNo = me.options.totalPage
                            } else {
                                me.options.pageNo = +me.options.pageNo + 1;
                            }

                        } else if (id === "firstPage") {
                            me.options.pageNo = 1;
                        } else if (id === "lastPage") {
                            me.options.pageNo = me.options.totalPage;
                        } else {
                            me.options.pageNo = +num;
                        }
                        me.creatHtml();
                        if (me.options.callback) {
                            me.options.callback(me.options.pageNo);
                        }
                    });
                }
            };
            //通过jQuery对象初始化分页对象
            $.fn.paging = function (options) {
                return new Paging($(this), options);
            }
        })(jQuery, window, document);
	</script>
  </body>
</html>
<script>
$("#page").paging({
	pageNo:${rest.pageNo},
	totalPage: ${rest.totalPage},
	totalSize: ${rest.total},
	callback: function(num) {
		window.location.assign("/propertylist?page="+num+"&cid="+${cid})
	}
})
</script>
<script>
	$("#submitform").click(function () {
		var data = $("#formproperty").serialize();
		$.ajax({
            url: "addproperty",
            data: data,
            error: function () {
                alert("失败")
            },
            success: function (data) {
                alert("添加成功");
                window.location.reload();
            }
		})
    });

    $("#submitform2").click(function () {
        var data = $("#formproperty2").serialize();
        $.ajax({
            url: "updateproperty",
            data: data,
            error: function () {
                alert("失败")
            },
            success: function (data) {
                alert("修改成功");
                window.location.reload();
            }
        })
    })
</script>
<script>
	function getname(id) {
        $.ajax({
            url: "getpropertyname",
            data: {"id":id},
            error: function () {
                alert("失败")
            },
            success: function (data) {
               $("#properyname").val(data.name);
               $("#propertyid").val(data.id);
            }
        })
    }
    function deleteproperty(id,name) {
	    if(confirm("确定删除:"+name)){
            $.ajax({
                url: "deletproperty",
                data: {"id":id},
                error: function () {
                    alert("失败")
                },
                success: function (data) {
                    alert("删除成功");
                    window.location.reload();
                }
            })
		}
    }
</script>