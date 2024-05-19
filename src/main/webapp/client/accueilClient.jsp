<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Accueil Client</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/responsive/3.0.2/css/responsive.bootstrap5.min.css" rel="stylesheet">
 <!-- Lien vers Bootstrap Icons -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
   
     <link rel="stylesheet" href="../styleyessin.css">


    </head>

    <body>
    
                    
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
                        
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Numero</th>
                                        <th>Date Commande</th>
                                        <th>Prix</th>
                                        <th>Etat</th>
                                        <th> Commande </th>
                                    </tr>
                                </thead>
                                <tbody id="listeDemandeurtable">
                                    <tr>
                                        <td>Tridennnnt</td>
                                        <td>22-02-2024</td>
                                        
                                        <td>2500</td>
                                        <td><a href="#" data-bs-toggle="modal" data-bs-target="#enattenteModal"> En  Attente  </a> / 
                                         Terminer
                                        </td>
                                        <td> <a href="#" data-bs-toggle="modal" data-bs-target="#ComModal">voir commandes </a></td>
                                    </tr>
                                    <tr>
                                        <td>Trident</td>
                                        
                                        <td>Win 95+</td>
                                        <td>5</td>
                                        <td>C</td>
                                        <td>view</td>
                                    </tr>
                                    <tr>
                                        <td>Trident</td>
                                        
                                        <td>Win 95+</td>
                                        <td>5.5</td>
                                        <td>A</td>
                                        <td>view</td>
                                    </tr>
                                    <tr>
                                        <td>Trident</td>
                                        
                                        <td>Win 98+</td>
                                        <td>6</td>
                                        <td>A</td>
                                        <td>view</td>
                                    </tr>
                                    
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Numero</th>
                                        <th>Date Commande</th>
                                        
                                        <th>Prix</th>
                                        <th>Etat</th>
                                        <th> Commande </th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>
            </div>
        </section>

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
                                    <h6>Commande en cours de livraison</h6>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-item" id="etat4">
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
        });
        </script>
    </body>

    </html>