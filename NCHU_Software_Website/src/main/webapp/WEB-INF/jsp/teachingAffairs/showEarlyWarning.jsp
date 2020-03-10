<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 曾溱泷
  Date: 2019/1/12
  Time: 21:14
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学分预警和学位预警</title>
</head>
<body>
    <c:forEach items="${students}" var="item">
          姓  名：${item.name}&nbsp;&nbsp;
        电话号码：${item.phone}&nbsp;&nbsp;
        家庭号码：${item.familyPhone}&nbsp;&nbsp;
        所挂科目：<c:forEach items="${item.courses}" var="index">
            ${index}
    </c:forEach><br>
    </c:forEach>
</body>
</html>
