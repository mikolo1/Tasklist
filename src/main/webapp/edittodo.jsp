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
    <h1><fmt:message key="edit"/></h1>
</div>


<div class="formedit">
    <form method="get" action="todo">
        <div class="form-group">
            <input type="hidden" value="${requestScope.task.id}" name="id">
            <label for="taskdescription">Opis zadania:</label>
            <textarea class="form-control" id="taskdescription" name="editdescription" autofocus = "autofocus"
                      rows="2">${requestScope.task.description}</textarea>
        </div>
        <div class="form-group">
            <label for="finishDate">Termin wykonania:</label>
            <input type="datetime-local" class="form-control" id="finishDate" name="editDate"
                   value="${requestScope.task.deadLine}">
        </div>
        <div class="form-group">
            <label for="choosePriority">Priorytet:</label>
            <select class="form-control" id="choosePriority" name="editPriority">
                <option value="1" ${requestScope.task.priority == '1'?'selected':''}>Priorytet 1 (najwyższy)</option>
                <option value="2" ${requestScope.task.priority == '2'?'selected':''}>Priorytet 2</option>
                <option value="3" ${requestScope.task.priority == '3'?'selected':''}>Priorytet 3 (średni)</option>
                <option value="4" ${requestScope.task.priority == '4'?'selected':''}>Priorytet 4</option>
                <option value="5" ${requestScope.task.priority == '5'?'selected':''}>Priorytet 5 (najniższy)</option>
            </select>
        </div>
        <div class="buttons">
            <div class="buttonrow">
                <button type="submit" class="btn btn-success">Zmień</button>
            </div>
            <div class="buttonrow">
                <button type="button" class="btn btn-primary"
                        onclick="window.location.href='${pageContext.request.contextPath}/todo'">Zrezygnuj
                </button>
            </div>
        </div>
    </form>
</div>

<div class="downfooter"></div>
<script src="webjars/jquery/3.3.1/jquery.min.js"></script>
<script src="webjars/popper.js/1.14.6/dist/umd/popper.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
