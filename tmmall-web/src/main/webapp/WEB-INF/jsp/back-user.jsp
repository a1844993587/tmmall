<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

    <script src="${APP_PATH}/study/backstatic/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/study/backstatic/bootstrap/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/study/backstatic/script/docs.min.js"></script>
    <style>
        table tbody tr:nth-child(odd) {
            background: #F4F4F4;
        }

        table tbody td:nth-child(even) {
            color: #C00;
        }
    </style>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
</head>

<body>
<!-- 新增模态框 -->
<div id="user_add" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">用户添加</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="user_add_name">用户名</label>
                        <input type="text" class="form-control" id="user_add_name" name="name" placeholder="User">
                        <span class="help-block"></span>

                        <label for="user_add_password">密码</label>
                        <input type="password" class="form-control" id="user_add_password" name="password" placeholder="Password">
                        <span class="help-block"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="user_save" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>

<!-- 编辑模态框 -->
<div id="user_edit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">用户编辑</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="id_update_satic">ID</label>
                        <p class="form-control-static" id="id_update_satic"></p>
                    </div>
                    <div class="form-group">
                        <label for="id_update_name">用户名</label>
                        <input name="name" class="form-control" id="id_update_name">
                        <span class="help-block"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_update">更新</button>
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
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 用户信息</h3>
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
                    <button id="user_delete_all" type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i
                            class=" glyphicon glyphicon-remove"></i> 删除
                    </button>
                    <button type="button" id="user_add_model" class="btn btn-primary" style="float:right;"><i class="glyphicon glyphicon-plus"></i> 新增
                    </button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered" id="user_table">
                            <thead>
                            <tr>
                                <th width="30"><input type="checkbox" id="check_all"></th>
                                <th>ID</th>
                                <th>用户名</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="4" align="center" id="page_nav_area">
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
<script type="text/javascript">
    var totalNumber,currentPage;
    //1、页面加载完成后，直接发送一个ajax请求，拿到分页的数据
    $(function () {
        //去首页
        to_page(1);
    });

    //分页的页面跳转
    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/BackUser",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                //1、解析并显示用户信息
                build_user_table(result);
                // 2、解析并显示分页信息
                build_page_nav(result);
            }
        });
    }

    //重置表单的方法
    function reset_form(ele) {
        //内容
        $(ele)[0].reset();
        //样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //用户表格
    function build_user_table(result) {
        //清空表格  #user_table tbody
        $("#user_table tbody").empty();
        var user = result.extend.pageInfo.list;
        $.each(user, function (index, item) {
            var checkBox = $("<td></td>").append("<input type='checkbox' class='check_item'>");

            var userId = $("<td></td>").append(item.id);
            var userName = $("<td></td>").append(item.name);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-xs edit_btn")
                .append($("<i></i>").addClass("glyphicon glyphicon-pencil"));
            //设置id
            editBtn.attr("edit-id",item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-xs delete_btn")
                .append($("<i></i>").addClass("glyphicon glyphicon-remove"));
            //设置id
            delBtn .attr("del-id",item.id);
            //把构建好的td加入到tr
            $("<tr></tr>").append(checkBox)
                .append(userId)
                .append(userName)
                .append(editBtn)
                .append("&nbsp;")
                .append(delBtn)
                .appendTo("#user_table tbody");
        });

    }

    //解析显示分页信息
    function build_page_nav(result) {
        //   page_nav_area
        //清空信息
        $("#page_nav_area").empty();
        //分页信息
        var ul = $("<ul></ul>").addClass("pagination")
        //上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("上一页").attr("hreef", "#"));
        if (result.extend.pageInfo.hasPreviousPage === false) {
            prePageLi.addClass("disabled");
        }
        //为上一页绑定事件
        prePageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum - 1);
        });
        //第一页
        // var firstPageLi = $("<li></li>").addClass("active").append($("<a></a>").append("1").attr("hreef","#")
        //             .append($("<span></span>").addClass("sr-only")));

        //添加上一页
        ul.append(prePageLi).append("&nbsp;");
        //.append(firstPageLi);
        //中间页
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("hreef", "#"));
            if (result.extend.pageInfo.pageNum === item) {
                numLi.addClass("active");
            }
            //为中间页绑定事件
            numLi.click(function () {
                to_page(item)
            });
            //添加中间页
            ul.append(numLi).append("&nbsp;");
        });
        //下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("下一页").attr("hreef", "#"));
        if (result.extend.pageInfo.hasNextPage === false) {
            nextPageLi.addClass("disabled");
        }
        //为下一页绑定事件
        nextPageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum + 1);
        });
        //添加下一页
        ul.append(nextPageLi);
        ul.appendTo("#page_nav_area");

        totalNumber = result.extend.pageInfo.lastPage;
        currentPage = result.extend.pageInfo.pageNum;
    }

    //新增弹出模态框
    $(document).on('click','#user_add_model',function(){
        //清除表单数据
        reset_form("#user_add form");
        $("#user_add").modal({
            backdrop:'static'
        });
        // $("#user_add").modal(option);
    });

    //校验用户的方法
    function validata_add_form(){
        //1拿到要检验的数据
       var userName = $("#user_add_name").val();
       var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;

       //校验用户名
      if(!regName.test(userName)){
          show_validate_msg("#user_add_name","error","用户名可以是3-5为汉字或者6-16位英文和数字的组合");
          // alert("用户名可亿是3-5为汉字或者6-16位英文和数字的组合");
          return false;
      }else {
          show_validate_msg("#user_add_name","success","");
      }
      return true;
    }
    //校验用户的提示信息
    function show_validate_msg(ele,status,msg){
        //清除之前的样式
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" === status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if ("error" === status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //校验用户是否可用

        $("#user_add_name").change(function(){
            //发送ajax请求校验用户名是否可用
            var name = this.value;
            $.ajax({
                type:"GET",
                url:"${APP_PATH}/checkuser/" + name,
                success:function(result){
                    if(result.code==100){
                        show_validate_msg("#user_add_name","success","用户名可用");
                        //保存按钮成功
                        $("#emp_save_btn").attr("ajax-va","success");
                    }else{
                        show_validate_msg("#user_add_name","error",result.extend.va_msg);
                        //保存按钮失败
                        $("#emp_save_btn").attr("ajax-va","error");
                    }
                }
            });
        });

    //新增模态框保存 的事件
    $("#user_save").click(function () {
        //1、将模态框中的数据提交给服务器,进行校验
        if (!validata_add_form()){
            return false;
        }
        //1判断用户名校验是否成功
        if ($(this).attr("ajax-va") == "error") {
            return false
        }
        //2、发送ajax请求保存用户
        $.ajax({
            url: "${APP_PATH}/BackUser",
            type: "POST",
            data: $('#user_add form').serialize(),
            success: function (result) {
                alert(result.msg);
                $('#user_add').modal('hide');
                $(".modal-backdrop").remove();
                to_page(totalNumber);
            }
        });
    });

    //弹出编辑模态框
    $(document).on("click",".edit_btn",function () {
        //查出用户信息并显示

        getUser($(this).attr("edit-id"))

        //传递用户id
        $("#user_update").attr("edit-id",$(this).attr("edit-id"))
        //弹出模态框
        $("#user_edit").modal({
            backdrop:'static'
        });
    })

    //查询用户信息的方法
    function getUser(id) {
        $.ajax({
            url:"${APP_PATH}/BackUser/"+id,
            type:"GET",
            success:function (result) {
                // console.log(result);
                var user = result.extend.userDate;
                $("#id_update_satic").text(user.id);
                $("#id_update_name").val(user.name);
            }
        });
    }

    //更新用户信息
    $("#user_update").click(function () {
        //验证用户
        var userName = $("#id_update_name").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;

        //校验用户名
        if(!regName.test(userName)){
            show_validate_msg("#id_update_name","error","用户名可以是3-5为汉字或者6-16位英文和数字的组合");
            // alert("用户名可亿是3-5为汉字或者6-16位英文和数字的组合");
            return false;
        }else {
            show_validate_msg("#id_update_name","success","");
        }

        //保存用户信息
        $.ajax({
            url:"${APP_PATH}/updateUser/"+$(this).attr("edit-id"),
             type:"PUT",
            data:$("#user_edit form").serialize(),
            success:function (result) {
                alert(result.msg);
                $("#user_edit").modal('hide');
                to_page(currentPage);
            }
        });
    });

    //删除单个用户
    $(document).on("click",".delete_btn",function () {
        //1、弹出确认删除对话框
       // alert($(this).parents("tr").find("td:eq(2)").text());

       var name =  $(this).parents("tr").find("td:eq(2)").text()
        var id = $(this).attr("del-id");
        if (confirm("确认删除【"+name+"】吗？")){
            //确认发送请求删除
            $.ajax({
                url:"${APP_PATH}/BackUser/"+id,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }

            });
        }
    });

    //选择框
    $("#check_all").click(function () {
        $(this).prop("checked");
        $(".check_item").prop("checked",$(this).prop("checked"));
        
    });

    //check_item
    $(document).on("click",".check_item",function () {
        //判断是否选择10个
        var flag = ($(".check_item:checked").length === $(".check_item").length);

        $("#check_all").prop("checked",flag);
    })

    //全部删除
    $("#user_delete_all").click(function () {

        var userName = "";
        var del_idstr = "";
        $.each($(".check_item:checked"),function () {
            //用户名字
             userName += $(this).parents("tr").find("td:eq(2)").text()+",";
             //用户id
             del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        //去除多余的符号
        userName = userName.substring(0,userName.length-1);
        del_idstr = del_idstr.substring(0,del_idstr.length-1);
        if (confirm("确认删除【"+userName+del_idstr+"】吗?")){
            //发送删除请求
            $.ajax({
                url:"${APP_PATH}/BackUser/"+del_idstr,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });
</script>

</body>
</html>
