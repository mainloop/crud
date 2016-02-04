<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title><spring:message code="label.title" /></title>
</head>
<body>


<h2><spring:message code="label.title" /></h2>

<form:form method="post" action="" commandName="user">

	<table>
		<tr>
			<td><form:label path="name"><spring:message code="label.name" /></form:label></td>
			<td><form:input path="name" /></td>
		</tr>
		<tr>
			<td><form:label path="age"><spring:message code="label.age" /></form:label></td>
			<td><form:input path="age" /></td>
		</tr>
		<tr>
			<td><form:label path="admin"><spring:message code="label.admin" /></form:label></td>
			<td><form:checkbox path="admin" /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit"
				value="<spring:message code="label.save"/>" /></td>
		</tr>
	</table>
</form:form>


</body>
</html>