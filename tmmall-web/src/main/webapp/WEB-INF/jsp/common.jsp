<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<style>
    body {
        font-size: 12px;
        font-family: Arial;
    }

    a {
        color: #999;
    }

    .redColor {
        color: #C40000 !important;
    }

    nav.top {
        background-color: #f2f2f2;
        padding-top: 5px;
        padding-bottom: 5px;
        border-bottom: 1px solid #e7e7e7;
    }

    nav.top span, nav.top a {
        color: #999;
        margin: 0px 10px 0px 10px;
    }

    nav.top a:hover {
        color: #C40000;
    }

    div.searchDiv {
        background-color: #C40000;
        width: 400px;
        margin: 50px auto;
        padding: 1px;
        height: 40px;
        display: block;
    }

    div.searchDiv input {
        width: 275px;
        border: 1px solid transparent;
        height: 36px;
        margin: 1px;
        outline: none;
    }

    div.searchDiv button {
        width: 110px;
        border: 1px solid transparent;
        background-color: #C40000;
        color: white;
        font-size: 20px;
        font-weight: bold;
    }

    div.searchBelow {
        margin-top: 3px;
        margin-left: -20px;
    }

    div.searchBelow span {
        color: #999;
    }

    div.searchBelow a {
        padding: 0px 20px 0px 20px;
        font-size: 14px;
    }

    img.logo {
        position: absolute;
        left: 0px;
        top: 30px;
        z-index: -1;
    }

    body {
        font-size: 12px;
        font-family: Arial;
    }

    a {
        color: #999;
    }

    a:hover {
        text-decoration: none;
        color: #C40000;
    }

    div.footer {
        margin: 0px 0px;
        border-top-style: solid;
        border-top-width: 1px;
        border-top-color: #e7e7e7;
    }

    div.footer_ensure {
        margin-top: 24px;
        margin-bottom: 24px;
        text-align: center;
    }

    div.footer_desc {
        border-top-style: solid;
        border-top-width: 1px;
        border-top-color: #e7e7e7;
        padding-top: 30px;
        margin: 0px 20px;
    }

    div.footer_desc div.descColumn {
        width: 20%;
        float: left;
        padding-left: 15px;
    }

    div.footer_desc div.descColumn span.descColumnTitle {
        color: #646464;
        font-weight: bold;
        font-size: 16px;
    }

    div.footer_desc a {
        display: block;
        padding-top: 3px;
    }

    body {
        font-size: 12px;
        font-family: Arial;
    }

    a {
        color: #999;
    }

    a:hover {
        text-decoration: none;
        color: #C40000;
    }

    div.footer {
        margin: 0px 0px;
        border-top-style: solid;
        border-top-width: 1px;
        border-top-color: #e7e7e7;
    }

    div.copyright {
        background-color: black;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #C40000;
    }

    div.copyright span.slash {
        color: white;
    }

    div.footer div.copyright div.white_link a {
        color: white;
        padding: 0px 5px;
    }

    div.footer div.copyright div.white_link {
        padding: 10px 0px;
        margin-left: 10px;
    }

    div.license {
        margin-left: 10px;
        padding-bottom: 30px;
    }

    div.license span {
        color: #A4A4A4;
    }

    div.license div.copyRightYear {
        margin: 10px 0px;
        color: #686868;
    }

    img.cateye {
        margin-left: 20px;
    }

    body {
        font-size: 12px;
        font-family: Arial;
    }
</style>

<nav class="top ">
    <a href="#nowhere">
        <span class="glyphicon glyphicon glyphicon-home redColor"></span>
        天猫首页
    </a>

    <span>喵，欢迎来天猫</span>
    <a href="#nowhere">请登录</a>
    <a href="#nowhere">免费注册</a>

    <span class="pull-right">
            <a href="forebought">我的订单</a>
            <a href="forecart">
            <span class=" glyphicon glyphicon-shopping-cart redColor"></span>
            购物车<strong>0</strong>件</a>
        </span>

</nav>


<div>
    <a href="#nowhere"> <img class="logo" src="${APP_PATH}/img/site/logo.gif"
                             id="logo">
    </a>

    <div class="searchDiv">
        <input type="text" placeholder="时尚男鞋  太阳镜 " name="keyword">
        <button class="searchButton" type="submit">搜索</button>
        <div class="searchBelow">
                <span> <a href="#nowhere"> 平衡车 </a> <span>|</span>
                </span> <span> <a href="#nowhere"> 扫地机器人 </a> <span>|</span>
                </span> <span> <a href="#nowhere"> 原汁机 </a> <span>|</span>
                </span> <span> <a href="#nowhere"> 冰箱 </a></span>
        </div>
    </div>
</div>

<div style="height:50px"></div>


<div style="display: block;" class="footer" id="footer">
    <div class="footer_ensure" id="footer_ensure">
        <a href="#nowhere">
            <img src="${APP_PATH}/img/site/ensure.png">
        </a>
    </div>
    <div class="footer_desc" id="footer_desc">
        <div class="descColumn">
            <span class="descColumnTitle">购物指南</span>
            <a href="#nowhere">免费注册</a>
            <a href="#nowhere">开通支付宝</a>
            <a href="#nowhere">支付宝充值</a>
        </div>
        <div class="descColumn">
            <span class="descColumnTitle">天猫保障</span>
            <a href="#nowhere">发票保障</a>
            <a href="#nowhere">售后规则</a>
            <a href="#nowhere">缺货赔付</a>
        </div>
        <div class="descColumn">
            <span class="descColumnTitle">支付方式</span>
            <a href="#nowhere">快捷支付</a>
            <a href="#nowhere">信用卡</a>
            <a href="#nowhere">蚂蚁花呗</a>
            <a href="#nowhere">货到付款</a>
        </div>
        <div class="descColumn">
            <span class="descColumnTitle">商家服务</span>
            <a href="#nowhere">商家入驻</a>
            <a href="#nowhere">商家中心</a>
            <a href="#nowhere">天猫智库</a>
            <a href="#nowhere">天猫规则</a>
            <a href="#nowhere">物流服务</a>
            <a href="#nowhere">喵言喵语</a>
            <a href="#nowhere">运营服务</a>
        </div>
        <div class="descColumn">
            <span class="descColumnTitle">手机天猫</span>
            <a href="#nowhere"><img src="${APP_PATH}/img/site/ma.png"></a>
        </div>
    </div>
    <div style="clear:both"></div>
</div>


<div class="footer" id="footer">
    <img src="${APP_PATH}/img/site/cateye.png" class="cateye" id="cateye">
    <div class="copyright" id="copyright">
        <div class="white_link">
            <a href="#nowhere">关于天猫</a>
            <a href="#nowhere"> 帮助中心</a>
            <a href="#nowhere">开放平台</a>
            <a href="#nowhere"> 诚聘英才</a>
            <a href="#nowhere">联系我们</a>
            <a href="#nowhere">网站合作</a>
            <a href="#nowhere">法律声明</a>
            <a href="#nowhere">知识产权</a>
            <a href="#nowhere"> 廉正举报 </a>
        </div>
        <div class="white_link">
            <a href="#nowhere"> 阿里巴巴集团</a><span class="slash">|</span>
            <a href="#nowhere"> 淘宝网</a><span class="slash">|</span>
            <a href="#nowhere">天猫 </a><span class="slash">|</span>
            <a href="#nowhere"> 聚划算</a><span class="slash">|</span>
            <a href="#nowhere">全球速卖通</a><span class="slash">|</span>
            <a href="#nowhere">阿里巴巴国际交易市场</a><span class="slash">|</span>
            <a href="#nowhere">1688</a><span class="slash">|</span>
            <a href="#nowhere">阿里妈妈</a><span class="slash">|</span>
            <a href="#nowhere"> 阿里旅行·去啊 </a><span class="slash">|</span>
            <a href="#nowhere"> 阿里云计算 </a><span class="slash">|</span>
            <a href="#nowhere"> 阿里通信 </a><span class="slash">|</span>
            <a href="#nowhere"> YunOS </a><span class="slash">|</span>
            <a href="#nowhere"> 阿里旅行·去啊 </a><span class="slash">|</span>
            <a href="#nowhere"> 万网 </a><span class="slash">|</span>
            <a href="#nowhere"> 高德 </a><span class="slash">|</span>
            <a href="#nowhere"> 优视 </a><span class="slash">|</span>
            <a href="#nowhere"> 友盟 </a><span class="slash">|</span>
            <a href="#nowhere"> 虾米 </a><span class="slash">|</span>
            <a href="#nowhere"> 天天动听 </a><span class="slash">|</span>
            <a href="#nowhere"> 来往 </a><span class="slash">|</span>
            <a href="#nowhere"> 钉钉 </a><span class="slash">|</span>
            <a href="#nowhere"> 支付宝 </a>
        </div>
        <div class="license">
            <span>增值电信业务经营许可证： 浙B2-20110446</span>
            <span>网络文化经营许可证：浙网文[2015]0295-065号</span>
            <span>互联网医疗保健信息服务 审核同意书 浙卫网审【2014】6号 </span>
            <span>互联网药品信息服务资质证书编号：浙-（经营性）-2012-0005</span>
            <div class="copyRightYear">© 2003-2016 TMALL.COM 版权所有</div>
            <div>
                <img src="${APP_PATH}/img/site/copyRight1.jpg">
                <img src="${APP_PATH}/img/site/copyRight2.jpg">
            </div>
        </div>
    </div>
</div>
﻿<style>
span.how2jcopyrightspan1{
font-weight:bold;
}

span.how2jcopyrightspan1 a{
color:blue;
}

span.how2jcopyrightspan1 a:hover{
color:#C40000;
}

span.how2jcopyrightspan2{
color:red;

}
div.how2jcopyrightDiv{
width:500px;
margin:0px auto;
text-align:center;
}
</style>
<div class="how2jcopyrightDiv">
  <span class="how2jcopyrightspan1"><a href="http://how2j.cn/k/tmall-front/tmall-front-790/790.html?tid=12">模仿天猫前端多功能交互教程 </a> 为how2j.cn 版权所有
  </span>
    <br>
    <span class="how2jcopyrightspan2">（仅供购买者学习，请勿私自传播，否则自行承担相关法律责任）</span>

</div>

