<html lang="en">
	<head>
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		<%@ page import="Clases.*" %>
		<%@ page import="java.util.*" %>
		
		<title>PC</title>

		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:100,400,700|" rel="stylesheet" type="text/css">
		<link href="../fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="../fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">

		<!-- Loading main css file -->
		<link rel="stylesheet" href="../style.css">
		
		<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->

	</head>
	
<%
		Videojuego videojuego = new Videojuego();
		int id_videojuego=0;
		BDController controladorBD = new BDController();

		
		if (!request.getParameter("id_videojuego").isEmpty()){
			id_videojuego = Integer.parseInt(request.getParameter("id_videojuego"));
			videojuego = controladorBD.dameJuego(id_videojuego);
		}
		
		%>

	<body>
		
		<div id="site-content">
			<div class="site-header">
				<div class="container">
					<a href="../index.jsp" id="branding">
						<img src="../images/logo.png" alt="" class="logo">
						<div class="logo-text">
							<h1 class="site-title">NelsON Games</h1>
							<small class="site-description">Reinventing the future</small>
						</div>
					</a> <!-- #branding -->

					<div class="right-section pull-right">
						<a href="../index.jsp">Logout <small>(Admin)</small></a>
					</div> <!-- .right-section -->

					<div class="main-navigation">
						<button class="toggle-menu"><i class="fa fa-bars"></i></button>
						<ul class="menu">
							<li class="menu-item home current-menu-item"><a href="index.jsp"><i class="icon-home"></i></a></li>
							<li class="menu-item"><a href="videojuegoslist.jsp">Videojuego</a></li>
							<li class="menu-item"><a href="clienteslist.jsp">Cliente</a></li>
							<li class="menu-item"><a href="localeslist.jsp">Local </a></li>
							<li class="menu-item"><a href="generoslist.jsp">Género </a></li>
							<li class="menu-item"><a href="formatoslist.jsp">Formato </a></li>
							<li class="menu-item"><a href="distribuidoreslist.jsp">Distribuidor </a></li>
							<li class="menu-item"><a href="desarrolladoraslist.jsp">Desarrolladora </a></li>
						</ul> <!-- .menu -->
						<div class="mobile-navigation"></div> <!-- .mobile-navigation -->
					</div> <!-- .main-navigation -->
				</div> <!-- .container -->

					<div class="breadcrumbs">
						<div class="container">
							<a href="../index.jsp">Home</a>
							<a href="../bajas.jsp">Bajas</a>
							<span>Videojuegos</span>
						</div>
					</div>

				</div> <!-- .container -->
			</div> <!-- .site-header -->
			<main class="main-content">
				<div class="container">
					<div class="page">
						
						<div class="product-list">
							
							<section>
								<h3>Modificar videojuego</h3>
								
								<form action="../operaciones_mod.jsp?accion=ModificarVideojuego" method="post">
									<div>
										<div class="">
											<input type="text" name="nombre_genero" id="nombre_genero" required style="width:163px" placeholder="Nombre del género" value="<%=controladorBD.dameNombreGenero(videojuego.getId_genero()) %>"/>
										</div>
										<br>
										<div class="">
											<input type="number" name="ncopias" id="ncopias" required placeholder="Número de copias" value="<%=videojuego.getNcopias()%>"/>
										</div>
										<br>
										<div class="">
											<input type="number" name="duracion" id="duracion" required placeholder="Duracion en minutos" value="<%=videojuego.getDuracion()%>"/>
										</div>
										<br>			
										<div class="">
											<input type="text" name="nombre" id="nombre" required placeholder="Nombre del juego" required style="width:163px" value="<%=videojuego.getNombre()%>"/>
										</div>	
										<div class="">
											<input type="text" name="pegi" id="pegi" required placeholder="Pegi" required style="width:163px" value="<%=videojuego.getPegi()%>"/>
										</div>	
										<br>
										<div class="">
											<input type="text" name="nombre_distribuidor" id="nombre_distribuidor" required placeholder="Nombre del distribuidor" style="width:163px" value="<%=controladorBD.dameNombreDistribuidor(videojuego.getId_distribuidor())%>"/>
										</div>
										<br>
										<div class="">
											<input type="number" step="0.01" name="precio" id="precio" required placeholder="Precio juego" value="<%=videojuego.getPrecio()%>"/>
										</div>
										<br>
										<div class="">
											<input type="text" name="consola" id="consola" required placeholder="Consola" style="width:163px" value="<%=videojuego.getConsola()%>"/>
										</div>
										<br>
										<div class="">
											<input type="number" name="nuevo" id="nuevo" required placeholder="Nuevo/Nonuevo (1,0)" value="<%=videojuego.getNuevo()%>"/>
										</div>
										
										<input type="hidden" value="<%= controladorBD.dameCodigoVideojuegoNombre(videojuego.getNombre())%>" name="id_videojuego" id="id_videojuego">
										
												
									</div>
									<br>
										<input type="submit" class="button" value="Modificar" />
									
								</form>
								
							</section>
						
								
						</div> <!-- .product-list -->
					</div>
				</div> <!-- .container -->
			</main> <!-- .main-content -->

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
							</div> <!-- .widget -->
						</div> <!-- column -->
						<div class="col-md-2">
							<div class="widget">
								<h3 class="widget-title">Servicio de paquetería</h3>
								<ul class="no-bullet">
									<li><a href="#">Envios</a></li>
									<li><a href="#">Devoluciones</a></li>
									<li><a href="#">Pedidos</a></li>
								</ul>
							</div> <!-- .widget -->
						</div> <!-- column -->
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
							</div> <!-- .widget -->
						</div> <!-- column -->
						<div class="col-md-6">
							<div class="widget">
								<h3 class="widget-title">¿Quieres recibir notificaciones?</h3>
								<form action="#" class="newsletter-form">
									<input type="text" placeholder="Inserta tu email...">
									<input type="submit" value="Suscribirse">
								</form>
							</div> <!-- .widget -->
						</div> <!-- column -->
					</div><!-- .row -->

					<div class="colophon">
						<div class="copy">Copyright 2021 NelsON Games. All rights reserved.</div>
						<div class="social-links square">
							<a href="#"><i class="fa fa-facebook"></i></a>
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-google-plus"></i></a>
							<a href="#"><i class="fa fa-pinterest"></i></a>
						</div> <!-- .social-links -->
					</div> <!-- .colophon -->
				</div> <!-- .container -->
			</div> <!-- .site-footer -->
		</div>

		<div class="overlay"></div>

		<div class="auth-popup popup">
			<a href="#" class="close"><i class="fa fa-close"></i></a>
			<div class="row">
				<div class="col-md-6">
					<h2 class="section-title">Inicio de sesión</h2>
					<form action="#">
                    <input type="text" id="nombreLogin" placeholder="Nombre de usuario...">
                    <input type="password" id="passLogin" placeholder="Contraseña...">
                    <input type="button" id="enviarLogin" onclick="Revisar()" value="Iniciar sesion">
                </form>
                </div>
				<div class="col-md-6">
					<h2 class="section-title">Crear una cuenta</h2>
					<form action="#">
						<input type="text" placeholder="Nombre de usuario...">
						<input type="text" placeholder="Email...">
						<input type="text" placeholder="ContraseÃ±a...">
						<input type="submit" value="Registrarse">
					</form>
				</div> <!-- .column -->
			</div> <!-- .row -->
		</div> <!-- .auth-popup -->

		<script src="../js/jquery-1.11.1.min.js"></script>
		<script src="../js/plugins.js"></script>
		<script src="../js/app.js"></script>
		
	</body>

</html>