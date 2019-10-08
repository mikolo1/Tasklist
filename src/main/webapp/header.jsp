<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>ToDo List</title>
    <link rel="stylesheet" href="webjars/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<fmt:setLocale value="${empty cookie.language?pageContext.response.locale:cookie.language.value}"/>
<fmt:setBundle basename="messages"/>

<table width="100%" border="0" style="height: 50px; margin-bottom: 15px" bgcolor="#99ff99">
    <tr>
        <td align="center" width="12%">
            <a href="main">Strona Główna</a>
        </td>
        <td align="center" width="12%">
            <c:if test="${sessionScope.user != null}">
                <a href="todo">Zadania</a>
            </c:if>
        </td>
        <td width="52%" align="center">
            <span style="font-size: 20px"><b>Witaj ${sessionScope.user.name} w ToDo List</b></span>
        </td>
        <td width="12%" align="center">
            <c:if test="${sessionScope.user == null}">
                <a href="register">Rejestracja</a>
            </c:if>
        </td>
        <td width="12%" align="center">
            <c:choose>
                <c:when test="${sessionScope.user == null}">
                    <a href="login">Zaloguj</a>
                </c:when>
                <c:otherwise>
                    <a href="main?logout">Wyloguj</a>
                </c:otherwise>
            </c:choose>
        </td>

    </tr>
</table>

<div class="downfooter"></div>
<script src="webjars/jquery/3.3.1/jquery.min.js"></script>
<script src="webjars/popper.js/1.14.6/dist/umd/popper.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
