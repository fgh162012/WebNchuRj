<%@ taglib uri="/WEB-INF/func.tld" prefix="func" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: watermelon
  Date: 2019/1/15
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:forEach items="${results}" var="result">
    <c:forEach items="${result}" var="item" end="${fn:length(result)-2}">
            ${func:changeRelevance(item)}
    </c:forEach>
    置信度:${result[fn:length(result)-1]}<br>
</c:forEach>
</body>
</html>
