<%@page import="modele.Livreur,java.util.*"%>
<%@page import="DAO.LivreurDAO"%>

<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${empty sessionScope.admin}">
	<jsp:forward page="../admin/authentificationAdmin.jsp" />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Livreur</title>

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
							class="nav-link "> <i class="nav-icon fas fa-tachometer-alt"></i>
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
							class="nav-link active"> <i class="nav-icon fas fa-car"></i>
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
							<h1 class="m-0">Livreur</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="accueilAdmin.jsp">Accueil</a></li>
								<li class="breadcrumb-item"><a href="ListeLivreur.jsp">Liste
										des Livreurs</a></li>
								<li class="breadcrumb-item active">Livreur</li>
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

			<div>
				<%
				String idParam = request.getParameter("id");
				long id = Long.parseLong(idParam);
				LivreurDAO l = new LivreurDAO();
				Livreur liv = l.findById(id);
				session.setAttribute("liv", liv);
				%>



				<!-- Main content -->
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">
						<!-- Widget: user widget style 1 -->
						<div class="card card-widget widget-user">
							<!-- Add the bg color to the header using any of the bg-info nbedel colour profile classes -->
							<div class="widget-user-header badge-success">
								<h4 class="widget-user-desc"><%=liv.getNom()%>
									<%=liv.getPrenom()%>
								</h4>

							</div>
							<div class="widget-user-image">
								<img class="img-circle elevation-2"
									src="dist/img/<%=liv.getImage()%>"
									style="width: 100px; height: 100px" id="LOGO_ENT"
									alt="User Avatar" />
							</div>
							<div class="card-footer">
								<div class="row">
									<div class="col-sm-6 border-right">
										<div class="description-block">
											<span class="description-text">Login</span>
											<h5 class="description-header"><%=liv.getLogin()%></h5>
										</div>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->

									<!-- /.col -->
									<div class="col-sm-6">
										<div class="description-block">
											<span class="description-text">Numéro téléphone</span>
											<h5 class="description-header"><%=liv.getNumtel()%></h5>
										</div>
										<!-- /.description-block -->
									</div>

									<!-- /.col -->
								</div>
								<br />

							</div>

							<!-- /.widget-user -->

							<!-- /.content -->
							<!--<section class="content">
                <form>
                  
                  <div class="card-footer">


                    <a class="btn btn-info btn-sm" href="voirLivreur.jsp">
                      <i class="fas fa-pencil-alt">
                      </i>
                    </a>
                  </div>
                </form>

              </section> -->
						</div>
					</div>
				</div>
			</div>


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

