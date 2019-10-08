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

<%@include file="header.jsp"%>
<div class="langdiv">
    <form method="post" action="main">
        <div class="form-group">
            <label for="language"><fmt:message key="language"/></label>
            <select class="form-control" id="language" name="language">
                <option value="en_GB" ${cookie.language.value=='en_GB'?'selected':pageContext.response.locale=='en_GB'?'selected':''}>ANGIELSKI</option>
                <option value="pl_PL" ${cookie.language.value=='pl_PL'?'selected':pageContext.response.locale=='pl_PL'?'selected':''}>POLSKI</option>
                <option value="de_DE" ${cookie.language.value=='de_DE'?'selected':pageContext.response.locale=='de_DE'?'selected':''}>NIEMIECKI</option>
            </select>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-outline-primary" value="Wybierz język">
        </div>
    </form>
</div>
<div class="downfooter"></div>
<script src="webjars/jquery/3.3.1/jquery.min.js"></script>
<script src="webjars/popper.js/1.14.6/dist/umd/popper.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
