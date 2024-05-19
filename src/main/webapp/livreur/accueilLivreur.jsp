<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/responsive/3.0.2/css/responsive.bootstrap5.min.css" rel="stylesheet">
 <!-- Lien vers Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css" rel="stylesheet">
  
     <link rel="stylesheet" href="../styleyessin.css">


    </head>

    <body>
    
                    
        <section>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
			                <h3 class="card-title mb-0">Liste des commandes à livrer</h3>
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
                                        <th>Client</th>
                                        <th>Prix</th>
                                        <th>Etat</th>
                                        <th> Commande </th>
                                    </tr>
                                </thead>
                                <tbody id="listeDemandeurtable">
                                    <tr>
                                        <td>Tridennnnt</td>
                                        <td>22-02-2024</td>
                                        <td><a href="#" data-bs-toggle="modal" data-bs-target="#profile">nom Client</a></td>
                                        <td>2500</td>
                                        <td><a href="#" data-bs-toggle="modal" data-bs-target="#LancerLivrisonModal"> Lancer la livraison  </a> / 
                                        <a href="#" data-bs-toggle="modal" data-bs-target="#FinaliserLivrisonModal"> Finaliser la livraison  </a>
                                        </td>
                                        <td> <a href="#" data-bs-toggle="modal" data-bs-target="#ComModal">voir commandes </a></td>
                                    </tr>
                                    <tr>
                                        <td>Trident</td>
                                        <td>Internet Explorer 5.0</td>
                                        <td>Win 95+</td>
                                        <td>5</td>
                                        <td>C</td>
                                        <td>view</td>
                                    </tr>
                                    <tr>
                                        <td>Trident</td>
                                        <td>Internet Explorer 5.5</td>
                                        <td>Win 95+</td>
                                        <td>5.5</td>
                                        <td>A</td>
                                        <td>view</td>
                                    </tr>
                                    <tr>
                                        <td>Trident</td>
                                        <td>Internet Explorer 6</td>
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
                                        <th>Client</th>
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
<!-- lancerLIVRISON MODAL -->
<div class="modal fade" id="LancerLivrisonModal" tabindex="-1" aria-labelledby="LancerLivrisonModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="livraisonModalLabel">Lancer la livraison ?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Êtes-vous sûr de vouloir lancer la livraison ?</p>
      </div>
      <div class="modal-footer">
        <!-- Bouton Annuler -->
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
        <!-- Bouton Lancer -->
        <button type="button" class="btn btn-primary">Lancer</button>
      </div>
    </div>
  </div>
  </div>
<!-- FinaliserLivrisonModal MODAL -->
<div class="modal fade" id="FinaliserLivrisonModal" tabindex="-1" aria-labelledby="FinaliserLivrisonModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="livraisonModalLabel">Finaliser la livraison ?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Êtes-vous sûr de vouloir finaliser la livraison ?</p>
      </div>
      <div class="modal-footer">
        <!-- Bouton Annuler -->
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
        <!-- Bouton Lancer -->
        <button type="button" class="btn btn-primary">Finaliser</button>
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