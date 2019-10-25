<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2019/5/21
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <metahttp-equiv charset=UTF-8"></metahttp-equiv>
    <title>产品属性设置</title>
</head>
<body>
<form id="formvalue">
    <c:forEach items="${list }" var="list">
        <c:if test="${list.value !=null}">
            <p>${list.name }</p>
            <input type="hidden" value="${list.id1 }">
            <input type="text" value="${list.value }" name="${list.id1}">
        </c:if>
        <c:if test="${list.value ==null}">
            <div>
            <p>${list.name }</p>
            <input type="hidden" value="${list.id}" name="id">
            <input type="hidden" value="${list.pid}" name="pid">
            <input type="text" name="value">
            <input type="button" value="第一次新增属性必须在此提交"
                   onclick='firstput("${list.id}","${pid }",this)'>
            </div>
        </c:if>
        <br>
    </c:forEach>
    <button onclick="updatevalues(${pid })" type="button">修改</button>
</form>
</body>
</html>
<script>
    function updatevalues(pid,ptid){
       var data1 = $("#formvalue").serialize();
        var data = decodeURIComponent(data1,true);
       console.log(data)
        $.ajax({
            type:"POST",
            url:"updateproperyvalue?pid="+pid,
            data:{"data":data},
            error:function () {
                alert("失败")
            },
            success:function (data) {
                alert("跟新成功")
                window.location.reload()
            }
        })
    }
    function firstput(id,pid,o) {
        var val = $(o).prev().val();
            $.ajax({
                url:"insertproductvalue",
                data:{"id":id,"pid":pid,"value":val},
                error:function () {
                    alert("失败")
                },
                success:function (data) {
                    alert("新增成功")
                    window.history.go(-1)
                }
            })
    }
</script>
<script src="/study/backstatic/jquery/jquery-2.1.1.min.js"></script>

