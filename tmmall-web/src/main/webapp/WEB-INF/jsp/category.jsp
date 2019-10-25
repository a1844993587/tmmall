<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>

<head>
    <script src="study/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <style>
        .show {
            border: 1px dotted skyblue !important;
        }

        body {
            font-size: 12px;
            font-family: Arial;
            min-width: 1024px;

        }

        a {
            color: #999;
        }

        a:hover {
            text-decoration: none;
            color: #C40000;
        }

        nav.top {
            padding-top: 5px;
            padding-bottom: 5px;
            border-bottom-style: solid;
            border-bottom-width: 1px;
            border-bottom-color: #e7e7e7;
        }

        .redColor {
            color: #C40000;
        }

        .boldWord {
            font-weight: bold;
        }

        nav.top span {
            margin-right: 20px;
        }

        nav.top span, nav.top a {
            color: #999;
            margin: 0px 10px 0px 10px;
        }

        nav.top a:hover {
            color: #C40000;
        }

        nav.top {
            background-color: #f2f2f2;
        }

        nav.top div.row div {
            margin: 5px 0px;
        }

        nav.top div.row div {
            background-color: lightgray;
            border: 1px solid gray;
            text-align: center;
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

        div.categoryWithCarousel {
            width: 100%;
            position: relative;
        }

        div.carouselBackgroundDiv {
            width: 100%;
            height: 510px;
            background-color: #E8E8E8;
            position: absolute;
            top: 36px;

            z-index: -1;

        }

        div.categoryWithCarousel div.headbar {
            background-color: #DD2727;
        }

        div.carousel-of-product {
            width: 1024px;
            height: 510px;
            margin: 0px auto;
        }

        div.carousel-inner div.item img {

        }

        div.categoryWithCarousel div.categoryMenu {
            width: 200px;
            background-color: #e2e2e3;

            margin-left: 20px;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 1;
        }

        div.categoryWithCarousel div.productsAsideCategorys {
            width: 825px;
            height: 510px;
            background-color: white;

            margin-left: 220px;
            display: none;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 1;
        }

        div.categoryWithCarousel div.eachCategory:hover {
            background-color: white;
        }

        div.categoryWithCarousel div.eachCategory span {
            margin-right: 10px;
        }

        div.categoryWithCarousel div.eachCategory {

            line-height: 30px;
            padding-left: 10px;

            font-size: 14px;

        }

        div.categoryWithCarousel div.rightMenu {
            display: inline-block;
        }

        div.categoryWithCarousel div.rightMenu img {
            height: 30px;
        }

        div.categoryWithCarousel div.rightMenu span {
            margin: 0px 20px 0px 20px;
        }

        div.categoryWithCarousel div.rightMenu a {
            font-size: 16px;
            color: white;
        }

        div.categoryWithCarousel div.head {
            width: 200px;
            background-color: #C60A0A;
            height: 36px;
            line-height: 36px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            margin-left: 20px;
            display: inline-block;
        }

        div.productsAsideCategorys a {
            color: #999;
            font-size: 14px;
            margin: 8px;
        }

        div.productsAsideCategorys a:hover {
            color: #C40000;
            text-decoration: none;
        }

        div.productsAsideCategorys div.row {
            margin: 20px 80px 0px 80px;
        }

        div.productsAsideCategorys div.row div.seperator {
            margin-top: 20px;
            border-bottom-style: dashed;
            border-bottom-width: 1px;
            border-bottom-color: #e7e7e7;
        }

        div.categoryMenu a {
            color: #000;
        }

        div.categoryMenu a:hover {
            color: lightskyblue;
            text-decoration: none;
        }

        div.searchBelow span {
            color: #999;
        }

        div.searchBelow {
            margin-top: 3px;
            margin-left: -20px;
        }

        div.searchBelow a {
            padding: 0px 20px 0px 20px;
            font-size: 14px;
        }

        div.homepageDiv {
            position: relative;
        }

        img.catear {
            position: absolute;
            height: 15px;
            display: none;
        }

        img.logo {
            position: absolute;
            left: 0px;
            top: 30px;

        }

        div.homepageCategoryProducts {
            background-color: #F5F5F5;
            padding: 50px 10px 50px 10px;
            margin: 10px auto;
            max-width: 1013px;
        }

        div.left-mark {
            display: inline-block;
            height: 20px;
            vertical-align: top;
            width: 5px;
            background-color: #19C8A9;
        }

        span.categoryTitle {
            font-size: 16px;
            margin-left: 30px;
            color: #646464;
            font-weight: bold;
        }

        div.productItem {
            width: 189px;
            height: 285px;
            border: 1px solid white;
            background-color: white;
            margin: 8px 4px;
            float: left;
            cursor: pointer;
        }

        a.productItemDescLink {
            display: inline-block;
            height: 66px;
        }

        div.productItem:hover {
            border: 1px solid #C40000;
        }

        div.productItem span.productItemDesc {
            font-size: 12px;
            color: #666666;
            display: block;
            padding: 16px;
        }

        div.productItem span.productPrice {
            font-size: 16px;
            color: #FF003A;
            display: block;
            padding-left: 16px;
            margin-top: -10px;
        }

        div.eachHomepageCategoryProducts {
            margin: 0px 0px 40px 0px;
        }

        div.productItem img {
            width: 187px;
            height: 190px;
        }

        div.productItem img:hover {
            opacity: 0.7;
            filter: alpha(opacity=70);
        }

        img.endpng {
            display: block;
            width: 82px;
            margin: 0 auto;
        }

        div.footer {
            margin: 0px 0px;
            border-top-style: solid;
            border-top-width: 1px;
            border-top-color: solid;
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

        div.footer div.copyright div.white_link a {
            color: white;
            padding: 0px 5px;
        }

        div.footer div.copyright div.white_link {
            padding: 10px 0px;
            margin-left: 10px;
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

        div.copyright {
            background-color: black;
            border-top-style: solid;
            border-top-width: 2px;
            border-top-color: solid;
            border-top-color: #C40000;
        }

        img.cateye {
            margin-left: 20px;
        }

        div.copyright span.slash {
            color: white;
        }

        div.license {
            margin-left: 10px;
            padding-bottom: 30px;
        }

        div.license div.copyRightYear {
            margin: 10px 0px;
            color: #686868;
        }

        div.license span {
            color: #A4A4A4;
        }

        div.simpleLogo {
            padding: 32px 0px;
        }

        img.loginBackgroundImg {
            display: block;
            margin: 0px auto;
        }

        div.loginDivInProductPageModalDiv {
            width: 350px;
        }

        div.deleteConfirmModalDiv {
            width: 350px;
        }

        div.loginDivInProductPage {
            background-color: white;
            width: 350px;
            height: 400px;
            padding: 60px 25px 80px 25px;
        }

        div.loginSmallDiv {
            background-color: white;
            position: absolute;
            right: 180px;
            top: 180px;
            width: 350px;
            height: 400px;
            padding: 60px 25px 80px 25px;
        }

        div.loginErrorMessageDiv {
            width: 300px;
            position: absolute;
            top: 20px;
            display: none;
        }

        div.loginErrorMessageDiv div.alert {
            padding: 5px !important;
        }

        div.login_acount_text {
            color: #3C3C3C;
            font-size: 16px;
            font-weight: bold;
        }

        div.loginInput {
            border: 1px solid #CBCBCB;
            margin: 20px 0px;
        }

        div.loginInput input {
            display: inline-block;
            border: 0px solid transparent;
            width: 244px;
            height: 30px;
            position: relative;
            left: 6px;
            top: 6px;
        }

        div.loginInput span, div.loginInput input {
            display: inline-block;
        }

        div.loginInput span.loginInputIcon {
            margin: 0px;
            background-color: #CBCBCB;
            width: 40px;
            height: 40px;
        }

        span.loginInputIcon span.glyphicon {
            font-size: 22px;
            position: relative;
            left: 9px;
            top: 9px;
            color: #606060;
        }

        button.redButton {
            color: white;
            background-color: #C40000;
            font-size: 14px;
            font-weight: bold;
        }

        div.categorySortBar {
            background-color: #FAF9F9;
            margin: 40px 20px 20px 20px;
            padding: 4px;
        }

        table.categorySortBarTable td {
            border: 1px solid #CCCCCC;
            padding: 3px;
            height: 23px;
        }

        table.categorySortBarTable {
            border-collapse: collapse;
            display: inline-table;
        }

        table.categorySortBarTable td a {
            color: #806F66;
            font-size: 12px;
        }

        table.categorySortBarTable td a:hover {
            color: #C40000;
        }

        table.categorySortBarTable td.grayColumn {
            background-color: #F1EDEC;
        }

        table.categorySortBarTable td.priceMiddleColumn {
            width: 10px;
            vertical-align: middle;
            color: #CCCCCC;
        }

        table.categorySortTable td:hover {
            background-color: #F1EDEC;
        }

        table.categorySortBarTable span.glyphicon {
            font-size: 10px;
        }

        table.categorySortBarTable input {
            border-width: 0px;
            height: 100%;
            width: 50px;
            font-size: 12px;
        }

        div.categoryProducts {
            padding: 0px 20px 40px 20px;
        }

        div.productUnit {
            width: 225px;
            height: 338px;
            border: 3px solid #fff;
            background-color: white;
            margin: 12px 5px;
            float: left;
            padding: 0px;
        }

        div.productUnit:hover {
            width: 225px;
            border: 3px solid #C40000;
            padding: 0px;
        }

        div.productUnit span.productUnitDesc {
            font-size: 12px;
            color: #666666;
            display: block;
            padding: 16px;
        }

        div.productUnitFrame {
            border: 1px solid #eee;
        }

        div.productUnitFrame:hover {
            border: 1px solid #C40000;
        }

        div.productUnit span.productPrice {
            font-size: 20px;
            color: #CC0000;
            display: block;
            padding-left: 4px;
        }

        div.productUnit span.productReview {
            border-left-width: 1px;
            border-left-style: solid;
            border-left-color: #EEEEEE;
            border-right-width: 1px;
            border-right-style: solid;
            border-right-color: #EEEEEE;
        }

        div.productUnit a.productLink {
            margin: 10px 0px;
            color: #333333;
            font: 0.8em;
            display: block;
        }

        div.productUnit a.productLink:hover {
            text-decoration: underline;
            color: #C40000;
        }

        div.productUnit a.tmallLink {
            margin: 10px 0px;
            color: #999999;
            font: 0.8em;
            display: block;
            text-decoration: underline;
        }

        div.productUnit a.tmallLink:hover {
            text-decoration: underline;
            color: #C40000;
        }

        div.productUnit div.productInfo {
            color: #999999;
        }

        div.productUnit span.monthDeal, div.productUnit span.productReview {
            display: inline-block;
            width: 90px;
            height: 30px;
            padding-top: 5px;
            padding-left: 5px;
        }

        div.productUnit span.wangwang {
            padding-left: 3px;
        }

        div.productUnit span.productDealNumber {
            font-weight: bold;
            color: #B57C5B;
        }

        div.productUnit span.productReviewNumber {
            font-weight: bold;
            color: #3388BB;
        }

        div.productUnit img.productImage {
            width: 100%;
            height: 190px;
        }

        div.productUnit div.productInfo {
            border-top-width: 1px;
            border-top-style: solid;
            border-top-color: #EEEEEE;
        }

        img.simpleLogo {
            position: absolute;
            left: 10px;
            top: 50px;
            width: 140px;
        }

        div.simpleSearchDiv {
            background-color: #C40000;
            width: 300px;
            margin: 10px 20px 40px;
            padding: 1px;
            height: 40px;
            display: block;
        }

        div.simpleSearchDiv input {
            width: 225px;
            border: 1px solid transparent;
            height: 34px;
            margin: 2px;
            outline: none;
        }

        div.simpleSearchDiv button {
            width: 60px;
            border: 1px solid transparent;
            background-color: #C40000;
            color: white;
            font-size: 14px;

        }

        div.imgAndInfo {
            margin: 40px 20px;
        }

        div.imgAndInfo img.bigImg {
            width: 400px;
            height: 400px;
            padding: 20px;
            border: 1px solid #F2F2F2;
        }

        div.imgAndInfo div.smallImageDiv {
            width: 80%;
            margin: 20px auto;
        }

        div.imgAndInfo img.smallImage {
            width: 60px;
            height: 60px;
            border: 2px solid white;
        }

        div.imgAndInfo img.smallImage:hover {
            border: 2px solid black;
        }

        div.imgInimgAndInfo {
            width: 400px;
            float: left;
        }

        div.infoInimgAndInfo {
            padding: 0px 20px;
            overflow: hidden;
        }

        div.infoInimgAndInfo div.productTitle {
            color: black;
            font-size: 16px;
            font-weight: bold;
            margin: 0px 10px;
        }

        div.infoInimgAndInfo div.productSubTitle {
            color: #DD2727;
            font-size: 12px;

            margin: 0px 10px;
        }

        div.infoInimgAndInfo div.juhuasuan {

            background-color: #2DA77A;
            color: white;
            text-align: center;
            line-height: 40px;
            margin-top: 10px;
        }

        div.infoInimgAndInfo span.juhuasuanBig {
            font-size: 18px;
            font-weight: bold;
            font-family: ����;
        }

        div.infoInimgAndInfo span.juhuasuanTime {
            color: #FFC057;
            font-weight: bold;
        }

        div.infoInimgAndInfo div.gouwujuanDiv {
            margin-top: 5px;
        }

        div.infoInimgAndInfo div.originalDiv {
            margin-top: 5px;
        }

        div.infoInimgAndInfo div.promotionDiv {
            margin-top: 0px;
        }

        div.infoInimgAndInfo div.productPriceDiv {
            background-image: url(${APP_PATH}/img/site/priceBackground.png);
            height: 102px;
            padding: 10px;
            color: #666666;
        }

        div.infoInimgAndInfo span.originalPriceDesc {
            color: #999999;
            display: inline-block;
            width: 68px;
        }

        div.infoInimgAndInfo span.promotionPriceDesc {
            color: #999999;
            display: inline-block;
            width: 68px;
            position: relative;
            left: 0px;
            top: -10px;
        }

        div.infoInimgAndInfo span.originalPriceYuan {
            font-family: Arial;
            font-size: 12px;
        }

        div.infoInimgAndInfo span.originalPrice {
            font-family: Arial;
            font-size: 12px;
            color: #333333;
            text-decoration: line-through;
        }

        div.infoInimgAndInfo span.promotionPriceYuan {
            font-family: Arial;
            font-size: 18px;
            color: #C40000;

        }

        div.infoInimgAndInfo span.promotionPrice {
            color: #c40000;
            font-family: Arial;
            font-size: 30px;
            font-weight: bold;

        }

        div.infoInimgAndInfo div.productSaleAndReviewNumber {
            margin: 20px 0px;
            border-top-style: dotted;
            border-top-color: #C9C9C9;
            border-top-width: 1px;
            border-bottom-style: dotted;
            border-bottom-color: #C9C9C9;
            border-bottom-width: 1px;
            padding: 10px;
        }

        div.infoInimgAndInfo div.productSaleAndReviewNumber div {
            display: inline-block;
            width: 49%;
            text-align: center;
            color: #999999;
            font-size: 12px;
        }

        div.infoInimgAndInfo div.productSaleAndReviewNumber div:first-child {
            border-right-width: 1px;
            border-right-style: solid;
            border-right-color: #E5DFDA;
        }

        div.infoInimgAndInfo div.productNumber {
            color: #999999;
        }

        div.infoInimgAndInfo span.productNumberSettingSpan {
            border: 1px solid #999;
            display: inline-block;
            width: 43px;
            height: 32px;
            padding: 7px 0;
        }

        div.infoInimgAndInfo input.productNumberSetting {
            border: 0px;
            height: 80%;
            width: 80%;
        }

        div.productNumber span.glyphicon {
            font-size: 6px;
        }

        div.productNumber span.arrow {
            display: inline-block;
            width: 22px;
            height: 32px;
            vertical-align: top;
        }

        div.productNumber span.updown img {
            display: inline-block;
            vertical-align: top;
        }

        div.productNumber span.updown {
            border: 1px solid #999;
            display: block;
            width: 20px;
            height: 14px;
            text-align: center;
            padding-top: 4px;
        }

        div.productNumber span.updownMiddle {
            height: 4px;
            display: block;
        }

        div.serviceCommitment {
            margin: 20px 0px;
        }

        div.infoInimgAndInfo span.serviceCommitmentDesc {
            color: #999999;
        }

        div.infoInimgAndInfo span.serviceCommitmentLink a {
            color: #666666;
        }

        div.productDetailDiv {
            width: 790px;
            margin: 40px auto;
        }

        div.productReviewDiv {
            width: 790px;
            margin: 40px auto;
        }

        div.productReviewContentPart {
            padding-top: 50px;
        }

        div.productDetailTopPart {
            border: 1px solid #DFDFDF;
            border-left-width: 0px;
        }

        div.productReviewTopPart {
            border: 1px solid #DFDFDF;
        }

        div.productParamterPart {
            border: 1px solid #DFDFDF;
            padding: 40px;
        }

        div.productParamter {
            color: #999999;
            font-weight: bold;
            margin-bottom: 20px;
        }

        div.productParamterList span {
            display: block;
            width: 220px;
            float: left;
            padding: 8px 0px;
            color: #666666;
        }

        a.selected {
            border-left: 1px solid #cfbfb1;
            border-right: 1px solid #cfbfb1;
            color: #b10000;
            display: inline-block;
            font-weight: bold;
            line-height: 46px;
            width: 90px;
            text-align: center;
            position: relative;
        }

        a.selected:after {
            border-color: #b00000 transparent transparent;
            border-style: solid;
            border-width: 5px;
            content: "";
            display: block;
            width: 0;
            height: 0;
            position: absolute;
            top: -1px;
            left: 50%;
            margin-left: -5px;
        }

        a.selected:before {
            border-color: #b00000;
            border-style: solid;
            border-width: 1px;
            content: "";
            display: block;
            width: 90px;
            height: 0;
            position: absolute;
            top: -1px;
            margin-left: -1px;
        }

        a.productDetailTopReviewLink {
            padding: 0px 20px;
            border-right: 1px dotted #D2D2D2;
            color: #333333;
        }

        span.productDetailTopReviewLinkNumber {
            color: #3355B9;
        }

        span.productReviewTopReviewLinkNumber {
            color: #3355B9;
        }

        div.productDetailImagesPart img {
            display: block;
            margin 20px 0px;
            width: 790px;
        }

        a.productReviewTopPartSelectedLink {
            padding: 0px 20px;
            color: #333333;
        }

        div.productReviewItem {
            border-bottom: 1px solid #E3E3E3;
            margin: 10px 0px;
        }

        div.productReviewItem div.productReviewItemDesc {
            width: 80%;
            display: inline-block;
            color: #333333;
            height: 94px;
            margin: 5px 20px;
            float: left;
        }

        div.productReviewItem div.productReviewItemUserInfo {
            color: #404040;
            margin: 5px 20px;
            overflow: hidden;
            padding: 20px 0;
        }

        div.productReviewItemContent {

        }

        div.productReviewItemDate {
            margin: 15px 0px 0px 0px;
            color: #CCCCCC;
        }

        span.userInfoGrayPart {
            color: #999999;
        }

        div.productReviewDiv {
            display: none;
        }

        div.buyPageDiv {
            margin: 20px auto;
            max-width: 1013px;
        }

        div.buyDiv {
            margin: 20px auto;
            text-align: center;
        }

        div.buyPageDiv button {
            display: inline-block;
            margin: 0px 10px;
            width: 180px;
            height: 40px;
        }

        div.buyDiv button {
            display: inline-block;
            margin: 0px 10px;
            width: 180px;
            height: 40px;
        }

        button.buyButton {
            border: 1px solid #C40000;
            background-color: #FFEDED;
            text-align: center;
            line-height: 40px;
            font-size: 16px;

            color: #C40000;
            font-family: arial;
        }

        button.addCartButton {
            border: 1px solid #C40000;
            background-color: #C40000;
            text-align: center;
            line-height: 40px;
            font-size: 16px;

            color: white;
            font-family: arial;
        }

        button.addCartButton span.glyphicon {
            font-size: 12px;
            margin-right: 8px;
        }

        div.address {
            margin: 20px 5px;
            text-align: left;
        }

        div.addressTip, div.productListTip {
            color: #333333;
            font-size: 16px;
            font-weight: bold;
            text-align: left;
            margin-bottom: 30px;
        }

        table.addressTable {
            margin: 20px 20px;
            width: 600px;
        }

        table.addressTable td.firstColumn {
            width: 100px;
        }

        table.addressTable td {
            color: #333333;
            text-align: right;
            vertical-align: top;
            padding-right: 5px;
            text-align: left;
            height: 30px;
            font-size: 12px;
        }

        span.redStar {
            color: red;
            font-size: 8px;
        }

        table.addressTable td input {
            border: 1px solid #AFAFAF;
            width: 200px;
        }

        table.addressTable td textarea {
            border: 1px solid #AFAFAF;
            margin-bottom: 10px;
            width: 400px;
        }

        img.tmallbuy {
            width: 15px;
        }

        a.marketLink {
            color: black;
            font-size: 12px;
            font-family: ����;
            font-weight: normal;
        }

        a.marketLink:hover {
            color: black;
            font-size: 12px;
            text-decoration: underline;
            font-family: ����;
            font-weight: normal;
        }

        span.wangwangGif {
            display: inline-block;
            width: 25px;
            height: 25px;
            background-image: url(${APP_PATH}/img/site/wangwang.gif);
            background-repeat: no-repeat;
            background-color: transparent;
            background-attachment: scroll;
            background-position: -83px -0px;
            position: relative;
            top: 8px;
            left: 2px;
        }

        table.productListTable {
            width: 100%;
            border-collapse: separate;
        }

        table.productListTable th {
            color: #999999;
            font-family: ����;
            font-weight: normal;
            font-size: 12px;
            text-align: center;
            padding-bottom: 5px;
        }

        th.productListTableFirstColumn {
            text-align: left !important;
        }

        table.productListTable tr.rowborder td {
            background-color: #b2d1ff;
            border-right: 2px solid #fff;
            height: 3px;
        }

        img.orderItemImg {
            width: 50px;
            height: 50px;
            border: 1px solid #E9E9E9;
        }

        tr.orderItemTR td {
            padding: 10px 0px;
        }

        a.orderItemProductLink {
            color: #666666;
            display: block;
        }

        a.orderItemProductLink:hover {
            color: #666666;
            text-decoration: underline;
        }

        td.orderItemProductInfo {
            text-align: left;
        }

        td.orderItemProductInfo img {
            height: 16px;
        }

        span.orderItemProductPrice, span.orderItemProductNumber {
            color: #000000;
        }

        span.orderItemUnitSum {
            color: #CC0000;
            font-weight: bold;
        }

        tr.orderItemTR td {
            border-bottom: 1px solid #E5E5E5;
        }

        tbody.productListTableTbody td {
            text-align: center;
            font-size: 12px;
        }

        tbody.productListTableTbody td.orderItemFirstTD {
            text-align: left;
        }

        tbody.productListTableTbody td.orderItemProductInfo {
            text-align: left;
        }

        td.orderItemFirstTD, td.orderItemLastTD {
            border-bottom: 0px solid black !important;
        }

        label.orderItemDeliveryLabel {
            color: #666666;
            font-family: ����;
            font-size: 12px;
            font-weight: normal;
        }

        select.orderItemDeliverySelect {
            width: 100px;
            height: 23px;
        }

        div.orderItemSumDiv span {
            color: #999999;
        }

        div.orderItemSumDiv {
            padding: 20px;
            border-top: 2px solid #B4D0FF;
            background-color: #F2F6FF;
            height: 50px;
        }

        textarea.leaveMessageTextarea {
            border: 1px solid #FFAD35;
            width: 250px;
            height: 60px;
            resize: none;
        }

        span.leaveMessageText {
            display: inilne-block;
            margin-right: 10px;
            float: left;
        }

        span.leaveMessageTextareaSpan {
            display: inilne-block;
        }

        div.orderItemTotalSumDiv {
            margin: 40px;
            height: 40px;
        }

        div.orderItemTotalSumDiv span {
            color: #999999;
        }

        span.orderItemTotalSumSpan {
            color: #C40000 !important;
            font-size: 22px;
            font-weight: bold;
            border-bottom: 1px dotted #F2F6FF;
        }

        div.submitOrderDiv {
            height: 40px;
            margin: 20px 0px;
        }

        button.submitOrderButton {
            border: 1px solid #C40000;
            background-color: #C40000;
            text-align: center;
            line-height: 40px;
            font-size: 14px;
            font-weight: 700;
            color: white;
            float: right;
        }

        div.aliPayPageLogo {
            margin: 20px;
        }

        div.aliPayPageDiv {
            text-align: center;
            padding-bottom: 40px;
            max-width: 1013px;
            margin: 10px auto;
        }

        span.confirmMoneyText {
            color: #4D4D4D;
        }

        span.confirmMoney {
            display: block;
            color: #FF6600;
            font-weight: bold;
            font-size: 20px;
            margin: 10px;
        }

        img.aliPayImg {

        }

        button.confirmPay {
            background-color: #00AAEE;
            border: 1px solid #00AAEE;
            text-align: center;
            line-height: 31px;
            font-size: 14px;
            font-weight: 700;
            color: white;
            width: 107px;
            margin-top: 20px;
        }

        div.payedDiv {
            border: 1px solid #D4D4D4;
            max-width: 1013px;
            margin: 10px auto 20px auto;
        }

        div.payedTextDiv {
            height: 61px;
            background-color: #ECFFDC;
            padding: 17px 0px 0px 25px;
        }

        div.payedTextDiv span {
            font-weight: bold;
            font-size: 14px;
            margin-left: 10px;
        }

        div.payedAddressInfo {
            padding: 26px 35px;
        }

        div.payedAddressInfo li {
            background-image: url("${APP_PATH}/img/site/li_dot.png");
            background-repeat: no-repeat;
            background-color: transparent;
            background-attachment: scroll;
            background-position: 0px 13px;
            list-style-type: none;
            color: #333333;
            padding-left: 15px;
            padding-top: 5px;

        }

        span.payedInfoPrice {
            color: #B10000;
            font-weight: bold;
            font-size: 14px;
            font-family: arial;
        }

        a.payedCheckLink {
            color: #2D8CBA;
        }

        a.payedCheckLink:hover {
            color: #2D8CBA;
            text-decoration: underline;
        }

        div.paedCheckLinkDiv {
            margin-left: 38px;
        }

        div.payedSeperateLine {
            border-top: 1px dotted #D4D4D4;
            margin: 0px 31px;
        }

        div.warningDiv {
            margin: 23px 45px;
        }

        div.warningDiv {
            color: black;
        }

        div.cartDiv {
            max-width: 1013px;
            margin: 10px auto;
            color: black;
        }

        span.cartTitlePrice {
            color: #C40000;
            font-size: 14px;
            font-weight: bold;
            margin-left: 5px;
            margin-right: 3px;
        }

        div.cartTitle button {
            background-color: #AAAAAA;
            border: 1px solid #AAAAAA;
            color: white;
            width: 53px;
            height: 25px;
            border-radius: 2px;
        }

        table.cartProductTable {
            width: 100%;
            font-size: 12px;
        }

        table.cartProductTable th {
            font-weight: normal;
            color: #3C3C3C;
            padding: 20px 20px;
        }

        img.cartProductImg {
            padding: 1px;
            border: 1px solid #EEEEEE;
            width: 80px;
            height: 80px;
        }

        a.cartProductLink {
            color: #3C3C3C;
        }

        a.cartProductLink:hover {
            color: #C40000;
            text-decoration: underline;
        }

        div.cartProductLinkOutDiv {
            position: relative;
            height: 80px;
        }

        div.cartProductLinkInnerDiv {
            position: absolute;
            bottom: 0;
            height: 20px;
        }

        tr.cartProductItemTR td {
            padding: 20px 20px;
        }

        tr.cartProductItemTR {
            border: 1px solid #CCCCCC;
        }

        span.cartProductItemOringalPrice {
            text-decoration: line-through;
            color: #9C9C9C;
            display: block;
            font-weight: bold;
            font-size: 14px;
        }

        span.cartProductItemPromotionPrice {
            font-family: Arial;
            font-size: 14px;
            font-weight: bold;
            color: #C40000;
        }

        span.cartProductItemSmallSumPrice {
            font-family: Arial;
            font-size: 14px;
            font-weight: bold;
            color: #C40000;
        }

        div.cartProductChangeNumberDiv {
            border: solid 1px #E5E5E5;
            width: 80px;
        }

        div.cartProductChangeNumberDiv input {
            border: solid 1px #AAAAAA;
            width: 42px;
            display: inline-block;
        }

        div.cartProductChangeNumberDiv a {
            text-decoration: none;
        }

        div.cartProductChangeNumberDiv a {
            width: 14px;
            display: inline-block;
            text-align: center;
            color: black;
            text-decoration: none;
        }

        img.cartProductItemIfSelected, img.selectAllItem {
            cursor: pointer;
        }

        div.cartFoot {
            background-color: #E5E5E5;
            line-height: 50px;
            margin: 20px 0px;
            color: black;
            padding-left: 20px;
        }

        span.cartSumNumber {
            color: #C40000;
            font-weight: bold;
            font-size: 16px;
        }

        span.cartSumPrice {
            color: #C40000;
            font-weight: bold;
            font-size: 20px;
        }

        div.cartFoot button {
            background-color: #AAAAAA;
            border: 0px solid #AAAAAA;
            color: white;
            height: height%;
            width: 120px;
            height: 50px;
            font-size: 20px;
            text-align: center;

        }

        div.boughtDiv {
            max-width: 1013px;
            margin: 10px auto;
        }

        div.orderType div.selectedOrderType {
            border-bottom: 2px solid #C40000;
        }

        div.orderType div {
            border-bottom: 2px solid #E8E8E8;
            float: left;
        }

        table.orderListTitleTable {
            border: 1px solid #E8E8E8;
            width: 100%;
            margin: 20px 0px;
            background-color: #F5F5F5;
            text-align: center;
        }

        table.orderListTitleTable td {
            padding: 12px 0px;
        }

        div.orderType a {
            border-right: 1px solid #E8E8E8;
            float: left;
            font-size: 16px;
            font-weight: bold;
            color: black;
            margin-bottom: 10px;
            padding: 0px 20px;
            text-decoration: none;
        }

        div.orderType div.selectedOrderType a {
            color: #C40000;
        }

        div.orderType a:hover {
            color: #C40000;
            text-decoration: none;
        }

        div.orderTypeLastOne {
            overflow: hidden;
            float: none !important;
            border-bottom: 2px solid #E8E8E8;
        }

        a.noRightborder {
            border-right-width: 0px !important;
        }

        table.orderListItemTable {
            border: 2px solid #ECECEC;
            width: 100%;
            margin: 20px 0px;
        }

        table.orderListItemTable:hover {
            border: 2px solid #aaa !important;
        }

        tr.orderListItemFirstTR {
            background-color: #F1F1F1;
            font-size: 12px;
        }

        table.orderListItemTable td {
            padding: 8px 10px;
        }

        div.orderItemWangWangGif {
            display: inline-block;
            width: 67px;
            height: 22px;
            background-image: url(${APP_PATH}/img/site/wangwang.gif);
            background-repeat: no-repeat;
            background-color: transparent;
            background-attachment: scroll;
            background-position: -0px -0px;
            position: relative;
            top: 0px;
            left: 2px;
        }

        span.orderListItemDelete {
            display: inline-block;
            margin: 0px 10px;
            color: #999999;
            font-size: 16px;
        }

        div.orderListItemProductLinkOutDiv {
            position: relative;
            height: 80px;
            font-size: 12px;
        }

        div.orderListItemProductLinkInnerDiv {
            position: absolute;
            bottom: 0px;
        }

        div.orderListItemProductOriginalPrice {
            color: #999999;
            font-size: 14px;
        }

        div.orderListItemProductPrice {
            color: #3C3C3C;
            font-size: 14px;
        }

        div.orderListItemProductRealPrice {
            color: #3C3C3C;
            font-size: 14px;
            font-weight: bold;
        }

        div.orderListItemPriceWithTransport {
            color: #6C6C6C;
            font-size: 12px;
        }

        td.orderListItemProductRealPriceTD {
            text-align: center;
        }

        button.orderListItemConfirm {
            background-color: #66B6FF;
            border-radius: 2px;
            color: white;
            font-size: 12px;
            font-weight: bold;
            border-width: 0px;
            padding: 6px 12px;
        }

        button.orderListItemConfirm:hover {
            background-color: #118ADB;
        }

        button.orderListItemReview {
            border: 1px solid #DCDCDC;
            background-color: #fff;
            border-radius: 2px;
            color: #3C3C3C;
            font-size: 12px;
            font-weight: bold;
            padding: 6px 12px;
        }

        button.orderListItemReview:hover {
            border-color: #C40000;
            color: #C40000;
        }

        td.orderItemDeleteTD {
            text-align: right;
        }

        td.orderListItemButtonTD {
            text-align: center;
        }

        span.orderListItemNumber {
            color: #3C3C3C;
        }

        td.orderListItemNumberTD {
            text-align: center;
        }

        div.confirmPayPageDiv {
            max-width: 1013px;
            margin: 10px auto;
        }

        div.confirmPayImageDiv {
            margin: 40px auto 80px auto;
            width: 900px;
            position: relative;
        }

        div.confirmPayImageDiv div {
            color: #999999;
        }

        div.confirmPayTime1 {
            position: absolute;
            top: 100px;
            left: -20px;
        }

        div.confirmPayTime2 {
            position: absolute;
            top: 100px;
            left: 190px;
        }

        div.confirmPayTime3 {
            position: absolute;
            top: 100px;
            left: 400px;
        }

        div.confirmPayOrderInfoText {
            margin: 10px 10px 0px 10px;
            font-size: 16px;
            font-weight: bold;
            color: black;
            padding-bottom: 15px;
            border-bottom: 1px solid #ADC8E6;
        }

        div.confirmPayOrderItemDiv {
            margin: 0px 20px;
        }

        div.confirmPayOrderItemText {
            margin: 20px 10px;
            font-size: 14px;
            font-weight: bold;
            color: black;
        }

        table.confirmPayOrderItemTable thead {
            background-color: #E8F2FF;
            height: 33px;
        }

        table.confirmPayOrderItemTable tr {
            border: 1px solid #DDDDDD;
        }

        table.confirmPayOrderItemTable {
            border: 1px solid #DDDDDD;
            width: 100%;
        }

        span.conformPayProductPrice {
            font-size: 18px;
            font-weight: bold;
            color: #666666;
        }

        table.confirmPayOrderItemTable th, table.confirmPayOrderItemTable td {
            text-align: center;
        }

        table.confirmPayOrderItemTable td {
            padding: 20px;
        }

        td.confirmPayOrderItemProductLink {
            text-align: left !important;
        }

        div.confirmPayOrderItemText {
            color: black;
            font-weight: normal;
        }

        span.confirmPayOrderItemSumPrice {
            color: #C40000;
        }

        table.confirmPayOrderDetailTable {
            width: 100%;
            border-top: 1px solid #DDDDDD;
        }

        table.confirmPayOrderDetailTable td {
            padding: 8px;
            color: black;
            font-size: 14px;
        }

        div.confirmPayOrderDetailDiv {
            margin: 40px;
        }

        span.confirmPayOrderDetailWangWangGif {
            display: inline-block;
            width: 67px;
            height: 22px;
            background-image: url(${APP_PATH}/img/site/wangwang.gif);
            background-repeat: no-repeat;
            background-color: transparent;
            background-attachment: scroll;
            background-position: -0px -0px;
            position: relative;
            top: 0px;
            left: 2px;
        }

        div.confirmPayButtonDiv {
            border: 1px solid #F58B0F;
            margin: 20px;
        }

        div.confirmPayWarning {
            margin: 20px 80px;
            font-size: 18px;
            color: red;
            font-weight: bold;
        }

        button.confirmPayButton:hover {
            background-color: #F6AE30;
        }

        button.confirmPayButton {
            margin: 20px 80px;
            width: 67px;
            height: 30px;
            border: 1px solid #E67C00;
            background-color: #F4A21D;
            border-radius: 4px;
            color: white;
        }

        div.orderFinishDiv {
            border: 1px solid #E5E5E5;
            padding: 40px;
            max-width: 1013px;
            margin: 10px auto;
        }

        div.orderFinishDiv span {
            font-size: 14px;
            color: black;
            font-weight: bold;
            margin-left: 20px;
            padding-top: 20px;
        }

        div.reviewDiv {
            max-width: 1013px;
            margin: 10px auto;
        }

        div.reviewProductInfoRightDiv {
            overflow: hidden;
            border-top: 1px solid #E7E7E7;
            padding: 30px 20px;
        }

        div.reviewProductInfoImg {
            border: 1px solid #E7E7E7;
            width: 464px;
            text-align: center;
            float: left;
        }

        div.reviewProductInfoRightText {
            color: black;
            font-size: 16px;
            font-weight: bold;
        }

        span.reviewProductInfoTablePrice {
            color: #C40000;
            font-size: 20px;
            font-weight: bold;
        }

        span.reviewProductInfoTableSellNumber {
            color: #C40000;
            font-size: 14px;
            font-weight: bold;
        }

        table.reviewProductInfoTable {
            margin: 20px 10px;
        }

        table.reviewProductInfoTable td {
            padding-bottom: 5px;
            color: #999999;
        }

        div.reviewProductInfoRightBelowDiv {
            border: 1px solid #F6F5F3;
            background-color: #FDFBFA;
            height: 166px;
            padding: 16px 81px;
        }

        span.reviewProductInfoRightBelowImg {
            background-color: white;
            border: 1px solid #E1E1E1;
            display: inline-block;
            width: 23px;
            height: 42px;
            background-image: url(${APP_PATH}/img/site/reviewLight.png);
            background-repeat: no-repeat;
            padding: 0px;
        }

        span.reviewProductInfoRightBelowText {
            border: 1px solid #EFEFEF;

            display: inline-block;
            width: 200px;
            height: 42px;
            padding: 4px;
            position: relative;
            left: -4px;
            top: -7px;
            color: #666666;
        }

        div.reviewStasticsLeft {
            width: 180px;
            float: left;
        }

        div.reviewStasticsLeftTop {
            background-color: #C40000;
            height: 6px;
        }

        div.reviewStasticsLeftContent {
            line-height: 29px;
            border-left: 1px solid #D5D4D4;
            border-right: 1px solid #D5D4D4;
            background-color: #F6F5F1;
            text-align: center;
            font-size: 14px;
            color: #363535;
            font-weight: bold;
        }

        span.reviewStasticsNumber {
            color: #284CA5;
        }

        div.reviewStasticsLeftFoot {
            height: 6px;
            border-left: 1px solid #D5D4D4;
            border-bottom: 1px solid #D5D4D4;
            background-color: #F6F5F1;
        }

        div.reviewStasticsRight {
            overflow: hidden;
        }

        div.reviewStasticsRightEmpty {
            height: 35px;
        }

        div.reviewStasticsFoot {
            background-color: #F6F5F1;
            border: 1px solid #D5D4D4;
            border-left-width: 0px;
            height: 6px;
        }

        div.makeReviewDiv {
            border: 1px solid #D1CCC8;
            margin: 20px 0px;
            background-color: #EFEFEF;
        }

        div.makeReviewText {
            font-size: 16px;
            color: #333333;
            font-weight: bold;
            margin: 20px 40px;
        }

        table.makeReviewTable {
            margin: 20px 40px;
        }

        table.makeReviewTable td {
            border: 1px solid #E7E7E7;
            padding: 10px;
            background-color: white;
        }

        table.makeReviewTable textarea {
            border-width: 0px;
            resize: none;
            width: 420px;
            height: 120px;
        }

        td.makeReviewTableFirstTD {
            background-color: #F6F6F6;
        }

        div.makeReviewButtonDiv {
            background-color: white;
            text-align: center;
            padding: 15px;
        }

        div.makeReviewButtonDiv button {
            width: 72px;
            height: 26px;
            border-radius: 2px;
            background-color: #C40000;
            color: white;
            border-width: 0px;
            font-weight: bold;
        }

        div.registerDiv {
            margin: 10px 20px;
            text-align: center;
        }

        table.registerTable {
            color: #3C3C3C;
            font-size: 16px;
            table-layout: fixed;
            margin-top: 50px;
        }

        table.registerTable td {

            padding: 10px 30px;
        }

        td.registerTableLeftTD {
            width: 300px;
            text-align: right;
        }

        td.registerTableRightTD {
            width: 300px;
            text-align: left;
        }

        td.registerTip {
            font-weight: bold;
        }

        table.registerTable input {
            border: 1px solid #DEDEDE;
            width: 213px;
            height: 36px;
            font-size: 14px;
        }

        td.registerButtonTD {
            text-align: center;
        }

        table.registerTable button {
            width: 170px;
            height: 36px;
            border-radius: 2px;
            color: white;
            background-color: #C40000;
            border-width: 0px;
        }

        table.registerTable {

        }

        div.registerSuccessDiv {
            margin: 10px 20px;
            background-color: #F3FDF6;
            border: 1px solid #DEF3E6;
            font-size: 16px;
            color: #3C3C3C;
            padding: 20px 130px;
        }

        div.categoryPageDiv {
            max-width: 1013px;
            margin: 10px auto;
        }

        div.searchResultDiv {
            max-width: 1013px;
            margin: 10px auto;
            min-height: 300px;
        }

        div.productPageDiv {
            max-width: 1013px;
            margin: 10px auto;
        }

        div.categoryPictureInProductPageDiv {
            width: 100%;
            margin: 10px auto;
            text-align: center;
        }

        div.reviewStasticsDiv {
            margin-top: 20px;
        }

        div.registerErrorMessageDiv {
            width: 600px;
            margin: 0px auto;
            height: 50px;
            visibility: hidden;
        }

        td.orderItemProductInfoPartTD {
            border-bottom: solid 1px #ECECEC;
        }

        td.orderItemOrderInfoPartTD {
            border: solid 1px #ECECEC;
        }

        div.reviewDate {
            width: 100px;
        }

        div.reviewDivlistReviewsEach div {
            display: inline-block;
        }

        div.reviewDate {
            color: #CCCCDD;
        }

        div.reviewContent {
            color: #333333;
            width: 698px;
        }

        div.reviewUserInfo {
            color: #333333;
        }

        div.reviewDivlistReviewsEach {
            padding: 20px;
            border-bottom: 1px solid #ECECEC;
        }

        span.reviewUserInfoAnonymous {
            color: #CCCCDD;
            margin-left: 5px;
        }

        a.productLink {
            height: 34px;
        }

        img.carouselImage {
            height: 510px !important;
        }

        div.noMatch {
            font-size: 20px;
            width: 200px;
            margin: 100px auto;
            color: #888;
        }

        table.cartProductTable th.operation {
            width: 80px;
        }

        table.cartProductTable th.selectAndImage {
            width: 150px;
        }

        table td {
            font-size: 12px;
        }

    </style>
    <script>
        function formatMoney(num) {
            num = num.toString().replace(/\$|\,/g, '');
            if (isNaN(num))
                num = "0";
            sign = (num == (num = Math.abs(num)));
            num = Math.floor(num * 100 + 0.50000000001);
            cents = num % 100;
            num = Math.floor(num / 100).toString();
            if (cents < 10)
                cents = "0" + cents;
            for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
                num = num.substring(0, num.length - (4 * i + 3)) + ',' +
                    num.substring(num.length - (4 * i + 3));
            return (((sign) ? '' : '-') + num + '.' + cents);
        }

        function checkEmpty(id, name) {
            var value = $("#" + id).val();
            if (value.length == 0) {

                $("#" + id)[0].focus();
                return false;
            }
            return true;
        }

        $(function () {

            $("a.productDetailTopReviewLink").click(function () {
                $("div.productReviewDiv").show();
                $("div.productDetailDiv").hide();
            });
            $("a.productReviewTopPartSelectedLink").click(function () {
                $("div.productReviewDiv").hide();
                $("div.productDetailDiv").show();
            });

            $("span.leaveMessageTextareaSpan").hide();
            $("img.leaveMessageImg").click(function () {

                $(this).hide();
                $("span.leaveMessageTextareaSpan").show();
                $("div.orderItemSumDiv").css("height", "100px");
            });

            $("div#footer a[href$=#nowhere]").click(function () {
                alert("模仿天猫的连接，并没有跳转到实际的页面");
            });

            $("a.wangwanglink").click(function () {
                alert("模仿旺旺的图标，并不会打开旺旺");
            });
            $("a.notImplementLink").click(function () {
                alert("这个功能没做，蛤蛤~");
            });

        });

    </script>
</head>

<body>

<%--<nav class="top">
    <a href="${APP_PATH}/">
        <span style="color:#C40000;margin:0px" class=" glyphicon glyphicon glyphicon-home redColor"></span>
        天猫首页
    </a>

    <span>喵，欢迎来天猫</span>

    <a href="#nowhere">请登录</a>
    <a href="#nowhere">免费注册</a>

    <span class="pull-right">
			<a href="#nowhere">我的订单</a>
			<a href="#nowhere">
			<span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>
			购物车<strong>0</strong>件</a>
		</span>

</nav>--%>
<jsp:include page="head.jsp"/>

<a href="${APP_PATH}/">
    <img id="logo" src="${APP_PATH}/img/site/logo.gif" class="logo">
</a>

<form method="post">
    <div class="searchDiv">
        <input name="keyword" type="text" placeholder="时尚男鞋  太阳镜 ">
        <button type="button" class="searchButton">搜索</button>
        <div class="searchBelow">
				
						<span>
							<a href="#nowhere">
								平衡车
							</a>
											
								<span>|</span>				
							
						</span>

            <span>
							<a href="#nowhere">
								扫地机器人 
							</a>
											
								<span>|</span>				
							
						</span>

            <span>
							<a href="#nowhere">
								原汁机
							</a>
											
								<span>|</span>				
							
						</span>

            <span>
							<a href="#nowhere">
								冰箱
							</a>
							
						</span>

        </div>
    </div>
</form>

<title>模仿天猫官网-男士手拿包 </title>
<div id="category">
    <div class="categoryPageDiv">
        <img id="catImg" src="">

        <script>
            $(function () {
                $("input.sortBarPrice").keyup(function () {
                    var num = $(this).val();
                    if (num.length == 0) {
                        $("div.productUnit").show();
                        return;
                    }

                    num = parseInt(num);
                    if (isNaN(num))
                        num = 1;
                    if (num <= 0)
                        num = 1;
                    $(this).val(num);

                    var begin = $("input.beginPrice").val();
                    var end = $("input.endPrice").val();
                    if (!isNaN(begin) && !isNaN(end)) {
                        console.log(begin);
                        console.log(end);
                        $("div.productUnit").hide();
                        $("div.productUnit").each(function () {
                            var price = $(this).attr("price");
                            price = Number(price);

                            if (price <= end && price >= begin)
                                $(this).show();
                        });
                    }

                });
            });
        </script>
        <div class="categorySortBar">

            <table class="categorySortBarTable categorySortTable">
                <tr>
                    <td class="grayColumn"><a href="#nowhere">综合<span class="glyphicon glyphicon-arrow-down"></span></a>
                    </td>
                    <td><a href="#nowhere">人气<span class="glyphicon glyphicon-arrow-down"></span></a></td>
                    <td><a href="#nowhere">新品<span class="glyphicon glyphicon-arrow-down"></span></a></td>
                    <td><a href="#nowhere">销量<span class="glyphicon glyphicon-arrow-down"></span></a></td>
                    <td><a href="#nowhere">价格<span class="glyphicon glyphicon-resize-vertical"></span></a></td>
                </tr>
            </table>

            <table class="categorySortBarTable">
                <tr>
                    <td><input class="sortBarPrice beginPrice" type="text" placeholder="请输入"></td>
                    <td class="grayColumn priceMiddleColumn">-</td>
                    <td><input class="sortBarPrice endPrice" type="text" placeholder="请输入"></td>
                </tr>
            </table>

        </div>

        <script>
            $(function () {
                loadProducts();
            });

            function loadProducts() {
                $.ajax({
                    type: "POST",
                    url: "${APP_PATH}/getProducts",
                    data: "cid=${cid}",
                    success: function (result) {
                        var products = result.data;
                        var html="";
                        $.each(products,function (i,product) {
                            html+='<div class="productUnit" price="'+product.orignalPrice+'">';
                            html+='	<div class="productUnitFrame">';
                            html+='		<a href="${APP_PATH}/foreproduct?pid='+product.id+'">';
                            html+='			<img class="productImage" src="${APP_PATH}/img/productSingle_middle/'+product.id+'.jpg">';
                            html+='		</a>';
                            html+='		<span class="productPrice">¥'+product.orignalPrice+'</span>';
                            html+='		<a class="productLink" href="${APP_PATH}/foreproduct?pid='+product.id+'">';
                            html+='			'+product.name+'';
                            html+='		</a>';
                            html+='		<a class="tmallLink" href="${APP_PATH}/foreproduct?pid='+product.id+'">天猫专卖</a>';
                            html+='		<div class="show1 productInfo">';
                            html+='			<span class="monthDeal ">月成交 <span class="productDealNumber">16笔</span></span>';
                            html+='			<span class="productReview">评价<span class="productReviewNumber">14</span></span>';
                            html+='			<span class="wangwang">';
                            html+='				<a class="wangwanglink" href="#nowhere">';
                            html+='					<img src="${APP_PATH}/img/site/wangwang.png">';
                            html+='				</a>';
                            html+='		</span>';
                            html+='		</div>';
                            html+='	</div>';
                            html+='</div>';
                        });
                        html+='<div style="clear:both"></div>';
                        $(".categoryProducts").html(html);
                        $("#catImg").attr("src",'${APP_PATH}/img/category/${cid}.jpg');
                    }
                });
            }

        </script>
        <div class="categoryProducts"></div>
    </div>

</div>

<div class="modal " id="loginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog loginDivInProductPageModalDiv">
        <div class="modal-content">
            <div class="loginDivInProductPage">
                <div class="loginErrorMessageDiv">
                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                        <span class="errorMessage"></span>
                    </div>
                </div>

                <div class="login_acount_text">账户登录</div>
                <div class="loginInput ">
							<span class="loginInputIcon ">
								<span class=" glyphicon glyphicon-user"></span>
							</span>
                    <input id="name" name="name" placeholder="手机/会员名/邮箱" type="text">
                </div>

                <div class="loginInput ">
							<span class="loginInputIcon ">
								<span class=" glyphicon glyphicon-lock"></span>
							</span>
                    <input id="password" name="password" type="password" placeholder="密码" type="text">
                </div>
                <span class="text-danger">不要输入真实的天猫账号密码</span><br><br>
                <div>
                    <a href="#nowhere">忘记登录密码</a>
                    <a href="#nowhere" class="pull-right">免费注册</a>
                </div>
                <div style="margin-top:20px">
                    <button class="btn btn-block redButton loginSubmitButton" type="button">登录</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog">
    <div class="modal-dialog deleteConfirmModalDiv">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">确认删除？</h4>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                <button class="btn btn-primary deleteConfirmButton" id="submit" type="button">确认</button>
            </div>
        </div>
    </div>
</div>
</div>

<div id="footer" class="footer" style="display: block;">

    <div id="footer_ensure" class="footer_ensure">
        <a href="#nowhere">
            <img src="${APP_PATH}/img/site/ensure.png">
        </a>
    </div>

    <div id="footer_desc" class="footer_desc">
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

    <img id="cateye" class="cateye" src="${APP_PATH}/img/site/cateye.png">

    <div id="copyright" class="copyright">
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
</body>
</html>

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
