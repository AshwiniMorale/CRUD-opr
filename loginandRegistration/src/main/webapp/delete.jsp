<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.update-form h1 {
	text-align: center;
	margin-bottom: 60px;
}

.update-form {
	width: 450px;
	background: #f1f1f1;
	height: 480px;
	padding: 80px 40px;
	border-radius: 10px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	font-family: montserrat;
	box-sizing: border-box;
}
.txtb {
	border-bottom: 2px solid #adadad;
	position: relative;
	margin: 30px 0;
}

.txtb input {
	font-size: 15px;
	color: #333;
	border: none;
	width: 100%;
	outline: none;
	background: none;
	padding: 0 5px;
	height: 40px;
}

.txtb span::before {
	content: attr(data-placeholder);
	position: absolute;
	top: 50%;
	left: 5px;
	color: #adadad;
	transform: translateY(-50%);
	z-index: -1;
	transition: .5s;
}

.txtb span::after {
	content: '';
	position: absolute;
	width: 0%;
	height: 2px;
	background: linear-gradient(120deg, #3498db, #8e44ad);
	transition: .5s;
}
.logbtn {
	display: block;
	width: 100%;
	height: 50px;
	border: none;
	background-size: 200%;
	color: black;
	outline: none;
	cursor: pointer;
	transition: .5s;
}
</style>
</head>
<body>
	<form class="update-form" action="delete.htm" method="post"
		style="align-self: center;">
			<h3>DELETE OPERATION</h3>
		
		<div class="txtb">
			<input type="text" name="id"> <span
				data-placeholder="id"></span>
		</div>


		<br> <br> <input class="logbtn" type="submit" value="delete">
	</form>
</body>
</html>