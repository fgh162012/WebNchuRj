<%--
  Created by IntelliJ IDEA.
  User: zhouxuwen
  Date: 2019/1/14
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>学生就业去向预测分析</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/Administration.css"/>
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body style="background-color: #F8F8F8;">
<div class="row-fluid">
    <div class="container-fluid">
        <div class="logo"><img src="img/main/software.png"/></div>
        <div class="exit">
            <span>欢迎访问该系统！</span>
            <div class="exit-btn">
                <a href="/index">退出登录</a>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <div class="administ">
                <img src="img/main/guanliyuan.png"/>
                <div class="name">
                    <span style="font-size: 24px;font-weight: bold; margin-left: 4px;">姓名</span><br />
                    <span style="font-size: 12px;font-weight: normal;">系统管理员</span>
                </div>

            </div>
            <ul id="main-nav" class="nav nav-stacked">
                <%--<c:forEach items="${adminMenus}" var="menu">--%>
                    <%--<li>--%>
                        <%--<a href="#${menu.firstMenu.firstMenuId}" data-toggle="collapse" class="nav-header">--%>
                                <%--${menu.firstMenu.firstMenuName}--%>
                            <%--<span class="pull-right glyphicon glyphicon-chevron-down"></span>--%>
                        <%--</a>--%>
                        <%--<c:if test="${not empty menu.list}">--%>
                            <%--<ul id="${menu.firstMenu.firstMenuId}" class="nav nav-list collapse secondmenu" style="height: 0px;">--%>
                                <%--<c:forEach items="${menu.list}" var="twoMenu">--%>
                                    <%--<li><a href="/manage/${twoMenu.secondMenuUrl}" target="iframe_a">${twoMenu.secondMenuName}</a></li>--%>
                                <%--</c:forEach>--%>
                            <%--</ul>--%>
                        <%--</c:if>--%>
                    <%--</li>--%>
                <%--</c:forEach>--%>
                <li>
                    <a href="/leadingexcel" target="iframe_a" class="nav-header" id="#drxx">
                        导入信息
                    </a>
                </li>
                <li>
                    <a href="#e" data-toggle="collapse" class="nav-header" >
                        数据分析
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                        <ul id="e" class="nav nav-list collapse secondmenu" style="height: 0px;">
                            <li><a href="/dataChart" target="iframe_a" id="#xscjfx">学生成绩分析</a></li>
                            <li><a href="/dataChartb" target="iframe_a" id="#jyqxfx">就业去向分析</a></li>
                        </ul>

                </li>
                <li>
                    <a href="/prediction"target="iframe_a" class="nav-header" id="#jyyc">
                        就业预测
                    </a>
                </li>
                </ul>
                <%--<li>
                    <a href="#e" data-toggle="collapse" class="nav-header">
                        公告管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="e" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="ggglA.html" target="iframe_a">公告列表</a></li>
                        <li><a href="ggglB.html" target="iframe_a">发布公告</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#f" data-toggle="collapse" class="nav-header">
                        新闻管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="f" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="#" target="iframe_a">新闻列表</a></li>
                        <li><a href="#" target="iframe_a">发布新闻</a></li>
                        <li><a href="#" target="iframe_a">删除新闻</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#g" data-toggle="collapse" class="nav-header">
                        文件管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="g" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="#" target="iframe_a">文件列表</a></li>
                        <li><a href="#" target="iframe_a">上传文件</a></li>
                        <li><a href="#" target="iframe_a">删除文件</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#h" data-toggle="collapse" class="nav-header">
                        建议信箱
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="h" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="jyxx.html" target="iframe_a">未读邮件</a></li>
                        <li><a href="#" target="iframe_a">公开邮件</a></li>
                        <li><a href="#" target="iframe_a">私密邮件</a></li>
                    </ul>
                </li>
            </ul>--%>

        </div>
        <div class="col-md-10" style="margin-top: 30px;padding: 0px 50px 0px 30px;">
            <div class="nr-content">
                <iframe id="iframe" src="/leadingexcel" width="100%" height="70%" onload="this.height=iframe_a.document.body.scrollHeight" name="iframe_a" scrolling="no" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>
</body>
</html>
