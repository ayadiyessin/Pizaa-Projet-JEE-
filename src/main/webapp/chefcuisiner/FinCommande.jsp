<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="modele.Livreur"%>
<%@page import="DAO.LivreurDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="modele.Pizza, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finaliser Commande</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/responsive/3.0.2/css/responsive.bootstrap5.min.css" rel="stylesheet">
 <!-- Lien vers Bootstrap Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../styleyessin.css">
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="../index.jsp"><span
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
						href="client/panier.jsp"><i class="fa fa-shopping-cart"></i></a></li>
					<li class="nav-item"><a class="nav-link"><i
							class="fa fa-user"></i></a></li>
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
                        <a href="../index.jsp"><i class="fa fa-home"></i>Accueil</a>
                        <a href="accueilChef.jsp"><i class="fa fa-home"></i>Liste Commandes</a>
                        <span>Finaliser le  Commande</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
    
    <section class="container mt-5 tableMargen">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
        	<form action="../CommandeController" method="post">
            <div class="modal-header">
                <h5 class="modal-title" id="livraisonModalLabel">Finaliser la Commande ?</h5>
            </div>
            <div class="modal-body">
                <p>Choisissez un livreur :</p>
                <!-- Liste des livreurs -->
                <div class="list-group">
                    <!-- Livreur 1 -->
                    <%
                    Long commId = Long.parseLong(request.getParameter("id"));
                    LivreurDAO liv = new LivreurDAO();
        			List<Livreur> lstLiv = liv.getAllEtatdispo();
        			session.setAttribute("lstLiv", lstLiv);
        			System.out.print(lstLiv); 
                    %>
                    <c:if test="${not empty lstLiv}">
                            <c:forEach items="${lstLiv}" var="l" varStatus="status">
                                <label class="list-group-item">
                                    <input type="radio" name="livreurId" value="${l.getId()}">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1">Livreur ${status.index + 1}</h5>
                                    </div>
                                    <p class="mb-1">Nom: ${l.getNom()} ${l.getPrenom()}</p>
                                    <small>Email: ${l.getLogin()}</small> <br>
                                    <small>Téléphone : ${l.getNumtel()}</small>
                                </label>
                            </c:forEach>
                        </c:if>
                    
                    
                    <!-- Ajoutez plus de livreurs si nécessaire -->
                </div>
            </div>
            <div class="modal-footer">
            <input type="hidden" name="idcom" value="<%= commId %>">
                <!-- Bouton Annuler -->
                <a type="button" class="btn btn-secondary" href="accueilChef.jsp">Annuler</a>
                <!-- Bouton Finaliser la commande -->
                      <button type="submit" class="btn btn-primary" name="Finaliser">Finaliser la commande</button>
              
            </div>
            </form>
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
    <!-- Lien vers le JS de Bootstrap 5.3 et Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script charset="utf8" src="https://cdn.datatables.net/2.0.5/js/dataTables.min.js"></script>
        <script charset="utf8" src="https://cdn.datatables.net/2.0.5/js/dataTables.bootstrap5.min.js"></script>
        <script charset="utf8"
            src="https://cdn.datatables.net/responsive/3.0.2/js/dataTables.responsive.min.js"></script>
        <script charset="utf8"
            src="https://cdn.datatables.net/responsive/3.0.2/js/responsive.bootstrap5.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>