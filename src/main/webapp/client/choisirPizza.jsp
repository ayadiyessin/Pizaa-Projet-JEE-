<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Choisir Pizza</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
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
                        <span>Détaille Pizza</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
    
	<section class="ftco-section heading-section-dark">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-8">
				
					<h2 class="mb-4">Choisir le taille et l'ingrendiant de la pizza</h2>

						<img src="../images/pizza-8.jpg" alt="" class="img-fluid">
					</p>
					<p>Molestiae cupiditate inventore animi, maxime sapiente optio,
						illo est nemo veritatis repellat sunt doloribus nesciunt! Minima
						laborum magni reiciendis qui voluptate quisquam voluptatem soluta
						illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti
						tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor
						minima esse vero ut ea, repudiandae suscipit!</p>





				</div>
				<!-- .col-md-8 -->
				<div class="col-md-4 sidebar">
					<form action="../index.jsp" class="contact-form">

  						

					<div class="sidebar-box">
						<div class="categories">
						<br>
						<br>
							<h3>Ingrédiant</h3>

							<li><div class="form-group"><input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
							  <label for="vehicle1"> I have a bike</label></div></li>
							<li><div class="form-group"><input type="checkbox" id="vehicle2" name="vehicle2" value="Car">
							  <label for="vehicle2"> I have a car</label></div></li>
							<li><div class="form-group"><input type="checkbox" id="vehicle3" name="vehicle3" value="Boat">
								<label for="vehicle3"> I have a dog</label></div></li>
						</div>
					</div>
					
					<div class="sidebar-box">
						<div class="categories">
							<h3>Taille de pizza</h3>

							<li><div class="form-group"><input type="radio" id="html" name="fav_language" value="HTML">
  									<label for="html">HTML</label></div></li>
							<li><div class="form-group"><input type="radio" id="css" name="fav_language" value="CSS">
  									<label for="css">CSS</label></div></li>
							<li><div class="form-group"><input type="radio" id="javascript" name="fav_language" value="JavaScript">
  									<label for="javascript">JavaScript</label></div></li>
						</div>
					</div>
						<div class="form-group btnch">
                			<input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
              			</div>
					</form>

				</div>

			</div>
		</div>
	</section>
	<!-- .section -->

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
</html>