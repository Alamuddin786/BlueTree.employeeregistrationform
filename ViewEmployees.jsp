<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.btm.EmployeeConfiguration"%>
<%@page
	import="org.springframework.context.annotation.AnnotationConfigApplicationContext"%>
<%@page import="org.btm.dto.Employee"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.btm.dao.EmployeeDao"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.bg-mynav {
	background-color: green;
}

body {
	font-size: 1.25rem;
	background-color: #f6f8fa;
}

td {
	line-height: 3rem;
}

.table-responsive {
	background-color: aqua;
}

.tableheadingrow {
	background-color: lightgreen;
}

.rowdetails {
	
}
</style>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
</head>
<body>
	<%
	ApplicationContext context = new AnnotationConfigApplicationContext(EmployeeConfiguration.class);
	EmployeeDao dao = context.getBean(EmployeeDao.class);
	List<Employee> employees = dao.findAll();
	((AnnotationConfigApplicationContext) context).close();
	%>
	
	<nav class="navbar navbar-dark bg-mynav">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">CRUD Operations</a>
		</div>
	</nav>



	<div class="container">
		<div class="d-flex bd-highlight mb-3">
			<div class="me-auto p-2 bd-highlight">Employee Details</div>
			<div class="p-2 bd-highlight">
				
				<a href="load">
					<button type="button" class="load" onclick="showUserCreateBox()">
					Add Employee
					</button>
				</a>

			</div>
		</div>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr class="tableheadingrow">
						<th scope="col">UserID</th>
						<th scope="col">UserName</th>
						<th scope="col">Email</th>
						<th scope="col">Date Of Birth</th>
						<th scope="col">Age</th>
						<th scope="col">Salary</th>
						<th scope="col">Status</th>
						<th scope="col">Edit</th>
						<th scope="col">Delete</th>
					</tr>
				</thead>

				<%
					for (Employee emp : employees) {
				%>
				<tr class="rowdetails">
					<td><%=emp.getId()%></td>
					<td><%=emp.getName()%></td>
					<td><%=emp.getEmail()%></td>
					<td><%=emp.getDob()%></td>
					<td><%=emp.getAge()%></td>
					<td><%=emp.getSalary()%></td>
					<td><%=emp.getState()%></td>
					<td><a href="edit?id=<%=emp.getId()%>">Edit</a></td>
					<td><a href="delete?id=<%=emp.getId()%>">Delete</a></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>