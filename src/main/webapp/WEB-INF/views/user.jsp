<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title><spring:message code="label.title" /></title>
</head>
<body>


<c:set var='ROWSPERPAGE' value="10" />


<h2><spring:message code="label.title" /></h2>

<h3><spring:message code="label.users" /></h3>

<c:if test="${!empty userList}">


    <c:set var="totalCount" value = "${fn:length(userList)}" />

    <c:set var="pageNumber" value="${param.pageNumber}"/>
    <c:choose>
        <c:when test="${param.pageNumber == null}">
            <c:set var="pageNumber" value="0"/>
        </c:when>
        <c:otherwise>
            <c:set var="pageNumber" value="${param.pageNumber-1}"/>
        </c:otherwise>
    </c:choose>

    <c:if test="${pageNumber lt 0}">
        <c:set var="pageNumber" value="0"/>
    </c:if>

    <c:set var="start" value="${pageNumber*ROWSPERPAGE}"/>
    <c:set var="stop" value="${start+ROWSPERPAGE-1}"/>

    <c:if test="${stop gt (totalCount-1)}">
        <c:set var="stop" value="${totalCount-1}"/>
    </c:if>


	<table class="data">
		<tr>
			<th><spring:message code="label.name" /></th>
			<th><spring:message code="label.age" /></th>
			<th><spring:message code="label.admin" /></th>
			<th><spring:message code="label.date" /></th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>

		<c:forEach items="${userList}" var="user" begin="${start}" end = "${stop}">
			<tr>
				<td>${user.name}</td>
				<td>${user.age}</td>
				<td>${user.admin}</td>
				<td>${user.createdDate}</td>
				<td><a href="delete/${user.id}"><spring:message code="label.delete" /></a></td>
				<td><a href="user-edit/${user.id}"><spring:message code="label.edit" /></a></td>
			</tr>
		</c:forEach>
	</table>

    <br>

    <a href="add"><spring:message code="label.add"/></a>

    <br>


    <c:set var="totalPage" value="${totalCount/ROWSPERPAGE}"/>
    <c:set var="modPages"  value="${totalCount%ROWSPERPAGE}"/>
    <c:set var="totalPage" value="${totalPage-modPages/ROWSPERPAGE}"/>
    <c:if test="${modPages gt 0}">
        <c:set var="totalPage" value="${totalPage+1}"/>
    </c:if>


    <table class="paging">
    <tr>

    <c:if test="${pageNumber gt 0}">
       <td><a href="index?pageNumber=${pageNumber}"><spring:message code="label.prev"/></a></td>
    </c:if>

    <c:forEach begin="1" end="${totalPage}" step="1" varStatus="status">
        <c:choose>
            <c:when test="${(pageNumber +1 ) eq status.index}">
                <td>${status.index}</td>
            </c:when>
            <c:otherwise>
                <td><a href="index?pageNumber=${status.index}">${status.index}</a></td>
            </c:otherwise>
        </c:choose>
    </c:forEach>


    <c:if test="${(pageNumber+1) lt totalPage}">
        <td><a href="index?pageNumber=${pageNumber+2}"><spring:message code="label.next"/></a></td>
    </c:if>

    <tr>
    </table>

</c:if>

</body>
</html>