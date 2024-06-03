<%@page import="modele.Lignecommande"%>
<%@page import="DAO.LignecommandeDAO"%>
<%@page import="modele.Commande"%>
<%@page import="DAO.CommandeDAO"%>
<%@page import="modele.Admin"%>
<%@page import="modele.Livreur"%>
<%@page import="modele.Chefcuisiner"%>
<%@page import="modele.Client"%>
<%@page import="modele.Ingredient"%>
<%@page import="DAO.IngredientDAO"%>
<%@page import="modele.Pizza"%>
<%@page import="java.util.List"%>
<%@page import="DAO.PizzaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:if test="${empty sessionScope.client}">
	<jsp:forward page="../client/authentificationClinet.jsp" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Choisir Pizza | Client</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet" href="../styleyessin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
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

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="../index.jsp"><i class="fa fa-home"></i>Accueil</a> <span>Détaille
							Pizza</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<section class="ftco-section heading-section-dark">
		<%
		Long pizzaId = Long.parseLong(request.getParameter("id"));
		PizzaDAO pz = new PizzaDAO();
		Pizza piz = pz.findById(pizzaId);
		session.setAttribute("piz", piz);

		IngredientDAO ing = new IngredientDAO();
		List<Ingredient> ingList = ing.findAll();
		session.setAttribute("listIng", ingList);
		%>
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-8">

					<h2 class="mb-4">Choisir le taille et l'ingrendiant de la
						pizza</h2>
					<h4>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nom Pizza :
						${piz.nom}</h4>
					<div class="image-container" style="margin-left: 150px;">
						<img src="../images/${piz.image}" alt="" class="img-fluid"
							width="450" height="450">
					</div>






				</div>
				<!-- .col-md-8 -->
				<div class="col-md-4 sidebar">
					<form action="../PizzachoisieController" class="contact-form"
						method="post">


						<input type="hidden" name="pizzaId" value="${piz.id_pizza}">
						<div class="sidebar-box">
							<div class="categories">
								<br> <br>
								<h3>Les ingrédiants</h3>
								<c:forEach items="${listIng}" var="ig" varStatus="status">
									<li><div class="form-group">
											<input type="checkbox" id="ing${ig.id_ingred}"
												name="selectedIngredients" value="${ig.id_ingred}">
											<label for="ing${ig.id_ingred}">${ig.nom}</label>
										</div></li>

								</c:forEach>
							</div>
						</div>

						<div class="sidebar-box">
							<div class="categories">
								<h3>La taille de pizza</h3>

								<li><div class="form-group">
										<input type="radio" id="s" name="taille" value="1">  
										<label for="s">S</label>
									</div></li>
								<li><div class="form-group">
										<input type="radio" id="m" name="taille" value="2" checked>
										  <label for="m">M</label>
									</div></li>
								<li><div class="form-group">
										<input type="radio" id="l" name="taille" value="3">  
										<label for="l">L</label>
									</div></li>
							</div>
						</div>
						<div class="form-group btnch">
							<input type="submit" value="Confirmer "
								class="btn btn-primary py-3 px-5" name="validpizza">
						</div>
					</form>

				</div>

			</div>
		</div>
	</section>
	<!-- .section -->

	<footer style="margin-top: -90px;" class="ftco-footer ftco-section img">
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
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>