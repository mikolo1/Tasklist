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
<%@include file="header.jsp"%>
<%--<c:set var="langvar" value="${pageContext.response.locale}"/>--%>
<%--<c:if test="${cookie.containsKey('language')}">--%>
<%--    <c:set var="langvar" value="${cookie.language.value}"/>--%>
<%--</c:if>--%>

<%--<%--%>
<%--    Cookie[]cookies = request.getCookies();--%>
<%--    String lang = "";--%>
<%--    if (cookies != null) {--%>
<%--        for (Cookie c : cookies) {--%>
<%--            if (c.getName().equals("language")) {--%>
<%--                lang = c.getValue();--%>
<%--            }--%>
<%--        }--%>
<%--    }else {--%>
<%--        lang=response.getLocale().toLanguageTag();--%>
<%--    }--%>
<%--    request.setAttribute("lang", lang);--%>
<%--%>--%>
<%--<fmt:setLocale value="${langvar}"/>--%>
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
<div class="left">
<%--    <div class="formdiv">--%>
<%--        <form method="post" action="todo">--%>
<%--            <div class="form-group">--%>
<%--                <label for="language"><fmt:message key="language"/></label>--%>
<%--                <select class="form-control" id="language" name="language">--%>
<%--                    <option value="en_GB" ${cookie.language.value=='en_GB'?'selected':pageContext.response.locale=='en_GB'?'selected':''}>ANGIELSKI</option>--%>
<%--                    <option value="pl_PL" ${cookie.language.value=='pl_PL'?'selected':pageContext.response.locale=='pl_PL'?'selected':''}>POLSKI</option>--%>
<%--                    <option value="de_DE" ${cookie.language.value=='de_DE'?'selected':pageContext.response.locale=='de_DE'?'selected':''}>NIEMIECKI</option>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <input type="submit" class="btn btn-outline-primary" value="Wybierz język">--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </div>--%>
    <div class="formdiv">
        <form method="post" action="todo">
            <div class="form-group">
                <label for="taskdescription">Opis zadania:</label>
                <textarea class="form-control" id="taskdescription" name="taskdescription" rows="2"></textarea>
            </div>
            <div class="form-group">
                <label for="finishDate">Termin wykonania:</label>
                <input type="date" class="form-control" id="finishDate" name="finishDate">
            </div>
            <div class="form-group">
                <label for="choosePriority">Priorytet:</label>
                <select class="form-control" id="choosePriority" name="choosePriority">
                    <option value="1">Priorytet 1 (najwyższy)</option>
                    <option value="2">Priorytet 2</option>
                    <option value="3" selected>Priorytet 3 (średni)</option>
                    <option value="4">Priorytet 4</option>
                    <option value="5">Priorytet 5 (najniższy)</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Wyślij</button>
        </form>
    </div>
</div>

<%--<%--%>
<%--    String languageCookie = request.getParameter("language");--%>
<%--    if (languageCookie != null) {--%>
<%--        Cookie cookie = new Cookie("language", languageCookie);--%>
<%--        response.addCookie(cookie);--%>
<%--        response.sendRedirect("todo");--%>
<%--    }--%>
<%--%>--%>

<%--<form action="todo" method="post">--%>
<%--    <label for="description">Treść zadania:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>--%>
<%--    <input--%>
<%--            type="text" id="description"--%>
<%--            name="description"/><br/>--%>
<%--    <label for="deadLine">Termin wykonania:</label>--%>
<%--    <input--%>
<%--            type="datetime-local" id="deadLine"--%>
<%--            name="deadLine"/><br/>--%>
<%--    <label for="priority">Priorytet:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>--%>
<%--    <input--%>
<%--            type="text" id="priority"--%>
<%--            name="priority"/><br/>--%>
<%--    <input type="submit" value="Wyślij"/>--%>
<%--</form>--%>
<%--<%--%>
<%--    List<ToDoList> toDoLists = (List<ToDoList>) session.getAttribute("list");--%>
<%--    if (toDoLists == null) {--%>
<%--        session.setAttribute("list", new ArrayList<>());--%>
<%--    }--%>

<%--    if(request.getParameter("taskdid")!=null){--%>
<%--        UUID id = UUID.fromString(request.getParameter("taskdid"));--%>
<%--        ToDoList toDoList = toDoLists.stream().filter(e -> id.equals(e.getId())).findFirst().orElseThrow(RuntimeException::new);--%>
<%--        toDoLists.remove(toDoList);--%>
<%--        response.sendRedirect("todo");--%>
<%--    }--%>

<%--    if (StringUtils.isNotBlank(request.getParameter("description"))) {--%>
<%--        ToDoList toDoListElement = new ToDoList();--%>
<%--        toDoListElement.setDeadLine(StringUtils.isNotBlank(request.getParameter("deadLine")) ? LocalDate.parse(request.getParameter("deadLine")) : LocalDate.now().plusMonths(1));--%>
<%--        toDoListElement.setDescription(request.getParameter("description"));--%>
<%--        toDoListElement.setPriority(StringUtils.isNotBlank(request.getParameter("priority")) ? Integer.parseInt(request.getParameter("priority")) : 1);--%>
<%--        toDoListElement.setId(UUID.randomUUID());--%>
<%--        toDoLists.add(toDoListElement);--%>
<%--        session.setAttribute("list", toDoLists);--%>
<%--        response.sendRedirect("todo");--%>
<%--    }--%>
<%--%>--%>
<div class="right">
<table class="tableClass">
    <tr>
        <th width="10%">ID:</th>
        <th width="40%">Opis:</th>
        <th width="20%">Data wykonania:</th>
        <th width="15%">Priorytet:</th>
        <th width="15%"><fmt:message key="delete"/>:</th>
    </tr>
    <c:forEach var="todolist" items="${requestScope.list}">
        <c:url var="taskidlink" value="todo">
            <c:param name="taskid" value="${todolist.id}"/>
        </c:url>
        <tr class="line">
            <td><a href="edit${taskidlink}">${todolist.id}</a></td>
            <td><a href="edit${taskidlink}">${todolist.description}</a></td>
            <td><a href="edit${taskidlink}">${todolist.deadLine}</a></td>
            <td><a href="edit${taskidlink}">${todolist.priority}</a></td>
            <td><a href="${taskidlink}"><fmt:message key="delete"/></a></td>
        </tr>
    </c:forEach>
</table>
</div>
<div class="downfooter"></div>
<script src="webjars/jquery/3.3.1/jquery.min.js"></script>
<script src="webjars/popper.js/1.14.6/dist/umd/popper.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
