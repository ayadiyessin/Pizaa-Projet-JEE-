<%@page import="modele.Client"%>
<%@page import="DAO.ClientDAO"%>
<%@page import="modele.Commande"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CommandeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Accueil Chef Cuisiner</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/responsive/3.0.2/css/responsive.bootstrap5.min.css" rel="stylesheet">
 <!-- Lien vers Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css" rel="stylesheet">
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
                        <span>Liste des commandes à Preparer</span>
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
			                <h3 class="card-title mb-0">Liste des commandes à préparer</h3>
			               <div class="input-group ms-auto" style="width: 250px;">
			                
			                	<div class="contact-form form-group">
                    				<span class="input-group "><i class="bi bi-search"></i></span>
                    				<input id="myInput" class="form-control bottom-align" type="text" placeholder="Rechercher..">
                    			</div>
                			</div>
			            </div>
                        
                        <!-- /.card-header -->
                        <div class="card-body">
                        <% 
							CommandeDAO co = new CommandeDAO();
							List<Commande> lstCom = co.getAllComValider();
							session.setAttribute("lstCom", lstCom);
						%>
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr class="accueilLiv">
                                        <th>Numero</th>
                                        <th>Date Commande</th>
                                        <th>Client</th>
                                        <th>Etat</th>
                                        <th> Liste Pizza </th>
                                    </tr>
                                </thead>
                                <tbody id="listeDemandeurtable">
                                <c:if test="${not empty lstCom}">
                                <c:forEach items="${lstCom}" var="c" varStatus="status">
                                    <tr class="accueilLiv">
                                        <td>${status.index + 1}</td>
                                        <td><fmt:formatDate value="${c.date_com}" pattern="yyyy-MM-dd"/></td>
                                        <td> 
                                        
                                        <a href="profileClient.jsp?id=${c.getId_Client()}"   >Détail Client</a></td>
                                        
                                        <!-- data-client-id="${c.getId_Client()}" -->
                                        
                                        <td>
                                        	<c:choose>
											    <c:when test="${c.etat_com == 'en attente'}">
											       <!-- <a href="#" data-bs-toggle="modal" data-bs-target="#LancerCommandeModal"  >Lancer la commande</a> --> 
											   		  <a href="#" class="lancer-commande-btn" data-id="${c.getId_com()}" data-bs-toggle="modal" data-bs-target="#LancerCommandeModal">Lancer la commande</a>
  
											    </c:when>
											    <c:when test="${c.etat_com == 'en cours'}">
											       <!-- <a href="#" data-bs-toggle="modal" data-bs-target="#LancerCommandeModal"  >Lancer la commande</a> --> 
											   		  <a href="FinCommande.jsp?id=${c.getId_com()}" >  Finaliser commande  </a>
  
											    </c:when>
											    <c:otherwise>
											        Commande dans le phase de livrision   
                                       
											    </c:otherwise>
											</c:choose>

                                        	
                                        </td>
                                        <td> <a href="commande.jsp?id=${c.id_com}">voir commandes </a></td>
                                    </tr>
                                   </c:forEach>
                                   </c:if>
                                    
                                    
                                </tbody>
                                <tfoot>
                                    <tr class="accueilLiv">
                                        <th>Numero</th>
                                        <th>Date Commande</th>
                                        <th>Client</th>
                                       
                                        <th>Etat</th>
                                        <th> Liste Pizza </th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>
            </div>
        </section>
        <!-- porfil modale -->
		 <div class="modal fade" id="profile" tabindex="-1" aria-labelledby="profile" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Profil de l'utilisateur</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Début du contenu de la carte -->
                <div class="d-none d-lg-block">
                    <!-- Contenu visible uniquement sur les écrans larges -->
                    <p>Nom: John Doe</p>
                    <p>Email: johndoe@example.com</p>
                    <p>Tellephone: 20055401</p>
                    <p>Afresse : lafran km 5</p>
                    <!-- Ajoutez d'autres informations de profil ici -->
                </div>
                <!-- Fin du contenu de la carte -->
            </div>
        </div>
    </div>
</div>
<!--  modal commande  -->
        <div class="modal fade" id="ComModal" tabindex="-1" aria-labelledby="ComModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ComModalLabel">Facture de Commande</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Début du contenu de la carte -->
                        <div>
                            <!-- Informations du profil -->
                            <h5>Informations du client</h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Nom:</strong> John Doe</p>
                                    <p><strong>Email:</strong> johndoe@example.com</p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Téléphone:</strong> 20055401</p>
                                    <p><strong>Adresse:</strong> Lafran km 5</p>
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
                                        <th scope="col">Pizza</th>
                                        <th scope="col">Quantité</th>
                                        <th scope="col">Prix Unitaire</th>
                                        <th scope="col">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Margherita</td>
                                        <td>2</td>
                                        <td>$10</td>
                                        <td>$20</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Pepperoni</td>
                                        <td>1</td>
                                        <td>$12</td>
                                        <td>$12</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Hawaïenne</td>
                                        <td>3</td>
                                        <td>$11</td>
                                        <td>$33</td>
                                    </tr>
                                    <!-- Ajouter plus de lignes si nécessaire -->
                                </tbody>
                            </table>
                        </div>
                        <!-- Informations de facturation -->
                        <div class="mt-4 text-end">
                            <div>
                                <span><strong>Total:</strong></span>
                                <span>$65</span>
                            </div>
                            <div class="divider"></div>
                            <div>
                                <span><strong>Prix de livraison:</strong></span>
                                <span>$7</span>
                            </div>
                            <div class="divider"></div>
                            <div>
                                <span><strong>Total à payer:</strong></span>
                                <span>$72</span>
                            </div>
                        </div>

                        <!-- Fin du contenu de la carte -->
                    </div>
                </div>
            </div>
        </div>
<!-- lancerCommande MODAL -->
<div class="modal fade" id="LancerCommandeModal" tabindex="-1" aria-labelledby="LancerCommandeModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="livraisonModalLabel">Lancer la Commande ?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Êtes-vous sûr de vouloir lancer la commande ?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-primary" id="confirmLancer">Lancer</button>
                </div>
            </div>
        </div>
    </div>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
    <script>
        $(document).ready(function() {
            let commandeId;

            $('.lancer-commande-btn').click(function() {
                commandeId = $(this).data('id');
            });
            console.log(commandeId);

            $('#confirmLancer').click(function() {
                if (commandeId) {
                    // Rediriger vers le servlet de lancer commande avec l'ID de la commande
                    window.location.href = '../CommandeController?id=' + commandeId;
                }
            });
        });
    </script>
<!-- FinaliserCommandeModal MODAL -->
<div class="modal fade" id="FinaliserCommandeModal" tabindex="-1" aria-labelledby="FinaliserCommandeModal" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="livraisonModalLabel">Finaliser la Commande ?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Choisissez un livreur :</p>
        <!-- Liste des livreurs -->
        <div class="list-group">
          <!-- Livreur 1 -->
          <label class="list-group-item">
            <input type="radio" name="livreur" value="livreur1">
            <div class="d-flex w-100 justify-content-between">
              <h5 class="mb-1">Livreur 1</h5>
            </div>
            <p class="mb-1">Nom: John Doe</p>
            <small>Email: livreur1@example.com</small>
          </label>
          <!-- Livreur 2 -->
          <label class="list-group-item">
            <input type="radio" name="livreur" value="livreur2">
            <div class="d-flex w-100 justify-content-between">
              <h5 class="mb-1">Livreur 2</h5>
            </div>
            <p class="mb-1">Nom: Jane Doe</p>
            <small>Email: livreur2@example.com</small>
          </label>
          <!-- Ajoutez plus de livreurs si nécessaire -->
        </div>
      </div>
      <div class="modal-footer">
        <!-- Bouton Annuler -->
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
        <!-- Bouton Finaliser la commande -->
        <button type="button" class="btn btn-primary">Finaliser la commande</button>
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

        <script>
        $(function () {
            $("#example1").DataTable({
                "searching": false,
                "responsive": true,
                "lengthChange": false,
                "autoWidth": false,
                "language": {
                    "sProcessing":     "Traitement en cours...",
                    "sSearch":         "Rechercher&nbsp;:",
                    "sLengthMenu":     "Afficher _MENU_ &eacute;l&eacute;ments",
                    "sInfo":           "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                    "sInfoEmpty":      "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
                    "sInfoFiltered":   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                    "sInfoPostFix":    "",
                    "sLoadingRecords": "Chargement en cours...",
                    "sZeroRecords":    "Aucun &eacute;l&eacute;ment &agrave; afficher",
                    "sEmptyTable":     "Aucune donn&eacute;e disponible dans le tableau",
                    "oPaginate": {
                        "sFirst":      "Premier",
                        "sPrevious":   "Pr&eacute;c&eacute;dent",
                        "sNext":       "Suivant",
                        "sLast":       "Dernier"
                    },
                    "oAria": {
                        "sSortAscending":  ": activer pour trier la colonne par ordre croissant",
                        "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
                    },
                    "select": {
                        "rows": {
                            "_": "%d lignes séléctionnées",
                            "0": "Aucune ligne séléctionnée",
                            "1": "1 ligne séléctionnée"
                        }
                    }
                }
            }).buttons().container().appendTo(
                '#example1_wrapper .col-md-6:eq(0)');
        });

            
            // fonction recherche 
              $(document).ready(function(){
			    $("#myInput").on("keyup", function() {
			      var value = $(this).val().toLowerCase();
			      $("#listeDemandeurtable tr").filter(function() {
			        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			      });
			    });
			  });
        </script>
    </body>

    </html>