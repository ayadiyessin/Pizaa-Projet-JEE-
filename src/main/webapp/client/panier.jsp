<%@page import="modele.Client"%>
<%@page import="DAO.PizzaDAO"%>
<%@page import="modele.Pizzachoisie"%>
<%@page import="DAO.PizzachoisieDAO"%>
<%@page import="DAO.LignecommandeDAO"%>
<%@page import="modele.Lignecommande"%>
<%@page import="modele.Commande"%>
<%@page import="DAO.CommandeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="modele.Pizza, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Panier</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">




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

					<li class="nav-item"><a href="../about.jsp" class="nav-link">À propos</a></li>
				</ul>
				
				<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="panier.jsp"><i class="fa fa-shopping-cart"></i></a></li>
						<li class="nav-item"><a class="nav-link"><i class="fa fa-user"></i></a></li>
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
                        <span>Panier</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
	<section class="before-footer-section">
		<% 
			Long idcli = (long) 1;
			CommandeDAO cmdao = new CommandeDAO();
			Commande cm = cmdao.getComNonValiderClient(idcli);
			
			LignecommandeDAO lcdao = new LignecommandeDAO();
			List<Lignecommande> listLcm = lcdao.getAllLignecomparCom(cm.getId_com());
			
			double prixpt=0;
			session.setAttribute("listLigneCom", listLcm);
		%>
            <div class="container">
              <div class="row mb-5">
                <form class="col-md-12" method="post">
                  <div class="site-blocks-table">
                    <table class="table">
                      <thead>
                        <tr>
                          <th class="product-thumbnail">Image</th>
                          <th class="product-name">Product</th>
                          <th class="product-price">Price</th>
                          <th class="product-quantity">Quantity</th>
                          <th class="product-total">Total</th>
                          <th class="product-remove">Remove</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                      		PizzachoisieDAO pzchdao = new PizzachoisieDAO();
                      		PizzaDAO pzdao = new PizzaDAO();
 							for(Lignecommande lcm:listLcm){ 
 								Pizzachoisie pzch = pzchdao.findById(lcm.getIdpiz_lignecom());
 								double prix = pzchdao.prixPizz(pzch.getId_pizzachois());
 								Pizza pz = pzdao.findById(pzch.getIdpiz_pizzachois());
 								prixpt+=prix;
 					  %>

                        <tr>
                          <td class="product-thumbnail">
                            <img src="../images/<%=pz.getImage() %>" alt="Image" class="img-fluid-panier">
                          </td>
                          <td class="product-name">
                            <h2 class="h5 text-black"><%= pz.getNom() %></h2>
                          </td>
                          <td><%= prix %> DT</td>
                          <td>
                          <div class="input-group mb-3 d-flex align-items-center quantity-container">
							    <div class="input-group-prepend">
							        <button type="button" class="btn btn-black decrease" data-id="<%=lcm.getId_lignecom() %>">-</button>
							    </div>
							    <input type="text" class="form-panier text-center quantity-amount" value="<%= lcm.getQte_lignecom() %>" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
							    <div class="input-group-append">
							        <button class="btn btn-black increase" type="button" data-id="<%=lcm.getId_lignecom() %>">+</button>
							    </div>
							</div>
                          
                          <!-- <div class="input-group mb-3 d-flex align-items-center quantity-container">
                              <div class="input-group-prepend">
                                <button type="button" class="btn btn-black decrease" data-id="<%=lcm.getIdpiz_lignecom() %>">-</button>
                              </div>
                              <input type="text" class="form-panier text-center quantity-amount" value=<%= lcm.getQte_lignecom() %> placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                              <div class="input-group-append">
                                <button class="btn btn-black increase" type="button" data-id="<%=lcm.getIdpiz_lignecom() %>">+</button>
                              </div>
                            </div>-->
        
                          </td>
                          
                          <td><%= prix*lcm.getQte_lignecom() %> DT</td>
                          <td>
                          	<a href='../PanierController?idlc=<%= lcm.getId_lignecom() %>&supp=true' class="btn btn-black btn-sm">X</a>

                          </td>
                          		
                        </tr>
        

                        <%
						}
						%>
                      </tbody>
                    </table>
                  </div>
                </form>
              </div>
        
              <div class="row">
                <div class="col-md-6">

                </div>
                <div class="col-md-6 pl-5">
                  <div class="row justify-content-end">
                    <div class="col-md-7">
                      <div class="row">
                        <div class="col-md-12 text-center border-bottom mb-5">
                          <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col-md-6">
                          <span class="text-black">Subtotal</span>
                        </div>
                        <div class="col-md-6 text-right">
                          <strong class="text-black"><%= prixpt %> DT</strong>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col-md-6">
                          <span class="text-black">Livraison</span>
                        </div>
                        <div class="col-md-6 text-right">
                          <strong class="text-black"> 7 DT</strong>
                        </div>
                      </div>
                      <div class="row mb-5">
                        <div class="col-md-6">
                          <span class="text-black">Total</span>
                        </div>
                        <div class="col-md-6 text-right">
                          <strong class="text-black"><%= prixpt+7 %> DT</strong>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-md-12">
                          <% 
							Client c = (Client)session.getAttribute("client");
						%>
                        <form action="../PanierController" method="post">
                        	<input type="hidden" name="idcomach" value=<%= cm.getId_com() %>>
                        	<input type="hidden" name="idcliach" value=<%= c.getId() %>>
                          	<button class="btn btn-primary py-3 px-5 " name="acheter">Acheter</button>
                        </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
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
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<script type="text/javascript">
$(document).ready(function() {
    $('.quantity-container .increase').on('click', function() {
        var quantityAmount = $(this).closest('.quantity-container').find('.quantity-amount');
        var value = parseInt(quantityAmount.val(), 10);
        value = isNaN(value) ? 0 : value;
        value++;
        quantityAmount.val(value);

        var dataId = $(this).data('id');
        redirectToPanierControler(dataId, value);
    });

    $('.quantity-container .decrease').on('click', function() {
        var quantityAmount = $(this).closest('.quantity-container').find('.quantity-amount');
        var value = parseInt(quantityAmount.val(), 10);
        value = isNaN(value) ? 0 : value;
        if (value > 1) {value--;
        	quantityAmount.val(value);

        	var dataId = $(this).data('id');
        	redirectToPanierControler(dataId, value);
        
        }
        else {
            // Affichage d'une alerte à l'utilisateur
        	Swal.fire({
                title: "Impossible d'effectuer cette action",
                text: "La valeur minimale est déjà atteinte",
                icon: "warning",
                showConfirmButton: true // Afficher le bouton de confirmation
            });
            
        }

        
    });

    function redirectToPanierControler(dataId, value) {
        window.location.href = '../PanierController?dataId=' + dataId + '&value=' + value;
    }
});

/*(function() {
	'use strict';

	var tinyslider = function() {
		var el = document.querySelectorAll('.testimonial-slider');

		if (el.length > 0) {
			var slider = tns({
				container: '.testimonial-slider',
				items: 1,
				axis: "horizontal",
				controlsContainer: "#testimonial-nav",
				swipeAngle: false,
				speed: 700,
				nav: true,
				controls: true,
				autoplay: true,
				autoplayHoverPause: true,
				autoplayTimeout: 3500,
				autoplayButtonOutput: false
			});
		}
	};
	tinyslider();

	


	var sitePlusMinus = function() {

		var value,
    		quantity = document.getElementsByClassName('quantity-container');

		function createBindings(quantityContainer) {
	      var quantityAmount = quantityContainer.getElementsByClassName('quantity-amount')[0];
	      var increase = quantityContainer.getElementsByClassName('increase')[0];
	      var decrease = quantityContainer.getElementsByClassName('decrease')[0];
	      increase.addEventListener('click', function (e) { increaseValue(e, quantityAmount); });
	      decrease.addEventListener('click', function (e) { decreaseValue(e, quantityAmount); });
	    }

	    function init() {
	        for (var i = 0; i < quantity.length; i++ ) {
						createBindings(quantity[i]);
	        }
	    };

	    function increaseValue(event, quantityAmount) {
	        value = parseInt(quantityAmount.value, 10);

	        console.log(quantityAmount, quantityAmount.value);

	        value = isNaN(value) ? 0 : value;
	        value++;
	        quantityAmount.value = value;
	    }

	    function decreaseValue(event, quantityAmount) {
	        value = parseInt(quantityAmount.value, 10);

	        value = isNaN(value) ? 0 : value;
	        if (value > 0) value--;

	        quantityAmount.value = value;
	    }
	    
	    init();
		
	};
	sitePlusMinus();


})()*/
</script>
</html>