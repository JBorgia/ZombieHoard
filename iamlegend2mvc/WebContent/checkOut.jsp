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

<title>ZombieHoard: Check Out</title>

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
					<c:choose>
						<c:when test="${empty sessionScope.customer || sessionScope.customer.accessLevel =='GUEST'}">
							<li><a href="refresh.do">Login</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="profile.jsp">My Account</a></li>
						</c:otherwise>
					</c:choose>
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

			<div class="col-md-12">
				<h2>Cart Contents</h2>
				<br>
				<c:if test="${cart == 'emptyCart'}">
					<div class="confirmation">
						<h3>Your cart is empty</h3>
					</div>
				</c:if>
				<c:if test="${cart != 'emptyCart'}">
					<c:forEach items="${cart.cartItems}" var="cartItem"
						varStatus="cartLoop">
						<div class="row">
							<div class="col-md-12">
								<div class="col-sm-4 col-lg-4 col-md-4">
									<a href="GetItemInfo.do?id=${cartItem.inventoryItem.id}">
										<div class="thumbnail">
											<img src="${cartItem.inventoryItem.imageUrl}"
												style="display: block; max-width: 200px; max-height: 95px; width: auto; height: auto;"
												alt="">
										</div>
									</a>
								</div>
								<div class="col-sm-4 col-lg-4 col-md-4">
									<div class="confirmation-title">
										<table>
											<tr>
												<td><h4>${cartItem.inventoryItem.name}</h4></td>
												<td><h6>&nbsp(${cartItem.quantity}x)</h6></td>
											</tr>
										</table>
										<div>
											<p>
												Total Weight:
												<fmt:formatNumber value="${cartItem.itemsWeight}"
													maxIntegerDigits="3" type="number" />
												lbs.
											</p>
											<p>
												Total Cost:
												<fmt:formatNumber value="${cartItem.itemsCost}"
													type="currency" />
											</p>
										</div>
									</div>
								</div>
								<div class="col-sm-4 col-lg-4 col-md-4">
									<div style="margin-top: 8px">
										<span class="right-align"> <form:form method="POST"
												action="UpdateQuantity.do" modelAttribute="cartItem">
												Quantity: 
												<input style="width: 40px; height: 25px"
													value="${cartItem.quantity}" type="number" name="quantity" />
												<input value="${cartLoop.index}" type="hidden" name="id" />
												<input style="width: 70px" type="submit" value="Update" />
											</form:form>
										</span> <br> <br> <span class="right-align"> <form:form
												method="POST" action="DeleteItem.do">
												<input value="${cartLoop.index}" type="hidden" name="id" />
												<input style="width: 70px" type="submit" value="Delete" />
											</form:form>
										</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="row">

						<div class="col-md-12">
							<div class="col-sm-4 col-lg-4 col-md-4"></div>
							<div class="col-sm-4 col-lg-4 col-md-4"
								style="background-color: #eaeae1; height: 85px">
								<div style="padding-top: 8px">
									<h4>
										Total Weight:
										<fmt:formatNumber value="${cart.totalWeight}"
											maxIntegerDigits="3" type="number" />
										lbs.
									</h4>
									<h4>
										Total Cost:
										<fmt:formatNumber value="${cart.totalCost}" type="currency" />
									</h4>
								</div>
							</div>
							<div class="col-sm-4 col-lg-4 col-md-4"
								style="background-color: #dadbc0; height: 85px">
								<div style="margin-top: 10px">
									<span class="right-align"> <form:form method="GET"
											action="LandingPage.do" modelAttribute="inventoryItem">
											<input style="width: 150px" type="submit"
												value="Continue Shopping" />
										</form:form>
									</span> <br> <br> <span class="right-align"> <form:form
											method="GET" action="DeleteItem.do">
											<input style="width: 150px" type="submit"
												value="Proceed to Checkout" />
										</form:form>
									</span>
								</div>
							</div>
						</div>
					</div>

				</c:if>

				<div class="row carousel-holder">
					<div class="col-md-12">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">

								<div class="item active">
									<div class="row">

										<c:forEach items="${inventoryItems}" var="item"
											varStatus="itemLoop">
											<form:form method="GET" action="GetItemInfo.do"
												modelAttribute="inventoryItem">
												<a href="GetItemInfo.do?id=${item.id}"> <input name="id"
													type="hidden" value="${item.id}" />
													<div class="col-sm-4 col-lg-4 col-md-4">
														<div class="thumbnail">
															<div class="image-box">
																<img src="${item.imageUrl}" alt="">
															</div>
															<div class="caption">
																<h4>${item.name}</h4>
																<div style="float: left">
																	<h5>
																		<fmt:formatNumber value="${item.price}"
																			type="currency" />
																	</h5>
																</div>
																<div style="float: right">
																	<h5>
																		<fmt:formatNumber value="${item.weight}"
																			maxIntegerDigits="3" type="number" />
																		lbs.
																	</h5>
																</div>
															</div>
														</div>
													</div></a>
											</form:form>
											<c:if test="${(itemLoop.index+1) % 3 == 0}">
									</div>
								</div>
								<div class="item">
									<div class="row">
										</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="center-nav">
								<a href="#carousel-example-generic" data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left"></span>
								</a> <a href="#carousel-example-generic" data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
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
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</body>

</html>