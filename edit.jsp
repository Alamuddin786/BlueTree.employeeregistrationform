<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form modelAttribute="employee" action="update" >
		<form:label path="id">ID</form:label>
		<form:input path="id" readonly="readonly" value="${emp.getId() }" />
		<br>
		<form:label path="name">Name</form:label>
		<form:input path="name" value="${emp.getName() }" />
		<br>
		<form:label path="email">Email</form:label>
		<form:input path="email" value="${emp.getEmail() }" />
		<br>
		<form:label path="dob">Date of Birth</form:label>
		<form:input path="dob" value="${emp.getDob() }" />
		<br>
		<form:label path="salary">Salary</form:label>
		<form:input path="salary" value="${emp.getSalary() }" />
		<br>
		<form:label path="age">Age</form:label>
		<form:input path="age" value="${emp.getAge() }" />
		<br>
		<form:label path="state">Status</form:label>
		<form:input path="state" value="${emp.getState() }" />
		<br>
		<form:button>Submit</form:button>
	</form:form>
</body>
</html>