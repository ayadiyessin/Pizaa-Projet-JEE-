<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Administrateur | Login </title>
  <link rel="icon" type="image/png" href="../dist/img/logoFooter.png">

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  
</head>
<body class="hold-transition login-page">
  <!-- Preloader
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="../dist/img/Recrute.fr.png" alt="AdminLTELogo" >
  </div> -->
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <h1><b>Pizza</b></h1>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Se Connecter</p>

      <form method='post' action='verifLogin.php' enctype="multipart/form-data" id="form">
        <div class="input-group mb-3">
          <input type="email" name="email_admin" class="form-control"  placeholder="Adresse e-mail">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="motpasse_admin" class="form-control"  placeholder="Mot de passe">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
            <button type="submit" class="btn btn-primary">Se Connecter</button>
            </div>
        </div>
      </form>


      <!--<p class="mb-1">
        <a href="oblierPSW.html">Mot de passe oublié ?</a>
      </p>-->
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->
<!--alert-->
<script src="https://unpKg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>

<script src="plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="plugins/jquery-validation/additional-methods.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

</body>
</html>