<%@page import="modele.Client"%>
<%@page import="DAO.ClientDAO"%>
<%@page import="modele.Chefcuisiner"%>
<%@page import="DAO.ChefcuisinerDAO"%>
<%@page import="modele.Livreur"%>
<%@page import="DAO.LivreurDAO"%>
<%@page import="DAO.PizzaDAO"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>

<%@ page import="modele.Pizza, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.admin}">
	<jsp:forward page="../admin/authentificationAdmin.jsp" />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<!-- <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>  -->

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">


			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">

				<li class="nav-item"><a class="nav-link"
					data-widget="navbar-search" href="#" role="button"> <i
						class="fas fa-search"></i>
				</a>
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">


			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="dist/img/AdminLTELogo.png"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">Administrateur</a>
					</div>
				</div>


				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item menu-open"><a href="accueilAdmin.jsp"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									Dashboard
									<!-- <i class="right fas fa-angle-left"></i> -->
								</p>
						</a></li>



						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-plus"></i>
								<p>
									Pizza <i class="fas fa-angle-left right"></i> <span
										class="badge badge-info right">3</span>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="listPizza.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Pizza</p>
								</a></li>
								<li class="nav-item"><a href="listTaille.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Taille</p>
								</a></li>
								<li class="nav-item"><a href="listIngredient.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Ingredients</p>
								</a></li>
							</ul></li>




						<li class="nav-item"><a href="chefProfile.jsp"
							class="nav-link"> <i class="nav-icon fas fa-user"></i>
								<p>
									Chef cuisinier

									<!-- <span class="badge badge-info right">6</span> -->
								</p>
						</a></li>
						<li class="nav-item"><a href="ListeLivreur.jsp"
							class="nav-link"> <i class="nav-icon fas fa-car"></i>

								<p>Livreurs</p>
						</a>
						<li class="nav-item"><a
							href="../AdminController?action=deconnexion" class="nav-link">
								<i class="nav-icon fas fa-sign-out-alt"></i>
								<p>Déconnexion</p>
						</a></li>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Dashboard</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="accueilAdmin.jsp">Accueil</a></li>

							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">

				<% 
    PizzaDAO pz = new PizzaDAO();
    List<Pizza> lstpiz = pz.getAll();
    int p = lstpiz.size(); 
    session.setAttribute("p", p);
%>
				<% 
    LivreurDAO liv = new LivreurDAO();
    List<Livreur> lstliv = liv.findAll();
    int l = lstliv.size(); 
    session.setAttribute("l", l);
%>
				<% 
    ChefcuisinerDAO chef = new ChefcuisinerDAO();
    List<Chefcuisiner> lstchef = chef.findAll();
    int c = lstchef.size(); 
    session.setAttribute("c", c);
%>
				<% 
    ClientDAO client = new ClientDAO();
    List<Client> lstcli = client.findAll();
    int cli = lstcli.size(); 
    session.setAttribute("cli", cli);
%>





				<div class="container-fluid">
					<!-- Small boxes (Stat box) -->
					<div class="row">




						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-info">
								<div class="inner">
									<h3><%= p %></h3>

									<p>Pizza</p>
								</div>
								<div class="icon">

									<i class="ion ion-pizza"></i>



								</div>
								<a href="listPizza.jsp" class="small-box-footer">Voir Plus <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>



						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-success">
								<div class="inner">
									<h3><%= l %></h3>

									<p>Livreurs</p>
								</div>
								<div class="icon">
									<i class="nav-icon fas fa-car"></i>
								</div>
								<a href="ListeLivreur.jsp" class="small-box-footer">Voir
									Plus <i class="fas fa-arrow-circle-right"></i>
								</a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-warning">
								<div class="inner">
									<h3><%= c %></h3>

									<p>Chefs</p>
								</div>
								<div class="icon">
									<i class="nav-icon fas fa-user"></i>
								</div>
								<a href="chefProfile.jsp" class="small-box-footer">Voir Plus
									<i class="fas fa-arrow-circle-right"></i>
								</a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-danger">
								<div class="inner">
									<h3><%= cli %></h3>

									<p>Clients</p>
								</div>
								<div class="icon">

									<i class="nav-icon fas fa-users"></i>
								</div>
								<a href="#" class="small-box-footer">Voir Plus <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
					</div>

				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>



		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<strong>Copyright &copy; 2023-2024 <a
				href="accueilAdmin.jsp">Pizza.Sfaxienne</a>.
			</strong>

		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script src="plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
	<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="plugins/moment/moment.min.js"></script>
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="dist/js/pages/dashboard.js"></script>
</body>
</html>

