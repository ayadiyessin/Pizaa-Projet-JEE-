<%@page import="modele.Lignecommande"%>
<%@page import="DAO.LignecommandeDAO"%>
<%@page import="modele.Admin"%>
<%@page import="modele.Livreur"%>
<%@page import="modele.Chefcuisiner"%>
<%@page import="modele.Client"%>
<%@page import="modele.Commande"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CommandeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:if test="${empty sessionScope.Livreur}">
	<jsp:forward page="../livreur/authentificationLivreur.jsp" />
</c:if>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Accueil Livreur | Livreur</title>

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

<link rel="stylesheet" href="../styleyessin.css">
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css"
	rel="stylesheet">


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
						<a href="../index.jsp"><i class="fa fa-home"></i>Accueil</a> <span>Liste
							des commandes à livrer</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->
	<section class="tableMargen">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="card">
					<div class="card-header d-flex align-items-center">
						<h3 class="card-title mb-0">Liste des commandes à livrer</h3>
						<div class="input-group ms-auto" style="width: 250px;">
							<div class="contact-form form-group">
								<span class="input-group "><input id="myInput"
									class="form-control bottom-align" type="text"
									placeholder="Rechercher.."></span>
							</div>
						</div>
					</div>

					<!-- /.card-header -->
					<%
					long idliv = 1;
					CommandeDAO co = new CommandeDAO();
					List<Commande> lstCom = co.getComLivreur(idliv);
					session.setAttribute("lstCom", lstCom);
					%>
					<div class="card-body ">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr class="accueilLiv">
									<th>Numero</th>
									<th>Date Commande</th>
									<th>Etat</th>
									<th>Commande</th>
								</tr>
							</thead>
							<tbody id="listeDemandeurtable">
								<c:if test="${not empty lstCom}">
									<c:forEach items="${lstCom}" var="c" varStatus="status">
										<tr class="accueilLiv">
											<td>${status.index + 1}</td>
											<td><fmt:formatDate value="${c.date_com}"
													pattern="yyyy-MM-dd" /></td>

											<td><c:choose>
													<c:when test="${c.etat_com == 'prête'}">
														<a href="#" class="lancer-livrison-btn"
															data-id="${c.getId_com()}" data-bs-toggle="modal"
															data-bs-target="#LancerLivrisonModal"> Lancer la
															livraison </a>

													</c:when>
													<c:when test="${c.etat_com == 'en cours de livraison'}">
														<a href="#" class="finiser-commande-btn"
															data-id="${c.getId_com()}" data-bs-toggle="modal"
															data-bs-target="#FinaliserLivrisonModal"> Finaliser
															la livraison </a>

													</c:when>
													<c:otherwise>
											         Commande livrée   
                                       
											    </c:otherwise>
												</c:choose> <!-- <a href="#" data-bs-toggle="modal" data-bs-target="#LancerLivrisonModal"> Lancer la livraison  </a> / 
                                        <a href="#" data-bs-toggle="modal" data-bs-target="#FinaliserLivrisonModal"> Finaliser la livraison  </a>-->
											</td>
											<td><a href="detailcommandeliv.jsp?id=${c.id_com}">voir
													commandes </a></td>
										</tr>
									</c:forEach>
								</c:if>



							</tbody>
							<tfoot>
								<tr class="accueilLiv">
									<th>Numero</th>
									<th>Date Commande</th>

									<th>Etat</th>
									<th>Commande</th>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.card-body -->
				</div>
			</div>
		</div>
	</section>


	<!-- lancerLIVRISON MODAL -->
	<div class="modal fade" id="LancerLivrisonModal" tabindex="-1"
		aria-labelledby="LancerLivrisonModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="livraisonModalLabel">Lancer la
						livraison ?</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Êtes-vous sûr de vouloir lancer la livraison ?</p>
				</div>
				<div class="modal-footer">
					<!-- Bouton Annuler -->
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Annuler</button>
					<!-- Bouton Lancer -->
					<button type="button" id="confirmLancer" class="btn btn-primary">Lancer</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							let commandeId;

							$('.lancer-livrison-btn').click(function() {
								commandeId = $(this).data('id');
							});
							console.log(commandeId);

							$('#confirmLancer')
									.click(
											function() {
												if (commandeId) {
													// Rediriger vers le servlet de lancer commande avec l'ID de la commande
													window.location.href = '../CommandeController?idliv='
															+ commandeId;
												}
											});
						});
	</script>
	<!-- FinaliserLivrisonModal MODAL -->
	<div class="modal fade" id="FinaliserLivrisonModal" tabindex="-1"
		aria-labelledby="FinaliserLivrisonModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="livraisonModalLabel">Finaliser la
						livraison ?</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Êtes-vous sûr de vouloir finaliser la livraison ?</p>
				</div>
				<div class="modal-footer">
					<!-- Bouton Annuler -->
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Annuler</button>
					<!-- Bouton Lancer -->
					<button type="button" id="confirmfin" class="btn btn-primary">Finaliser</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document)
				.ready(
						function() {
							let commandeId;

							$('.finiser-commande-btn').click(function() {
								commandeId = $(this).data('id');
							});
							console.log(commandeId);

							$('#confirmfin')
									.click(
											function() {
												if (commandeId) {
													// Rediriger vers le servlet de lancer commande avec l'ID de la commande
													window.location.href = '../CommandeController?idlivf='
															+ commandeId;
												}
											});
						});
	</script>

	<footer style="margin-top: 180px;" class="ftco-footer ftco-section img">
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

	<script>
		$(function() {
			$("#example1")
					.DataTable(
							{
								"searching" : false,
								"responsive" : true,
								"lengthChange" : false,
								"autoWidth" : false,
								"language" : {
									"sProcessing" : "Traitement en cours...",
									"sSearch" : "Rechercher&nbsp;:",
									"sLengthMenu" : "Afficher _MENU_ &eacute;l&eacute;ments",
									"sInfo" : "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
									"sInfoEmpty" : "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
									"sInfoFiltered" : "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
									"sInfoPostFix" : "",
									"sLoadingRecords" : "Chargement en cours...",
									"sZeroRecords" : "Aucun &eacute;l&eacute;ment &agrave; afficher",
									"sEmptyTable" : "Aucune donn&eacute;e disponible dans le tableau",
									"oPaginate" : {
										"sFirst" : "Premier",
										"sPrevious" : "Pr&eacute;c&eacute;dent",
										"sNext" : "Suivant",
										"sLast" : "Dernier"
									},
									"oAria" : {
										"sSortAscending" : ": activer pour trier la colonne par ordre croissant",
										"sSortDescending" : ": activer pour trier la colonne par ordre d&eacute;croissant"
									},
									"select" : {
										"rows" : {
											"_" : "%d lignes séléctionnées",
											"0" : "Aucune ligne séléctionnée",
											"1" : "1 ligne séléctionnée"
										}
									}
								}
							}).buttons().container().appendTo(
							'#example1_wrapper .col-md-6:eq(0)');
		});

		// fonction recherche 
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#listeDemandeurtable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>
</body>

</html>