<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body
	style="background-image: url('imgs/background-login.jpg')"
	class="background">
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="LandingPage.do">Home</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<!-- <img src="images/background.jpg" /> -->
	<div class="container-fluid">
		<div >
			<div class="col-md-3 left"></div>
			<div class="col-md-6">
				<div  style="padding:80px">
					<form:form action="login.do" method="POST"
						modelAttribute="customer" class="form-horizontal">
						<table>
							<tr>
								<td style="width: 100px"><form:label path="email"
										class="control-label col-sm-offset-0">Email:</form:label></td>
								<td><form:input path="email"
										placeholder="Login with registered email address" size="40" />
								</td>
							</tr>
							<tr style="height: 70px">
								<td style="width: 100px"><form:label path="password"
										class="control-label col-sm-offset-0">Password:</form:label></td>
								<td><form:input path="password" size="40" /></td>
							</tr>
							<tr>
								<td></td>
								<td><div class="right-align">
										<input type="submit" value="Login" class="btn btn-default" />
										<a href="register.do" class="btn btn-default">Register</a>
									</div></td>
							</tr>
						</table>
						<div style="text-align: bottom"><br>
							<form:errors path="password" />
							<br>
							<form:errors path="email" />
							<br>
						</div>
					</form:form>
				</div>
			</div>
			<div class="col-md-3 right"></div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="login row2">
			<div class="col-lg-4 left"></div>
			<div class="col-lg-4 center"></div>
			<div class="col-lg-4 right"></div>
		</div>
	</div>
</body>
</html>