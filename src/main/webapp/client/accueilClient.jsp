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
        <title>Accueil Client | Client</title>

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
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  



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
					<li class="nav-item active"><a href="../index.jsp"
						class="nav-link">Accueil</a></li>

					<li class="nav-item"><a href="../about.jsp" class="nav-link">À
							propos</a></li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="panier.jsp"><i class="fa fa-shopping-cart"></i></a></li>
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
                        <span>Liste des commandes </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
                    
        <section>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
			                <h3 class="card-title mb-0">Liste des commandes</h3>
			                <div class="input-group ms-auto" style="width: 250px;">
                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                    <input id="myInput" class="form-control" type="text" placeholder="Rechercher..">
                </div>
			            </div>
                        <% 
                        	long idcli=1;
							CommandeDAO co = new CommandeDAO();
							List<Commande> lstCom = co.getAllComValiderDec(idcli);
							session.setAttribute("lstCom", lstCom);
						%>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                
                                    <tr>
                                        <th>Numero</th>
                                        <th>Date Commande</th>
                                        <th>Etat</th>
                                        <th> Facture </th>
                                    </tr>
                                </thead>
                                <tbody id="listeDemandeurtable">
                                <c:if test="${not empty lstCom}">
                                <c:forEach items="${lstCom}" var="c" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                       <td><fmt:formatDate value="${c.date_com}" pattern="yyyy-MM-dd"/></td>
                                         <td>
                                         <c:choose>
											    <c:when test="${c.etat_com == 'commande livrée'}">
											      Terminer
											    </c:when>
											    
											    <c:otherwise>
											    <a href="#" data-bs-toggle="modal" data-bs-target="#enattenteModal" data-param="${c.etat_com}" data-step="${c.etat_com}">En Attente</a>
											    
											       <!-- <a href="#" data-bs-toggle="modal"  data-bs-target="#enattenteModal" data-param="${c.etat_com}"> En  Attente  </a>
                                        --> 
											    </c:otherwise>
											</c:choose>
                                         
                                         
                                       <!-- <a href="#" data-bs-toggle="modal" data-bs-target="#enattenteModal"> En  Attente  </a> / 
                                         Terminer-->
                                        </td>
                                        <td> <a href="DetailFacture.jsp?id=${c.id_com}">Detail Facture </a></td>
                                    </tr>
                                    </c:forEach>
                                    </c:if>
                                   
                                    
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Numero</th>
                                        <th>Date Commande</th>
                                        <th>Etat</th>
                                        <th> Facture  </th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>
            </div>
        </section>


<!-- Etat comm e attente MODAL -->
 <div class="modal fade" id="enattenteModal" tabindex="-1" aria-labelledby="enattenteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="enattenteModalLabel">État de Commande</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <ul class="timeline">
                        <li class="timeline-item" id="etat1">
                            <div class="d-flex align-items-center">
                                <span class="timeline-icon">
                                    <i class="fas fa-circle"></i>
                                </span>
                                <div class="timeline-content">
                                    <h6>Commande en attente de préparation</h6>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-item" id="etat2">
                            <div class="d-flex align-items-center">
                                <span class="timeline-icon">
                                    <i class="fas fa-circle"></i>
                                </span>
                                <div class="timeline-content">
                                    <h6>Commande en cours de préparation</h6>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-item" id="etat3">
                            <div class="d-flex align-items-center">
                                <span class="timeline-icon">
                                    <i class="fas fa-circle"></i>
                                </span>
                                <div class="timeline-content">
                                    <h6>Commande en attente de livraison</h6>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-item" id="etat4">
                            <div class="d-flex align-items-center">
                                <span class="timeline-icon">
                                    <i class="fas fa-circle"></i>
                                </span>
                                <div class="timeline-content">
                                    <h6>Commande en cours de livraison</h6>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-item" id="etat5">
                            <div class="d-flex align-items-center">
                                <span class="timeline-icon">
                                    <i class="fas fa-circle"></i>
                                </span>
                                <div class="timeline-content">
                                    <h6>Commande livrée</h6>
                                </div>
                            </div>
                        </li>
                    </ul>
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
           /* 
              // Exemple de mise à jour des étapes de progression 
           document.addEventListener('DOMContentLoaded', function () {
            // Définir ici l'étape actuelle (1 à 4)
            
            
            const currentStep = 2; // par exemple, "en cours de livraison"

            const items = document.querySelectorAll('.timeline-item');
            for (let i = 0; i < currentStep; i++) {
                items[i].classList.add('active');
                items[i].querySelector('.timeline-icon i').classList.remove('fa-circle');
                items[i].querySelector('.timeline-icon i').classList.add('fa-check-circle');
            }
        });*/
        </script>
        <script>
    document.addEventListener('DOMContentLoaded', function () {
        // Sélectionner l'élément <a> avec le data-step
        const link = document.querySelector('a[data-step]');

        // Ajouter un écouteur d'événements pour le clic sur le lien
        link.addEventListener('click', function () {
            // Récupérer la valeur de data-step
            console.log(link.getAttribute('data-step'));
            let currentStep = 1;

            if(link.getAttribute('data-step') == "en attente"){
                currentStep = 1;
            } else if(link.getAttribute('data-step') == "en cours"){
                currentStep = 2;
            } else if(link.getAttribute('data-step') == "prête"){
                currentStep = 3;
            } else if(link.getAttribute('data-step') == "en cours de livraison"){
                currentStep = 4;
            } else {
                currentStep = 5;
            }

            console.log(currentStep);
            // Sélectionner les éléments de la timeline
            const items = document.querySelectorAll('.timeline-item');
            
            // Activer les étapes jusqu'à currentStep
            for (let i = 0; i < currentStep; i++) {
                items[i].classList.add('active');
                items[i].querySelector('.timeline-icon i').classList.remove('fa-circle');
                items[i].querySelector('.timeline-icon i').classList.add('fa-check-circle');
            }
        });
    });
</script>
        
    </body>

    </html>