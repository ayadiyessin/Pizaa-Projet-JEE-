<%@page import="modele.Pizzachoisie"%>
<%@page import="DAO.PizzaDAO"%>
<%@page import="DAO.PizzachoisieDAO"%>
<%@page import="modele.Lignecommande"%>
<%@page import="DAO.LignecommandeDAO"%>
<%@page import="modele.Commande"%>
<%@page import="DAO.CommandeDAO"%>
<%@page import="modele.Client"%>
<%@page import="DAO.ClientDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="modele.Pizza, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Facture Commande | Livreur</title>
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
                        <a href="accueilLivreur.jsp">Liste des commandes à livrer</a>
                        <span>Facture de Commande</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <section class="container mt-5 tableMargen">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title">Facture de Commande</h5>
            </div>
            <div class="card-body">
                <!-- Début du contenu de la carte -->
                <div>
                 <%
                        	Long comId = Long.parseLong(request.getParameter("id"));
       			          	CommandeDAO cmdao = new CommandeDAO();
     						Commande cm = cmdao.findById(comId);
            				ClientDAO cl = new ClientDAO();
            				Client cli = cl.findById(cm.getId_Client());
            				session.setAttribute("cli", cli);
            			%>
                    <!-- Informations du profil -->
                    <h5>Informations du client</h5>
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Nom:</strong> <%= cli.getNom() +" "+cli.getPrenom() %></p>
                            <p><strong>Email:</strong> <%= cli.getLogin() %></p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Téléphone:</strong> <%= cli.getNumtel() %></p>
                            <p><strong>Adresse:</strong> <%= cli.getAdresse() %></p>
                        </div>
                    </div>
                </div>

                <!-- Tableau des commandes de pizza -->
                <div class="mt-4">
                    <h5>Commandes de Pizza</h5>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Image Pizza</th>
                                <th scope="col">Pizza</th>
                                <th scope="col">Quantité</th>
                                
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%

            			
            			LignecommandeDAO lcdao = new LignecommandeDAO();
            			List<Lignecommande> listLcm = lcdao.getAllLignecomparCom(comId);
            			
            			double prixpt=0;
            			session.setAttribute("listLigneCom", listLcm);
            			PizzachoisieDAO pzchdao = new PizzachoisieDAO();
                  		PizzaDAO pzdao = new PizzaDAO();
                  		int i=0;
							for(Lignecommande lcm:listLcm){ 
								Pizzachoisie pzch = pzchdao.findById(lcm.getIdpiz_lignecom());
								double prix = pzchdao.prixPizz(pzch.getId_pizzachois());
								Pizza pz = pzdao.findById(pzch.getIdpiz_pizzachois());
								prixpt+=prix;
                        
                        %>
                            <tr>
                                <th scope="row"><%= i++ %></th>
                                <td><img src="../images/<%=pz.getImage() %>" class="pizza-img" alt="Pizza"></td>
                                <td><%= pz.getNom() %></td>
                                <td><%= lcm.getQte_lignecom() %></td>
                                
                                <td><%= prix*lcm.getQte_lignecom() %> DT</td>
                            </tr>
                            
                           <%} %>
                            
                            <!-- Ajouter plus de lignes si nécessaire -->
                        </tbody>
                    </table>
                </div>
                <!-- Informations de facturation -->
                <div class="mt-4 text-end ">
                    <div>
                        <span style="color:#000"><strong>Total : </strong></span>
                        <span style="color:#000"><%= prixpt %> DT</span>
                    </div>
                    <div class="divider"></div>
                    <div class="gray-text">
                        <span style="color:#000"><strong>Prix de livraison : </strong></span>
                        <span style="color:#000">7 DT</span>
                    </div>
                    <div class="divider"></div>
                    <div>
                        <span style="color:#000"><strong >Total à payer : </strong></span>
                        <span style="color:#000"><%= prixpt+7 %> DT</span>
                    </div>
                </div>
                <!-- Fin du contenu de la carte -->
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