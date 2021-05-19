<html lang="en">
<head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">
<%@ page import="Clases.*"%>
<%@ page import="java.util.*"%>

<title>PC</title>

<!-- Loading third party fonts -->
<link href="http://fonts.googleapis.com/css?family=Roboto:100,400,700|"
	rel="stylesheet" type="text/css">
<link href="../fonts/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="../fonts/lineo-icon/style.css" rel="stylesheet"
	type="text/css">

<!-- Loading main css file -->
<link rel="stylesheet" href="../style.css">

<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->

</head>

<%
BDController cotroladorBD = new BDController();
%>
<%
ArrayList<Videojuego> juegos = cotroladorBD.dameJuegosConsola("Wii");
%>


<body>

	<div id="site-content">
		<div class="site-header">
			<div class="container">
				<a href="../index.jsp" id="branding"> <img
					src="../images/logo.png" alt="" class="logo">
					<div class="logo-text">
						<h1 class="site-title">NelsON Games</h1>
						<small class="site-description">Reinventing the future</small>
					</div>
				</a>
				<!-- #branding -->

				<div class="right-section pull-right">
					<a href="../index.jsp">Logout <small>(Admin)</small></a>
				</div>
				<!-- .right-section -->

				<div class="main-navigation">
					<button class="toggle-menu">
						<i class="fa fa-bars"></i>
					</button>
					<ul class="menu">
						<li class="menu-item home current-menu-item"><a
							href="index.jsp"><i class="icon-home"></i></a></li>
						<li class="menu-item"><a href="videojuegos.jsp">Videojuego</a></li>
						<li class="menu-item"><a href="clientes.jsp">Cliente</a></li>
						<li class="menu-item"><a href="locales.jsp">Local </a></li>
						<li class="menu-item"><a href="generos.jsp">Género </a></li>
						<li class="menu-item"><a href="formatos.jsp">Formato </a></li>
						<li class="menu-item"><a href="distribuidores.jsp">Distribuidor
						</a></li>
						<li class="menu-item"><a href="desarrolladoras.jsp">Desarrolladora
						</a></li>
						<li class="menu-item"><a href="altasextra.jsp">Uniones</a></li>
					</ul>
					<!-- .menu -->
					<div class="mobile-navigation"></div>
					<!-- .mobile-navigation -->
				</div>
				<!-- .main-navigation -->
			</div>
			<!-- .container -->

			<div class="breadcrumbs">
				<div class="container">
					<a href="../index.jsp">Home</a> <a href="../indexadmin.jsp">Admin</a>
					<a href="../altas.jsp">Altas</a> <span>Alta genero</span>
				</div>
			</div>

		</div>
		<!-- .container -->
	</div>
	<!-- .site-header -->
	<main class="main-content">
		<div class="container">
			<div class="page">


				<div class="product-list">
					<div class="login-box">

						<h2>Alta Genero</h2>

						<form action="../operaciones_alu.jsp?accion=AltaGenero"
							method="post">
							<div>
								<div class="user-box">
									<input type="text" name="nombre" id="nombre" required
										placeholder="Nombre genero" required />
								</div>
								<div class="user-box">
									<input type="text" name="dificultad" id="dificultad" required
										placeholder="Dificultad"/>
								</div>


							</div>
							<br> <input type="submit" class="button" value="Dar de Alta" />

						</form>

					</div>

				</div>
				<!-- .product-list -->
			</div>
		</div>
		<!-- .container -->
	</main>
	<!-- .main-content -->

	<div class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<div class="widget">
						<h3 class="widget-title">Informacion</h3>
						<ul class="no-bullet">
							<li><a href="#">Sobre nosotros</a></li>
							<li><a href="#">FAQ</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Contacto</a></li>
						</ul>
					</div>
					<!-- .widget -->
				</div>
				<!-- column -->
				<div class="col-md-2">
					<div class="widget">
						<h3 class="widget-title">Servicio de paqueterÃ­a</h3>
						<ul class="no-bullet">
							<li><a href="#">Envios</a></li>
							<li><a href="#">Devoluciones</a></li>
							<li><a href="#">Pedidos</a></li>
						</ul>
					</div>
					<!-- .widget -->
				</div>
				<!-- column -->
				<div class="col-md-2">
					<div class="widget">
						<h3 class="widget-title">Mi cuenta</h3>
						<ul class="no-bullet">
							<li><a href="#">Iniciar sesion/Registrarse</a></li>
							<li><a href="#">Opciones</a></li>
							<li><a href="#">Carrito</a></li>
							<li><a href="#">Localizar paquete</a></li>
							<li><a href="#">Cerrar sesiÃ³n</a></li>
						</ul>
					</div>
					<!-- .widget -->
				</div>
				<!-- column -->
				<div class="col-md-6">
					<div class="widget">
						<h3 class="widget-title">¿Quieres recibir notificaciones?</h3>
						<form action="#" class="newsletter-form">
							<input type="text" placeholder="Inserta tu email..."> <input
								type="submit" value="Suscribirse">
						</form>
					</div>
					<!-- .widget -->
				</div>
				<!-- column -->
			</div>
			<!-- .row -->

			<div class="colophon">
				<div class="copy">Copyright 2021 NelsON Games. All rights
					reserved.</div>
				<div class="social-links square">
					<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
						class="fa fa-twitter"></i></a> <a href="#"><i
						class="fa fa-google-plus"></i></a> <a href="#"><i
						class="fa fa-pinterest"></i></a>
				</div>
				<!-- .social-links -->
			</div>
			<!-- .colophon -->
		</div>
		<!-- .container -->
	</div>
	<!-- .site-footer -->
	</div>

	<div class="overlay"></div>

	<div class="auth-popup popup">
		<a href="#" class="close"><i class="fa fa-close"></i></a>
		<div class="row">
			<div class="col-md-6">
				<h2 class="section-title">Inicio de sesión</h2>
				<form action="#">
					<input type="text" id="nombreLogin"
						placeholder="Nombre de usuario..."> <input type="password"
						id="passLogin" placeholder="Contraseña..."> <input
						type="button" id="enviarLogin" onclick="Revisar()"
						value="Iniciar sesion">
				</form>
			</div>
			<div class="col-md-6">
				<h2 class="section-title">Crear una cuenta</h2>
				<form action="#">
					<input type="text" placeholder="Nombre de usuario..."> <input
						type="text" placeholder="Email..."> <input type="text"
						placeholder="ContraseÃ±a..."> <input type="submit"
						value="Registrarse">
				</form>
			</div>
			<!-- .column -->
		</div>
		<!-- .row -->
	</div>
	<!-- .auth-popup -->

	<script src="../js/jquery-1.11.1.min.js"></script>
	<script src="../js/plugins.js"></script>
	<script src="../js/app.js"></script>
	<script src="../js/dropdowns.js"></script>
	<script src="../js/dropdowns2.js"></script>

</body>

</html>