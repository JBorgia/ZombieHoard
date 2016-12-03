<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>ZombieHoard: Profile</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<!-- container -->
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
					<li><a href="#">About</a></li>
					<li><a href="refresh.do">Login</a></li>
					<li><a href="profile.jsp">My Account</a></li>
					<li><a href="ViewCart.do">View Cart</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-lg-6 col-md-6">
				<p class="lead">Edit Profile</p>
				<div class="list-group">

					<h4>User Account: ${sessionScope.customer.firstName}
						${sessionScope.customer.middleName}
						${sessionScope.customer.lastName}</h4>

					<div>Account Information:</div>
				</div>
				<div class="list-group">
					<div class="wrapper list-group-item">
						<div class="side-by-side">
							<div>Account Number:</div>
						</div>
						<div class="side-by-side" style="text-align: right; width: 245px">
							<div>${sessionScope.customer.accountNumber}</div>
						</div>
					</div>
					<div class="wrapper list-group-item">
						<div class="side-by-side">
							<div>Account Balance:</div>
						</div>
						<div class="side-by-side" style="text-align: right; width: 245px">
							<div>${sessionScope.customer.accountBalance}</div>
						</div>
					</div>
					<div class="wrapper list-group-item">
						<div class="side-by-side" style="width: 80px">
							<div>Email:</div>
						</div>
						<c:choose>
							<c:when test="${ update == 1}">
								<div class="side-by-side" style="text-align: right">
									<form:form action="update.do?update=1" method="POST"
										modelAttribute="customer">
										<div>
											<form:label path="email" />
											<form:input path="email" />
										</div>
								</div>
								<div class="side-by-side"
									style="width: 70px; padding-left: 15px">
									<div>
										<input type="submit" value="Update" />
									</div>
								</div>
								</form:form>
								<div class="side-by-side">
									<div>
										<form action="update.do" method="GET">
											<input type="submit" value="Cancel">
										</form>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="side-by-side" style="text-align: right">
									<div>${sessionScope.customer.email}</div>
								</div>
								<div class="side-by-side" style="text-align: right">
									<a href="update.do?update=-1">Update</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="wrapper list-group-item">
						<div class="side-by-side" style="width: 80px">
							<div>Password:</div>
						</div>
						<c:choose>
							<c:when test="${ update == 2}">
								<div class="side-by-side" style="text-align: right">
									<form:form action="update.do?update=2" method="POST"
										modelAttribute="customer">
										<form:label path="password" />
										<form:input path="password" />
								</div>
								<div class="side-by-side"
									style="width: 70px; padding-left: 15px">
									<div>
										<input type="submit" value="Update" />
										</form:form>
									</div>
								</div>
								<div class="side-by-side">
									<div>
										<form action="update.do" method="GET">
											<input type="submit" value="Cancel">
										</form>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="side-by-side" style="text-align: right">
									<div>**************</div>
								</div>
								<div class="side-by-side" style="text-align: right">
									<div>
										<a href="update.do?update=-2">Update</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>



					<div class="wrapper list-group-item">
						<div class="side-by-side" style="width: 80px">
							<div>First Name:</div>
						</div>
						<c:choose>
							<c:when test="${ update == 3}">
								<div class="side-by-side" style="text-align: right">
									<form:form action="update.do?update=3" method="POST"
										modelAttribute="customer">
										<form:label path="firstName" />
										<form:input path="firstName" />
								</div>
								<div class="side-by-side"
									style="width: 70px; padding-left: 15px">
									<div>
										<input type="submit" value="Update" />
										</form:form>
									</div>
								</div>
								<div class="side-by-side">
									<div>
										<form action="update.do" method="GET">
											<input type="submit" value="Cancel">
										</form>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="side-by-side" style="text-align: right">
									<div>${sessionScope.customer.firstName}</div>
								</div>
								<div class="side-by-side" style="text-align: right">
									<div>
										<a href="update.do?update=-3">Update</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>


					<div class="wrapper list-group-item">
						<div class="side-by-side" style="width: 80px">
							<div>Middle Name:</div>
						</div>
						<c:choose>
							<c:when test="${ update == 4}">
								<div class="side-by-side" style="text-align: right">
									<form:form action="update.do?update=4" method="POST"
										modelAttribute="customer">
										<form:label path="middleName" />
										<form:input path="middleName" />
								</div>
								<div class="side-by-side"
									style="width: 70px; padding-left: 15px">
									<div>
										<input type="submit" value="Update" />
										</form:form>
									</div>
								</div>
								<div class="side-by-side">
									<div>
										<form action="update.do" method="GET">
											<input type="submit" value="Cancel">
										</form>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="side-by-side" style="text-align: right">
									<div>${sessionScope.customer.middleName}</div>
								</div>
								<div class="side-by-side" style="text-align: right">
									<div>
										<a href="update.do?update=-4">Update</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>



					<div class="wrapper list-group-item">
						<div class="side-by-side" style="width: 80px">
							<div>Last Name:</div>
						</div>
						<c:choose>
							<c:when test="${ update == 5}">
								<div class="side-by-side" style="text-align: right">
									<form:form action="update.do?update=5" method="POST"
										modelAttribute="customer">
										<form:label path="lastName" />
										<form:input path="lastName" />
								</div>
								<div class="side-by-side"
									style="width: 70px; padding-left: 15px">
									<div>
										<input type="submit" value="Update" />
										</form:form>
									</div>
								</div>
								<div class="side-by-side">
									<div>
										<form action="update.do" method="GET">
											<input type="submit" value="Cancel">
										</form>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="side-by-side" style="text-align: right">
									<div>${sessionScope.customer.lastName}</div>
								</div>
								<div class="side-by-side" style="text-align: right">
									<div>
										<a href="update.do?update=-5">Update</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>



					<div class="wrapper list-group-item">
						<div class="side-by-side" style="width: 80px">
							<div>Age:</div>
						</div>
						<c:choose>
							<c:when test="${ update == 6}">
								<div class="side-by-side" style="text-align: right">
									<form:form action="update.do?update=6" method="POST"
										modelAttribute="customer">
										<form:label path="age" />
										<form:input path="age" />
								</div>
								<div class="side-by-side"
									style="width: 70px; padding-left: 15px">
									<div>
										<input type="submit" value="Update" />
										</form:form>
									</div>
								</div>
								<div class="side-by-side">
									<div>
										<form action="update.do" method="GET">
											<input type="submit" value="Cancel">
										</form>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="side-by-side" style="text-align: right">
									<div>
										<fmt:formatNumber value="${sessionScope.customer.age}"
											maxIntegerDigits="0" type="number" />
									</div>
								</div>
								<div class="side-by-side" style="text-align: right">
									<div>
										<a href="update.do?update=-6">Update</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>



					<div class="wrapper list-group-item">
						<div class="side-by-side" style="width: 80px">
							<div>Height:</div>
						</div>
						<c:choose>
							<c:when test="${ update == 7}">
								<div class="side-by-side" style="text-align: right">
									<form:form action="update.do?update=7" method="POST"
										modelAttribute="customer">
										<form:label path="height" />
										<form:input path="height" />
								</div>
								<div class="side-by-side"
									style="width: 70px; padding-left: 15px">
									<div>
										<input type="submit" value="Update" />
										</form:form>
									</div>
								</div>
								<div class="side-by-side">
									<div>
										<form action="update.do" method="GET">
											<input type="submit" value="Cancel">
										</form>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="side-by-side" style="text-align: right">
									<div>${sessionScope.customer.height}</div>
								</div>
								<div class="side-by-side" style="text-align: right">
									<div>
										<a href="update.do?update=-7">Update</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>



					<div class="wrapper list-group-item">
						<div class="side-by-side" style="width: 80px">
							<div>Weight:</div>
						</div>
						<c:choose>
							<c:when test="${ update == 8}">
								<div class="side-by-side" style="text-align: right">
									<form:form action="update.do?update=8" method="POST"
										modelAttribute="customer">
										<form:label path="weight" />
										<form:input path="weight" />
								</div>
								<div class="side-by-side"
									style="width: 70px; padding-left: 15px">
									<div>
										<input type="submit" value="Update" />
										</form:form>
									</div>
								</div>
								<div class="side-by-side">
									<div>
										<form action="update.do" method="GET">
											<input type="submit" value="Cancel">
										</form>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="side-by-side" style="text-align: right">
									<div>${sessionScope.customer.weight}</div>
								</div>
								<div class="side-by-side" style="text-align: right">
									<div>
										<a href="update.do?update=-8">Update</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>



					<div class="wrapper list-group-item">
						<div class="side-by-side">
							<div>Access Level:</div>
						</div>
						<c:choose>
							<c:when test="${ sessionScope.customer.accessLevel == 'ADMIN'}">
								<div class="side-by-side"
									style="width: 70px; padding-left: 15px">
									<a href="admin.do?">${sessionScope.customer.accessLevel}</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="side-by-side">
									${sessionScope.customer.accessLevel}</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="wrapper">
					<div class="side-by-side" style="width:100px">
						<form action="logout.do" method="POST">
							<input type="submit" value="Logout">
						</form>
					</div>
					<div class="side-by-side" style="width:100px">
						<form action="LandingPage.do" method="GET">
							<input type="submit" value="Shop">
						</form>
					</div>
					<c:if test="${ sessionScope.customer.accessLevel == 'ADMIN'}">
						<div class="side-by-side" style="width:100px">
							<form action="logout.do" method="POST">
								<input type="submit" value="Modify Inventory">
							</form>
						</div>
						<div class="side-by-side" style="width:100px">
							<form action="logout.do" method="POST">
								<input type="submit" value="Modify Users">
							</form>
						</div>
					</c:if>
				</div>
			</div>
			<div class="col-sm-6 col-lg-6 col-md-6"></div>
		</div>
	</div>
</body>
</html>