<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang='UTF-8'>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <meta name='description' content=''>
    <meta name='author' content=''>

    <link rel='stylesheet' href='${APP_PATH}/study/backstatic/bootstrap/css/bootstrap.min.css'>
    <link rel='stylesheet' href='${APP_PATH}/study/backstatic/css/font-awesome.min.css'>
    <link rel='stylesheet' href='${APP_PATH}/study/backstatic/css/main.css'>
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        .tree-closed {
            height : 40px;
        }
        .tree-expanded {
            height : auto;
        }
    </style>
</head>

<body>

<nav class='navbar navbar-inverse navbar-fixed-top' role='navigation'>
    <div class='container-fluid'>
        <div class='navbar-header'>
            <div>
                <a class='navbar-brand' style='font-size:32px;' href='#'>天猫</a>
                <span><img alt='Generic placeholder image' src='/study/backstatic/img/logo2.png' class='img-circle' width='200' height='50'></span>
            </div>
        </div>
        <div id='navbar' class='navbar-collapse collapse'>
            <form class='navbar-form navbar-right'>
                <input type='text' class='form-control' placeholder='Search...'>
            </form>
        </div>
    </div>
</nav>
<div class='container-fluid'>
    <div class='row'>
        <div class='col-sm-3 col-md-2 sidebar'>
            <div class='tree'>
                <ul style='padding-left:0px;' class='list-group'>
                    <li class='list-group-item tree-closed'>
                        <span><i class='glyphicon glyphicon-user'></i>用户管理</span>
                        <ul style='margin-top:10px;display:none;'>
                            <li style='height:30px;'>
                                <a href='/back-user'><i class='glyphicon glyphicon-user'></i> 用户信息</a>
                            </li>
                        </ul>
                    </li>
                    <li class='list-group-item tree-closed'>
                        <span><i class='glyphicon glyphicon-ok'></i> 订单管理</span>
                        <ul style='margin-top:10px;display:none;'>
                            <li style='height:30px;'>
                                <a href='/orderlist'><i class='glyphicon glyphicon-check'></i> 订单信息</a>
                            </li>
                        </ul>
                    </li>
                    <li class='list-group-item tree-closed'>
                        <span><i class='glyphicon glyphicon-th-large'></i> 分类管理 </span>
                        <ul style='margin-top:10px;display:none;'>
                            <li style='height:30px;'>
                                <a href='/categorylist'><i class='glyphicon glyphicon-picture'></i> 分类信息</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script src='${APP_PATH}/study/backstatic/jquery/jquery-2.1.1.min.js'></script>
<script src='${APP_PATH}/study/backstatic/bootstrap/js/bootstrap.min.js'></script>
<script src='${APP_PATH}/study/backstatic/script/docs.min.js'></script>
<script type='text/javascript'>
    $(function () {
        $('.list-group-item').click(function(){
            // jquery对象的回调方法中的this关键字为DOM对象
            // $(DOM) ==> JQuery
            if ( $(this).find('ul') ) { // 3 li
                $(this).toggleClass('tree-closed');
                if ( $(this).hasClass('tree-closed') ) {
                    $('ul', this).hide('fast');
                } else {
                    $('ul', this).show('fast');
                }
            }
        });
    });
</script>
</body>
</html>

