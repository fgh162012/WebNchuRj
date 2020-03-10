<%--
  Created by IntelliJ IDEA.
  User: Taodada
  Date: 2019/1/5
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>成功导入的数据</title>
</head>
<!-- bootstrap链接 -->
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>
<div align="center"><h2>成功导入的数据</h2></div>
<c:if test="${ not empty achievements}">
    <table class="table table-striped">
        <tr>
            <th>学号</th>
            <th>实验成绩</th>
            <th>平时成绩</th>
            <th>期中成绩</th>
            <th>期末成绩</th>
            <th>总成绩</th>
            <th>标志</th>
        </tr>
        <c:forEach items="${achievements}" var="achievement">
            <tr>
                <td>${achievement.stuNo}</td>
                <td>${achievement.experimentalResults}</td>
                <td>${achievement.normalResults}</td>
                <td>${achievement.midtermResults}</td>
                <td>${achievement.finalResults}</td>
                <td>${achievement.totalResults}</td>
                <td>${achievement.flag}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${not empty courseList}">
    <table class="table table-striped">
        <tr>
            <th>课程编号</th>
            <th>课程类型编号</th>
            <th>课程名称</th>
            <th>总学时</th>
            <th>理论学时</th>
            <th>实验学时</th>
            <th>学分</th>
            <th>备注</th>
        </tr>
        <c:forEach items="${courseList}" var="courselist">
            <tr>
                <td>${courselist.courseNo}</td>
                <td>${courselist.courseTypeNo}</td>
                <td>${courselist.courseName}</td>
                <td>${courselist.totalHour}</td>
                <td>${courselist.theoryHour}</td>
                <td>${courselist.experimentHour}</td>
                <td>${courselist.credit}</td>
                <td>${courselist.memo}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${not empty stuDirectList}">
    <table class="table table-striped">
        <tr>
            <th>学号</th>
            <th>就业去向id</th>
            <th>就业去向</th>
        </tr>
        <c:forEach items="${stuDirectList}" var="studirectlist">
            <tr>
                <td>${studirectlist.stuNo}</td>
                <td>${studirectlist.directId}</td>
                <td>${studirectlist.direction}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

</body>
</html>
