<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragrma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
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
        table tbody tr:nth-child(odd) {
            background: #F4F4F4;
        }

        table tbody td:nth-child(even) {
            color: #C00;
        }
    </style>
</head>

<body>
<!-- 新增模态框 -->
<div id="sort_add" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">新增分类</h4>
            </div>
            <form action="/addcategory" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputSort">分类名称</label>
                        <input name="name" type="sort" class="form-control" id="exampleInputSort" placeholder="分类名称">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">分类图片</label>
                        <input name="file" type="file" id="exampleInputFile">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 编辑模态框 -->
<div id="sort_edit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">编辑分类</h4>
            </div>
            <div class="modal-body">
                <form action="/updatecategory" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="exampleInputSort">分类名称</label>
                        <input name="name" id="modelname" type="sort" class="form-control" placeholder="分类名称">
                        <input name="id" type="hidden" id="hiddenid">
                        <input name="page" type="hidden" id="hiddenpage">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">分类图片</label>
                        <input type="file" id="exampleInputFile" name="file">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
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
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 分类信息</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input class="form-control has-success" type="text" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询
                        </button>
                    </form>
                    <button id="deletcheck" type="button" class="btn btn-danger" style="float:right;margin-left:10px;">
                        <i class=" glyphicon glyphicon-remove"></i> 删除
                    </button>
                    <button type="button" class="btn btn-primary" style="float:right;" data-toggle="modal"
                            data-target="#sort_add"><i class="glyphicon glyphicon-plus"></i> 新增
                    </button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr>
                                <th width="30"><input id="checkall" type="checkbox" onclick="checkboxOnclick(this)">
                                </th>
                                <th>ID</th>
                                <th>图片</th>
                                <th>分类名称</th>
                                <th>属性管理</th>
                                <th>产品管理</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${rest.rows}" var="list">
                                <tr>
                                    <td><input type="checkbox" class="chechboxs"></td>
                                    <td>${list.id}</td>
                                    <td><img src="/img/category/${list.id}.jpg" style="width: 345px;height: 35px;"></td>
                                    <td>${list.name}</td>
                                    <td>
                                        <button type="button" class="btn btn-info btn-xs"><a
                                                href="/propertylist?cid=${list.id}"><i
                                                class=" glyphicon glyphicon-list"></i></a></button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-info btn-xs"><a
                                                href="/productlist?cid=${list.id}"><i
                                                class=" glyphicon glyphicon-briefcase"></i></a></button>
                                    </td>
                                    <td>
                                        <button onclick="getcategory(${list.id})" type="button"
                                                class="btn btn-primary btn-xs" data-toggle="modal"
                                                data-target="#sort_edit"><i class=" glyphicon glyphicon-pencil"></i>
                                        </button>
                                        <button onclick='deletcategory("${list.id}","${list.name}")' type="button"
                                                class="btn btn-danger btn-xs"><i
                                                class=" glyphicon glyphicon-remove"></i></button>
                                            <%--//\"cc('" + ${list.id} + "','" + ${list.name} + "')\"--%>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="7" align="center">
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
<script>
    //分页
    $("#page").paging({
        pageNo:${rest.pageNo},
        totalPage: ${rest.totalPage},
        totalSize: ${rest.total},
        callback: function (num) {
            window.location.assign("/categorylist?page=" + num)
        }
    })
</script>
<script>
    function getcategory(a) {
        $.ajax({
            url: "getcategorybyid",
            data: {id: a},
            error: function () {
                alert("失败")
            },
            success: function (data) {
                $("#modelname").val(data.name);
                $("#hiddenid").val(data.id);
                $("#hiddenpage").val(window.location.search.substring(
                    window.location.search.lastIndexOf("=") + 1));
                categoryname = data.name;
            }
        });
        return categoryname;
    }

    /*ajax删除分类*/
    function deletcategory(a, name) {
        if (confirm("确定删除分类：" + name)) {
            $.ajax({
                url: "deletcategory",
                data: {id: a},
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
<script>
    function checkboxOnclick(checkbox) {
        if (checkbox.checked === true) {
            $(".chechboxs").prop("checked", true)
        } else {
            $(".chechboxs").prop("checked", false)
        }
    }

    $(document).on("click", ".chechboxs", function () {
        var flg = $(".chechboxs:checked").length === $(".chechboxs").length;
        $("#checkall").prop("checked", flg);
    });

    $("#deletcheck").click(function () {
        var checkName = "";
        var checkId = "";
        $.each($(".chechboxs:checked"), function () {
            checkId += $(this).parents("tr").find("td:eq(1)").text() + "-";
            checkName += $(this).parents("tr").find("td:eq(3)").text() + "， ";
        });
        var substringName = checkName.substring(0, checkName.length - 2);
        if (confirm("确定删除:(" + substringName + ")")) {
            $.ajax({
                url: "deletcategorybyids",
                data: {"checkid": checkId},
                error: function () {
                    alert("批量删除分类的属性和产品必须为空")
                },
                success: function (data) {
                    alert("删除成功");
                    window.location.reload();
                }
            })
        }
    })
</script>

</body>
</html>
