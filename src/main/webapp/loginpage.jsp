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
<%@include file="header.jsp" %>
<fmt:setLocale value="${empty cookie.language?pageContext.response.locale:cookie.language.value}"/>
<fmt:setBundle basename="messages"/>
<div class="title">
    <fmt:message key='title' var="titleString"/>
    <c:forTokens items="${titleString}" delims=" " var="str">
        <c:choose>
            <c:when test='${fn:startsWith(str, "T")}'>
                <b>
                    <c:out value="${str}"/>
                </b>
            </c:when>
            <c:otherwise>
                <c:out value="${str}"/>
            </c:otherwise>
        </c:choose>
    </c:forTokens>
</div>
<div class="editText">
    <h4 class="divinfo">
        <c:if test="${sessionScope.userregistered =='success'}">
        Rejestracja przebiegła pomyślnie, możesz się zalogować!
    </h4>
    </c:if>
</div>
<div class="editText">
    <h4 class="diverror">
        <c:if test="${sessionScope.userNotFound !=null}">
        Błędny adres email lub hasło. Spróbuj ponownie!
    </h4>
    </c:if>
</div>

<div class="editText">
    <h1><fmt:message key="login"/></h1>
</div>


<div class="formedit" style="width: 300px">
    <form method="post" action="login">
        <div class="form-group">
            <label for="login">Adres email:</label>
            <input type="email" class="form-control" id="login" name="login" placeholder="email:" autofocus = "autofocus">
        </div>
        <div class="form-group">
            <label for="password">Hasło:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="hasło:">
        </div>
        <div class="buttons">
            <div class="buttonrow">
                <button type="submit" class="btn btn-success">Zaloguj</button>
            </div>
            <div class="buttonrow">
                <button type="button" class="btn btn-primary"
                        onclick="window.location.href='${pageContext.request.contextPath}/main'">Zrezygnuj
                </button>
            </div>
        </div>
        <div class="clear"></div>
    </form>
</div>

<div class="downfooter"></div>
<script src="webjars/jquery/3.3.1/jquery.min.js"></script>
<script src="webjars/popper.js/1.14.6/dist/umd/popper.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
