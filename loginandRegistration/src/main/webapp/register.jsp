<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="styles/kendo.common.min.css" />
<link rel="stylesheet" href="styles/kendo.default.min.css" />
<link rel="stylesheet" href="styles/kendo.default.mobile.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
	charset="utf-8"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	font-family: montserrat;
	box-sizing: border-box;
}

body {
	min-height: 100vh;
	background-image: linear-gradient(120deg, #3498db, #8e44ad);
}

.reg-form {
	width: 360px;
	background: #f1f1f1;
	height: 580px;
	padding: 80px 40px;
	border-radius: 10px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.login-form h1 {
	text-align: center;
	margin-bottom: 60px;
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

.focus+span::before {
	top: -5px;
}

.focus+span::after {
	width: 100%;
}

.logbtn {
	display: block;
	width: 100%;
	height: 50px;
	border: none;
	background: linear-gradient(120deg, #3498db, #8e44ad, #3498db);
	background-size: 200%;
	color: #fff;
	outline: none;
	cursor: pointer;
	transition: .5s;
}

.logbtn:hover {
	background-position: right;
}

.bottom-text {
	margin-top: 60px;
	text-align: center;
	font-size: 13px;
}
</style>
<script>
	function validatefunction() {
		var name = document.forms["reg-form"]["name"];
		var email = document.forms["reg-form"]["email"];
		var phone = document.forms["reg-form"]["mob"];
		var password = document.forms["reg-form"]["password"];
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

		if (name.value == "") {
			alert(required);
			name.focus();
			return false;
		}

		if (email.value == "" && !email.value.match(mailformat)) {

			alert(required);
			email.focus();
			return false;
		}

		if (email.value.indexOf("@", 0) < 0) {
			alert(required);
			email.focus();
			return false;
		}

		if (email.value.indexOf(".", 0) < 0) {
			alert(required);
			email.focus();
			return false;
		}

		if (phone.value == null) {
			alert(required);
			phone.focus();
			return false;
		}

		if (password.value == "") {
			alert(required);
			password.focus();
			return false;
		}

		return true;
	}

	$(".txtb input").on("focus", function() {
		$(this).addClass("focus");
	});

	$(".txtb input").on("blur", function() {
		if ($(this).val() == "")
			$(this).removeClass("focus");
	});
</script>

</head>

<body>
	<form action="register.htm" class="reg-form"
		onsubmit="return validatefunction()" method="post">
		<h1>Registration</h1>

		<div class="txtb">
			<input type="text" name="name" required="required"> <span
				data-placeholder="Username"></span>
		</div>
		<div class="txtb">
			<input type="text" name="email" required="required"> <span
				data-placeholder="E-mail"></span>
		</div>
		<div class="txtb">
			<input type="password" name="password" required="required"> <span
				data-placeholder="Password"></span>
		</div>
		<div class="txtb">
			<input type="tel" name="mob" required="required"> <span
				data-placeholder="Mobile Number "></span>
		</div>

		<input type="submit" class="logbtn" value="register">

		<div class="bottom-text">
			Already have account? <a href="login.html">Login</a>
		</div>

	</form>

	
</body>
</html>
