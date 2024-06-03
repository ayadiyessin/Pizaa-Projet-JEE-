<%@page import="modele.Lignecommande"%>
<%@page import="java.util.List"%>
<%@page import="DAO.LignecommandeDAO"%>
<%@page import="modele.Commande"%>
<%@page import="DAO.CommandeDAO"%>
<%@page import="modele.Admin"%>
<%@page import="modele.Livreur"%>
<%@page import="modele.Chefcuisiner"%>
<%@page import="modele.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Authrntification Livreur | Livreur</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="../styleyessin.css">
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="../index.jsp"><span
				class="flaticon-pizza-1 mr-1"></span>Pizza<br> <small>SFAXIENNE</small></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="../index.jsp"
						class="nav-link">Accueil</a></li>

					<li class="nav-item"><a href="../about.jsp" class="nav-link">À
							propos</a></li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<%
					Client client = (Client) session.getAttribute("client");
					if (client != null) {
						Long idcli = (long) client.getId();
						int length = 0;
						CommandeDAO cmdao = new CommandeDAO();
						Commande cm = cmdao.getComNonValiderClient(idcli);

						if (cm != null) {
							LignecommandeDAO lcdao = new LignecommandeDAO();
							List<Lignecommande> listLcm = lcdao.getAllLignecomparCom(cm.getId_com());
							length = listLcm.size();

						}
						session.setAttribute("length", length);
					}
					%>

					<c:choose>
						<c:when test="${not empty sessionScope.client}">
							<c:choose>
								<c:when test="${sessionScope.length == 0}">
									<li class="nav-item"><a class="nav-link"
										title="Auccun commande dans le pannier"><i
											class="fa fa-shopping-cart"></i> <!-- ajout boole --> <span
											class="bad round-pill bad-notif bg-danger">0</span> </a></li>
								</c:when>
								<c:otherwise>
									<li class="nav-item"><a class="nav-link"
										href="../client/panier.jsp"><i class="fa fa-shopping-cart"></i>
											<!-- ajout boole --> <span
											class="bad round-pill bad-notif bg-danger">${length}</span> </a></li>
								</c:otherwise>

							</c:choose>



						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link"
								title="il faux connecter "><i
									class="fa fa-shopping-cart"></i> <!-- ajout boole --> <span
									class="bad round-pill bad-notif bg-danger">0</span> </a></li>
						</c:otherwise>

					</c:choose>
					<%
					//Client client = (Client)session.getAttribute("client");
					Chefcuisiner chef = (Chefcuisiner) session.getAttribute("chef");
					Livreur livreur = (Livreur) session.getAttribute("Livreur");
					Admin admin = (Admin) session.getAttribute("admin");
					%>
					<c:choose>
						<c:when test="${not empty sessionScope.client}">
							<li class="nav-item"><a class="nav-link"><i
									class="fa fa-user"></i> ${sessionScope.client.getNom()}
									${sessionScope.client.getPrenom()} </a>
								<ul class="dropdo2">
									<li><a href="../client/accueilClient.jsp">Accueil</a></li>
									<li><a href="../ClientController?action=deconnexion">Deconnexion</a></li>
								</ul></li>
						</c:when>
						<c:when test="${not empty sessionScope.chef}">
							<li class="nav-item"><a class="nav-link"><i
									class="fa fa-user"></i> ${sessionScope.chef.getLogin()} </a>
								<ul class="dropdo2">
									<li><a href="../chefcuisiner/accueilChef.jsp">Accueil</a></li>
									<li><a href="../ChefcuisinerController?action=deconnexion">Deconnexion</a></li>
								</ul></li>
						</c:when>
						<c:when test="${not empty sessionScope.Livreur}">
							<li class="nav-item"><a class="nav-link"><i
									class="fa fa-user"></i> ${sessionScope.Livreur.getNom()}
									${sessionScope.Livreur.getPrenom()} </a>
								<ul class="dropdo2">
									<li><a href="../livreur/accueilLivreur.jsp">Accueil</a></li>
									<li><a href="../LivreurController?action=deconnexion">Deconnexion</a></li>
								</ul></li>

						</c:when>
						<c:when test="${not empty sessionScope.admin}">
							<li class="nav-item"><a class="nav-link"><i
									class="fa fa-user"></i> ${sessionScope.admin.getLogin()} </a>
								<ul class="dropdo2">
									<li><a href="../admin/accueilAdmin.jsp">Accueil</a></li>
									<li><a href="../AdminController?action=deconnexion">Deconnexion</a></li>
								</ul></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link"><i
									class="fa fa-user"></i> Connexion</a>
								<ul class="dropdo2">
									<li><a href="../client/authentificationClinet.jsp">Client</a></li>
									<li><a href="../chefcuisiner/authentificationChef.jsp">Chef
											Cuisiner</a></li>
									<li><a href="../livreur/authentificationLivreur.jsp">Livreur</a></li>
									<li><a href="../admin/authentificationAdmin.jsp">Administrateur</a></li>
								</ul></li>
						</c:otherwise>

					</c:choose>



				</ul>

			</div>
		</div>
	</nav>
	<!-- Login 2 - Bootstrap Brain Component -->
	<!-- <div class="connexion-livreur">
        <h2>Connexion Livreur</h2>
</div>-->

	<section class="bg-light py-3 py-md-5">
		<div class="container">
			<div class="row justify-content-md-center">
				<div class="col-12 col-md-11 col-lg-8 col-xl-7 col-xxl-6">
					<div class="bg-white p-4 p-md-5 rounded shadow-sm">
						<div class="row">
							<div class="col-12">
								<div class="mb-5">
									<h3>Connexion Livreur</h3>
								</div>
							</div>
						</div>
						<%
						String email = request.getParameter("email");
						String password = request.getParameter("password");
						String message = request.getParameter("message");
						%>
						<form class="contact-form" action="../LivreurController"
							method="post">
							<div class="row gy-3 gy-md-4 overflow-hidden">
								<div class="form-group col-12">
									<label for="email" class="form-label">E-mail <span
										class="text-danger">*</span></label> <input type="email"
										class="form-control" name="email" id="email"
										placeholder="name@example.com"
										value="<%=(email != null) ? email : ""%>" required
										onblur="validateEmail()" oninput="clearEmailError()">
									<div id="emailError" class="text-danger"></div>
								</div>
								<div class="form-group col-12">
									<label for="password" class="form-label">Mot de passe <span
										class="text-danger">*</span></label> <input type="password"
										class="form-control" name="password" id="password"
										placeholder="XXXXXXXX" required onblur="validatePassword()"
										value="<%=(password != null) ? password : ""%>"
										oninput="clearPasswordError()">
									<div id="passwordError" class="text-danger"></div>
								</div>
								<%
								if (message != null) {
								%>
								<div class="text-danger"><%=message%></div>
								<%
								}
								%>
								<div class="col-12">
									<div class="d-grid">
										<button class="btn btn-lg btn-primary" name='authentification'
											id="authBtn" type="submit">Connexion</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>



	<footer style="margin-top: 30px;" class="ftco-footer ftco-section img">
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
						PIZZA SFAXIENNE
					</p>
				</div>
			</div>
		</div>
	</footer>






	<script>
		function validateEmail() {
			var emailInput = document.getElementById('email');
			var email = emailInput.value.trim();
			var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			var isValid = true;

			var emailError = document.getElementById('emailError');

			if (!emailPattern.test(email)) {
				emailError.textContent = 'Adresse e-mail non valide';
				isValid = false;
			} else {
				emailError.textContent = '';
			}
		}

		function validatePassword() {
			var passwordInput = document.getElementById('password');
			var password = passwordInput.value.trim();

			var passwordError = document.getElementById('passwordError');

			if (password.length < 6) {
				passwordError.textContent = 'Le mot de passe doit contenir au moins 6 caractères';
				isValid = false;
			} else {
				passwordError.textContent = '';
			}
		}

		function clearEmailError() {
			var emailError = document.getElementById('emailError');
			emailError.textContent = '';
		}

		function clearPasswordError() {
			var passwordError = document.getElementById('passwordError');
			passwordError.textContent = '';
		}
		var submitBtn = document.getElementById('authBtn');
		submitBtn.disabled = !isValid;
	</script>

</body>
</html>