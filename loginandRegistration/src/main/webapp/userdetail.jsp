<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List</title>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 5px;
  text-align: left;
}
.btn {
	display: block;
	width: 100%;
	height: 50px;
	border: none;
	background-size: 200%;
	color: #fff;
	outline: none;
	cursor: pointer;
	transition: .5s;
	padding: 5px;
}
.update{
    margin-left:10px;
    padding: 5px;
 }
 .delete{
    margin-left:20px;
    padding: 5px;
 }

</style>
</head>
<body>
	<%@include file="index.jsp"%>

	<sql:setDataSource 
		var="connectionDS" 
		driver="org.postgresql.Driver"
		url="jdbc:postgresql://localhost:5432/practice" 
		user="postgres"
		password="postgres" />

	<c:set var="connectionDS" scope="request" />
	<div class="row">
		<%
			Integer id = (Integer) session.getAttribute("id");
		%>
		<sql:query var="listUser" dataSource="${connectionDS}">
			 SELECT * FROM register r WHERE r.id=<%=id%>;
    	</sql:query>

		<h2 align="center" style="color: green;" class="alert alert-info">User
			Detail</h2>
		<br>

		<table  align="center" class="table table-hover table-bordered" style="width:40%;" border="1">

			<c:forEach items="${listUser.rows}" var="user">
				<tr >
					<th>User ID</th>
					<th><c:out value="${user.id}"></c:out></th>
				</tr>
 				<tr>
 					<th>First Name</th>
 					<th><c:out value="${user.name}"></c:out></th>
 				</tr>
 				<tr>
					<th>E-mail Id</th>
					<th><c:out value="${user.email}"></c:out></th>
 				</tr>			
				<tr>
					<th >Mobile</th>
					<th><c:out value="${user.mob}"></c:out></th>
 				</tr>			
 		 	</c:forEach>
		 </table> 
		 <br> <br> <br>
		 
		 <div class="row" align="center">
		 		 <a href="update.jsp"><input type="button" name="update" value="update" style="padding: 5px" ></a>
		 		  &nbsp;&nbsp;&nbsp;
		 		 <a href="delete.jsp"><input type="button" name="delete"  value = "delete" style="padding: 5px"></a>
	
		 </div>
</body>
</html>