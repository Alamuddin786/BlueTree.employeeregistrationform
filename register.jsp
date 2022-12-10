<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* font family is added */
body {
   font-family: Arial,Helvetica, sans-serif;
}
form
{flex-direction: column;
align-items: center;
}

.container {
display: flex;
flex: column;
width: 25vw;
border: 2px solid balck;
padding-top: 20px;
padding-bottom: 30px;
padding-left: 30px;
padding-right: 30px;
}

.required:after {
  content: " #";
  color: red;
}

h1,p {
text-align: center;
}

/* describ spacing for input fields */
input {
 margin: 0.25em 0em 1em 0em;
}

/* more style added to beutifuly the input field */

input {
   margin:  0.25em 0em 1em 0em;
   outline: none;
   padding: 0.5em;
   border: none;
   background-color: rgb(225,225,225);
   border-radius: 0.25em;
   color: black;
}

/* style for button */
button {
  
   padding: 0.75em;
   border: none;
   outline: none;
   background-color: rgb(68,18,232);
   color: white;
   border-radius: 0.25em;
   
}
/*hover funtionality for button */
button: hover {
	cursor: pointer;
	background-color: rgb(41,4,164);
	
}
h1,p {
   text-align: center;
}
</style>
</head>
<body>

	<form:form modelAttribute="employee" action="employee" method="post">
	<!--- class named " nontainer" is assigned to div --->
	
	   <div class="container"> 
	   <h1> Registration Form</h1>
	   <p>Kindly Fill all the form to Registration. </p>
		<form:label class="required" path="name">Name</form:label>
		<form:input path="name" type="text" placehder="Enter Name" required="required" />
		<br>
		<form:label class="required" path="email">Email</form:label>
		<form:input path="email" type="text" placeholder="Enrter E-mail"
		 patten ="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required="required" />
		<br>
		<form:label  class="required" path="dob">Date of Birth</form:label>
		<form:input path="dob" type="text" placehder="Enter the date of birth" required="required"/>
		<br>
		
		<form:label class="required" path="salary">Salary</form:label>
		<form:input path="salary" type="text" placehder="Enter the Salary" required="required"/>
		<br>
		<form:label class="required" path="state">status</form:label>
		<form:input path="state"  type="text" placehder="Enter the Status" required="required"/>
		<br>
		<button type="submit" >REGISTER</button>
	</div>
 </form:form>
 
</body>
</html>
