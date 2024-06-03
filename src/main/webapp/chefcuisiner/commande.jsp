<%@page import="modele.Admin"%>
<%@page import="modele.Livreur"%>
<%@page import="modele.Chefcuisiner"%>
<%@page import="modele.Client"%>
<%@page import="modele.IngredPizza"%>
<%@page import="DAO.IngredPizzaDAO"%>
<%@page import="DAO.TaillepizzaDAO"%>
<%@page import="modele.Taillepizza"%>
<%@page import="modele.Pizzachoisie"%>
<%@page import="DAO.PizzachoisieDAO"%>
<%@page import="DAO.PizzaDAO"%>
<%@page import="modele.Lignecommande"%>
<%@page import="java.util.List"%>
<%@page import="DAO.LignecommandeDAO"%>
<%@page import="modele.Commande"%>
<%@page import="DAO.CommandeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="modele.Pizza, java.util.*"%>
<c:if test="${empty sessionScope.chef}">
	<jsp:forward page="../chefcuisiner/authentificationChef.jsp" />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Facture de Commande | Chef Cuisiner</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.min.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/responsive/3.0.2/css/responsive.bootstrap5.min.css"
	rel="stylesheet">
<!-- Lien vers Bootstrap Icons -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../styleyessin.css">
<link rel="stylesheet" href="../style.css">
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
							session.setAttribute("length", length);

						}
					}
					%>


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
						<a href="../index.jsp"><i class="fa fa-home"></i>Accueil</a> <a
							href="accueilChef.jsp"><i class="fa fa-home"></i>Liste
							Commandes</a> <span>Detail Commande</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<div class="container mt-5 tableMargen">
		<div class="card">
			<div class="card-header">
				<h5 class="card-title">Liste des Pizaa</h5>
			</div>
			<div class="card-body">
				<!-- Tableau des commandes de pizza -->
				<div class="mt-4">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Image</th>
								<th scope="col">Pizza</th>
								<th scope="col">Quantité</th>
								<th scope="col">Taille</th>
								<th scope="col">Ingredients</th>
							</tr>
						</thead>
						<tbody>
							<%
							Long commId = Long.parseLong(request.getParameter("id"));
							CommandeDAO cm = new CommandeDAO();
							Commande comm = cm.findById(commId);
							session.setAttribute("comm", comm);

							LignecommandeDAO ligCo = new LignecommandeDAO();
							List<Lignecommande> lstLigCom = ligCo.getAllLignecomparCom(commId);
							session.setAttribute("lstLigCom", lstLigCom);
							PizzachoisieDAO pzchdao = new PizzachoisieDAO();
							PizzaDAO pzdao = new PizzaDAO();
							TaillepizzaDAO tailPiz = new TaillepizzaDAO();
							int i = 1;
							for (Lignecommande lcm : lstLigCom) {
								Pizzachoisie pzch = pzchdao.findById(lcm.getIdpiz_lignecom());
								Pizza pz = pzdao.findById(pzch.getIdpiz_pizzachois());
								Taillepizza tpz = tailPiz.findById(pzch.getIdtail_pizzachois());
								IngredPizzaDAO ingpdao = new IngredPizzaDAO();
								List<IngredPizza> lstIng = ingpdao.getAllByPizza(pzch);
								System.out.print(lstIng);
							%>
							<tr>
								<th scope="row"><%=i%></th>
								<td><img src="../images/<%=pz.getImage()%>"
									class="pizza-img" alt="Pizza"></td>
								<td><%=pz.getNom()%></td>
								<td><%=lcm.getQte_lignecom()%></td>
								<td><%=tpz.getTaille()%></td>
								<td>
									<ul>
										<%
										if (lstIng != null && !lstIng.isEmpty()) {
											for (IngredPizza ingp : lstIng) {
										%>
										<li><%=ingp.getIngredientNom()%></li>

										<%
										}
										}
										%>
									</ul> <!--  <a href="#" data-bs-toggle="modal" data-bs-target="#listeINg"> liste Ingredients </a> -->
								</td>
							</tr>
							<%
							i++;
							}
							%>

							<!-- Ajouter plus de lignes si nécessaire -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal ingredients -->
	<div class="modal fade" id="listeINg" tabindex="-1"
		aria-labelledby="listeINg" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ingredientsModalLabel">Liste des
						Ingrédients</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Liste des ingrédients -->
					<ul>
						<li>Tomate</li>
						<li>Mozzarella</li>
						<li>Basilic</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Fermer</button>
				</div>
			</div>
		</div>
	</div>

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
						PIZZA SFAXIENNE
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Lien vers le JS de Bootstrap 5.3 et Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script charset="utf8"
		src="https://cdn.datatables.net/2.0.5/js/dataTables.min.js"></script>
	<script charset="utf8"
		src="https://cdn.datatables.net/2.0.5/js/dataTables.bootstrap5.min.js"></script>
	<script charset="utf8"
		src="https://cdn.datatables.net/responsive/3.0.2/js/dataTables.responsive.min.js"></script>
	<script charset="utf8"
		src="https://cdn.datatables.net/responsive/3.0.2/js/responsive.bootstrap5.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
