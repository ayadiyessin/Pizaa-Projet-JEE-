<%@page import="modele.Livreur"%>
<%@page import="DAO.LivreurDAO"%>
<%@page import="modele.Chefcuisiner"%>
<%@page import="DAO.ChefcuisinerDAO"%>
<%@page import="DAO.PizzaDAO"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="modele.Pizza, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Liste des livreurs</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->


  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">


    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">

      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>

  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">


    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Pizza</a>
        </div>
      </div>


      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="accueilAdmin.jsp" class="nav-link " >
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <!-- <i class="right fas fa-angle-left"></i> -->
              </p>
            </a>

          </li>
          
          
          
            <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-plus"></i>
              <p>
              Pizza
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">3</span>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="listPizza.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pizza</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="listTaille.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Taille</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="listIngredient.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Ingredients</p>
                </a>
              </li>
            </ul>
          </li>
          

          
          
          <li class="nav-item">
            <a href="chefProfile.jsp" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>
                Chef cuisinier

                <!-- <span class="badge badge-info right">6</span> -->
              </p>
            </a>


          </li>
          <li class="nav-item">
            <a href="ListeLivreur.jsp" class="nav-link active">
              <i class="nav-icon fas fa-car"></i>
              <p>
                Livreurs
              </p>
            </a>
            
                                 <li class="nav-item">
            <a href="authentificationAdmin.jsp" class="nav-link">
              <i class="nav-icon fas fa-sign-out-alt"></i>
              <p>
                Déconnexion
              </p>
            </a>
            </li>


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
              <h1 class="m-0">Liste des Livreurs</h1>

            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="accueilAdmin.jsp">Accueil</a></li>
                <li class="breadcrumb-item active">Liste des Livreurs</li>
              </ol>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->


      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Liste des Livreurs</h3>
                  <div class="card-tools">
            <div class="input-group input-group-sm" style="width: 150px;padding-left:10px;">
               <a class="btn btn-primary float-right" href='AjoutLivreur.jsp'><i class='fas fa-plus'></i> Ajouter</a> 
              <div class="input-group-append">

              </div>
            </div>
          </div>
                </div>
                <div class="card-body">
                <% 
					LivreurDAO l = new LivreurDAO();
					List<Livreur> lstl = l.findAll();
					session.setAttribute("listl", lstl);
				%>
                   <section class='content  '>
                      <div class='row'>
                       <c:if test="${not empty listl}">
                        <c:forEach items="${listl}" var="c" varStatus="status">
                        <div class='col-12 col-sm-6 col-md-12 d-flex align-items-stretch flex-column'>
                          <div class='card bg-light d-flex flex-fill'>
                            <div class='card-header text-muted border-bottom-0'>
                            </div>
                            <div class='card-body pt-0'>

                              <div class='row'>
                                <div class='col-11'>

                                  <ul class='ml-4 mb-0 fa-ul text-muted' id='listADM'>
                                  <h6 id='icon'><b>${c.getNom()} ${c.getPrenom()} </b></h6>
                                    <li id='icon' class='item'><span></span> <b>Login : </b>  ${c.getLogin()}</li>
                                    <li id='icon' class='item'><span></span> <b>Password : </b>  ${c.getPassword()}</li>

                                  </ul>
                                  
                                </div>
                                <div class='col-1 d-flex justify-content-center'>
                                    <td><div  class='project-actions text-center' style=' margin-top: 15px;'>
                                     <a class='btn btn-primary btn-sm' href='Livreur.jsp?id=${c.getId()}'><i class='fas fa-eye'></i></a> </div></td>
                                 </div>
                                
                              </div>

                            </div>
                            
                          </div>

                        </div>


                        
                          </c:forEach>
                         </c:if>
                      </div>
                    </section>

                  <!-- <a class='btn btn-danger btn-sm'   href='suppClient.php?id=$row[0]'' ><i class='fas fa-trash'></i></a> -->
                  <!-- <i id='icon' class='fas  fa-envelope' -->
                  
                </div>

              </div>
            </div>
          </div>
        </div>
      </section>





    </div>


  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2023-2024 <a href="accueilAdmin.jsp">Pizza.Sfaxienne</a>.</strong>

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
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
</body>
</html>

    