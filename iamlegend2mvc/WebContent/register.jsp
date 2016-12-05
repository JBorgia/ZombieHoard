<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Page</title>


<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body>
<body style="background-image: url('imgs/background-login.jpg')"
	class="background">


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
				<c:choose>
					<c:when
						test="${empty sessionScope.customer || sessionScope.customer.accessLevel =='GUEST'}">
						<li><a href="refresh.do">Login</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="profile.jsp">My Account</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
	<div class="container-fluid">
		<div>
			<div class="col-sm-4 left"></div>
			<div class="col-sm-4 center">
				<div>
					<form:form action="${register}?user=${user}" method="POST"
						modelAttribute="customer" class="form-horizontal"
						style="padding-left: 35px;padding-right:35px">
						<form:label path="accountNumber"></form:label>
						<form:input path="accountNumber" type="hidden" />
						<form:errors path="accountNumber" />
						<br />
						<form:label path="accountBalance"></form:label>
						<form:input path="accountBalance" type="hidden" value="1000" />
						<div class="form-group">
							<div class="wrapper" style="width: 350px; height: 50px">
								<div class="side-by-side" style="width: 100px">
									<div>
										<form:label path="email" class="control-label col-xs-offset-0">Email:</form:label>
									</div>
								</div>
								<div class="side-by-side"
									style="text-align: right; width: 175px">
									<form:input size="30" path="email" />
								</div>
								<div style="text-align: right; font-size: .8em; color: red">
										<form:errors path="email" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="wrapper" style="width: 350px; height: 50px">
								<div class="side-by-side" style="width: 100px">
									<div>
										<form:label path="password"
											class="control-label col-xs-offset-0">Password:</form:label>
									</div>
								</div>
								<div class="side-by-side"
									style="text-align: right; width: 175px">
									<form:input size="30" path="password"
										placeholder="6-12 alpha numeric charaters" />
								</div>
								<div style="text-align: right; font-size: .8em; color: red">
										<form:errors path="password" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="wrapper" style="width: 350px; height: 50px">
								<div class="side-by-side" style="width: 100px">
									<div>
										<form:label path="firstName"
											class="control-label col-xs-offset-0">First Name:</form:label>
									</div>
								</div>
								<div class="side-by-side"
									style="text-align: right; width: 175px">
									<form:input size="30" path="firstName" />
								</div>
								<div style="text-align: right; font-size: .8em; color: red">
										<form:errors path="firstName" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="wrapper" style="width: 350px; height: 50px">
								<div class="side-by-side" style="width: 100px">
									<div>
										<form:label path="middleName"
											class="control-label col-xs-offset-0">Middle Name:</form:label>
									</div>
								</div>
								<div class="side-by-side"
									style="text-align: right; width: 175px">
									<form:input size="30" path="middleName" />
								</div>
								<div style="text-align: right; font-size: .8em; color: red">
										<form:errors path="middleName" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="wrapper" style="width: 350px; height: 50px">
								<div class="side-by-side" style="width: 100px">
									<div>
										<form:label path="lastName"
											class="control-label col-xs-offset-0">Last Name:</form:label>
									</div>
								</div>
								<div class="side-by-side"
									style="text-align: right; width: 175px">
									<form:input size="30" path="lastName" />
								</div>
								<div style="text-align: right; font-size: .8em; color: red">
										<form:errors path="lastName" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="wrapper" style="width: 350px; height: 50px">
								<div class="side-by-side" style="width: 100px">
									<div>
										<form:label path="age" class="control-label col-xs-offset-0">Age:</form:label>
									</div>
								</div>
								<div class="side-by-side"
									style="text-align: right; width: 175px">
									<form:input size="30" path="age"
										placeholder="Must be 18 or older to register" />
								</div>
								<div style="text-align: right; font-size: .8em; color: red">
										<form:errors path="age" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="wrapper" style="width: 350px; height: 50px">
								<div class="side-by-side" style="width: 100px">
									<div>
										<form:label path="height"
											class="control-label col-xs-offset-0">Height:</form:label>
									</div>
								</div>
								<div class="side-by-side"
									style="text-align: right; width: 175px">
									<form:input size="30" path="height" placeholder="Enter inches" />
								</div>
								<div style="text-align: right; font-size: .8em; color: red">
									<form:errors path="height" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="wrapper" style="width: 350px; height: 50px">
								<div class="side-by-side" style="width: 100px">
									<div>
										<form:label path="weight"
											class="control-label col-xs-offset-0">Weight:</form:label>
									</div>
								</div>
								<div class="side-by-side"
									style="text-align: right; width: 175px">
									<form:input size="30" path="weight" placeholder="Enter pounds" />
								</div>
								<div>
									<div style="text-align: right; font-size: .8em; color: red">
										<form:errors path="weight" />
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="wrapper" style="width: 350px; height: 50px">
								<div class="side-by-side" style="width: 100px">
									<div>
										<form:label path="zipcode"
											class="control-label col-xs-offset-0">Zip code:</form:label>
									</div>
								</div>
								<div class="side-by-side"
									style="text-align: right; width: 175px">
									<form:input size="30" path="zipcode"
										placeholder="Enter five or nine digits for zipcode" />
								</div>
								<div style="text-align: right; font-size: .8em; color: red">
									<form:errors path="zipcode" />
								</div>
							</div>
						</div>

						<form:label path="accessLevel"
							class="control-label col-xs-offset-0"></form:label>

						<form:input size="30" path="accessLevel" type="hidden"
							value="GUEST" />
						<form:errors path="accessLevel" />
						<div class="form-group" style="height: 50px; margin: 10px">
							<div class="wrapper" style="width: 350px; height: 50px">
								<div class="side-by-side" style="width: 80px">
									<div>
										<input type="submit" value="Register" class="btn btn-default" />
									</div>
								</div>
								<div class="side-by-side" style="width: 122px">
									<div>
										<a href="LandingPage.do" class="btn btn-default">Shop As
											Guest</a>
									</div>
								</div>
								<div class="side-by-side" style="width: 100px">
									<div>
										<a href="refresh.do" class="btn btn-default">Login Page</a>
									</div>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
			<div class="col-sm-4 right"></div>
		</div>
	</div>
	<div class="container">

		<hr>

		<!-- Footer -->
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Zombie Jesus, 0 AD</p>
			</div>
		</div>
		</footer>

	</div>
</body>
</html>