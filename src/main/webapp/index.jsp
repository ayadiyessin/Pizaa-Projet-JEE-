<%@page import="DAO.PizzaDAO"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="modele.Pizza, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Accueil</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"><span
				class="flaticon-pizza-1 mr-1"></span>Pizza<br> <small>Delicous</small></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="index.jsp"
						class="nav-link">Accueil</a></li>

					<li class="nav-item"><a href="about.jsp" class="nav-link">À
							propos</a></li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="client/panier.jsp"><i class="fa fa-shopping-cart"></i>
						<!-- ajout boole -->
						<span class="bad round-pill bad-notif bg-danger">1</span>
						
						</a></li>
					<li class="nav-item"><a class="nav-link"><i
							class="fa fa-user"></i></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<section class="home-slider owl-carousel img"
		style="background-image: url(images/bg_1.jpg);">

		<div class="slider-item">
			<div class="container">
				<div class="row slider-text align-items-center">

					<div class="col-md-6 col-sm-12">
						<span class="subheading">Delicious</span>
						<h1 class="mb-4">Italian Cuizine</h1>
						<p class="mb-4 mb-md-5">A small river named Duden flows by
							their place and supplies it with the necessary regelialia.</p>
					</div>
					<div class="col-md-6">
						<img src="images/bg_1.png" class="img-fluid" alt="">
					</div>

				</div>
			</div>
		</div>

	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section text-center">
					<h2 class="mb-4">Liste des Pizza</h2>
					<p class="flip">
						<span class="deg1"></span><span class="deg2"></span><span
							class="deg3"></span>
					</p>
				</div>
			</div>
			<div class="row">
				<% 
					PizzaDAO pz = new PizzaDAO();
					List<Pizza> lstpiz = pz.getAll();
					session.setAttribute("listP", lstpiz);
				%>

				<c:forEach items="${listP}" var="p" varStatus="status">

					<div class="col-md-3 text-center">
						<div class="menu-wrap">
							<a href="#" class="menu-img img mb-4"
								style="background-image: url(images/${p.image});"></a>
							<div class="text">
								<h3>
									<a>${p.nom}</a>
								</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia.</p>
								<p class="price">
									<span>${p.prix+10}DT</span>
								</p>
								<p>
									<a href="client/choisirPizza.jsp?id=${p.id_pizza}"
										class="btn btn-primary btn-outline-white">Add to cart</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="col-md-3 text-center">
					<div class="menu-wrap">
						<a href="#" class="menu-img img mb-4"
							style="background-image: url(images/pizza-2.jpg);"></a>
						<div class="text">
							<h3>
								<a href="#">Itallian Pizza</a>
							</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia.</p>
							<p class="price">
								<span>20 DT</span>
							</p>
							<p>
								<a href="#" class="btn btn-primary btn-outline-white">Add to
									cart</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 text-center">
					<div class="menu-wrap">
						<a href="#" class="menu-img img mb-4"
							style="background-image: url(images/pizza-3.jpg);"></a>
						<div class="text">
							<h3>
								<a href="#">Itallian Pizza</a>
							</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia.</p>
							<p class="price">
								<span>20 DT</span>
							</p>
							<p>
								<a href="#" class="btn btn-primary btn-outline-white">Add to
									cart</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 text-center">
					<div class="menu-wrap">
						<a href="#" class="menu-img img mb-4"
							style="background-image: url(images/pizza-4.jpg);"></a>
						<div class="text">
							<h3>
								<a href="#">Itallian Pizza</a>
							</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia.</p>
							<p class="price">
								<span>25 DT</span>
							</p>
							<p>
								<a href="#" class="btn btn-primary btn-outline-white">Add to
									cart</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-section img">
		<div class="overlay"></div>
		<div class="container">

			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>