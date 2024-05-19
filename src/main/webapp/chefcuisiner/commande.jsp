<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facture de Commande</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/responsive/3.0.2/css/responsive.bootstrap5.min.css" rel="stylesheet">
 <!-- Lien vers Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css" rel="stylesheet">
  
     <link rel="stylesheet" href="../styleyessin.css">

</head>
<body>
    <div class="container mt-5">
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
                            <tr>
                                <th scope="row">1</th>
                                <td><img src="https://images.pexels.com/photos/1049626/pexels-photo-1049626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="pizza-img" alt="Pizza"></td>
                                <td>Margherita</td>
                                <td>2</td>
                                <td>$10</td>
                                <td><a href="#" data-bs-toggle="modal" data-bs-target="#listeINg"> liste Ingredients </a></td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td><img src="https://images.pexels.com/photos/367915/pexels-photo-367915.jpeg?auto=compress&cs=tinysrgb&w=600" class="pizza-img" alt="Pizza"></td>
                                <td>Pepperoni</td>
                                <td>1</td>
                                <td>$12</td>
                                <td>$12</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td><img src="https://images.pexels.com/photos/2619970/pexels-photo-2619970.jpeg?auto=compress&cs=tinysrgb&w=600" class="pizza-img" alt="Pizza"></td>
                                <td>Hawaïenne</td>
                                <td>3</td>
                                <td>$11</td>
                                <td>$33</td>
                            </tr>
                            <!-- Ajouter plus de lignes si nécessaire -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<!-- Modal ingredients -->
<div class="modal fade" id="listeINg" tabindex="-1" aria-labelledby="listeINg" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ingredientsModalLabel">Liste des Ingrédients</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
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
</body>
</html>
