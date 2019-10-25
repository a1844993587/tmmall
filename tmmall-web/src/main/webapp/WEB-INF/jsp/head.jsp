<%--
  Created by IntelliJ IDEA.
  User: gjl
  Date: 2019/5/17
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天猫官网</title>
    <%
        request.setAttribute("APP_PATH", request.getContextPath());
    %>
</head>
<body>
    <nav class="top ">
    <a href="/">
        <span style="color:#C40000;margin:0px" class=" glyphicon glyphicon glyphicon-home redColor"></span>
        天猫首页
    </a>

    <span>喵，欢迎来天猫</span>

    <a id="denglu" href="/login">请登录</a>
    <a id="regist" href="/regist">免费注册</a>
    <a id="exit" href="/denglu/exit">退出</a>

    <span class="pull-right">
        <a href="/order/findAllUserOrderItem">我的订单</a>
        <a href="/car/myShopCar" id="cart">
            <span  style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>购物车<strong>0</strong>件
        </a>
    </span>
    </nav>
</body>
    <script>
        $(function () {
            var username = "${u.name}";
            if (username !== "") {
                $("#denglu").html(username);
                $("#denglu").attr("href","javascript:void(0)");
                $("#exit").show();
                $("#regist").hide();
            }else {
                $("#exit").hide();
                $("#regist").show();
            }

        });
        $(document).ready(function() {
            var user = ${u.id} + '';
            if (user != '') {
                sendAjax();
            }
        });

        function sendAjax() {
            $.ajax({
                type: "GET",
                url: "/car/countSumUserShopCar/${u.id}",
                success: function (sum) {
                    $("#cart").empty();
                    var html = '';
                    if (sum == '')
                    html += '<span  style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>购物车<strong>0</strong>件';
                    else
                    html += '<span  style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>购物车<strong>' + sum + '</strong>件';
                    $("#cart").html(html);
                }
            });
        }
    </script>
</html>
