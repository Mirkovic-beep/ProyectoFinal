<!DOCTYPE html>
<html lang="es">
	<head>
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		<%@ page import="Clases.*" %>
		<%@ page import="java.util.*" %>
		
		<title>Home</title>

		<!-- Loading third party fonts -->

		<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">

		<!-- Loading main css file -->
		<link rel="stylesheet" href="style.css">
		
		<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->
		
	</head>	


<%
		//variables
		BDController controladorBD = new BDController();
		String accion = request.getParameter("accion");
		String nombre = "";
		String pegi = "";
		String consola = "";
		String nuevo = "";
		int id_genero = 0;
		int ncopias = 0;
		int duracion = 0;
		int id_videojuego = 0;
		double precio = 0;
		int id_distribuidor = 0;
		int id_desarrolladora = 0;
		int id_local = 0;
		
		String mensaje = "";
			
		//ALTA Videojuego
		
		if (accion.equalsIgnoreCase("AltaVideojuego")){
			
			if (request.getParameter("id_genero").isEmpty()){
				mensaje = "El código del genero no puede estar vacío";
			}else{
				if (controladorBD.existeGenero(Integer.parseInt(request.getParameter("id_genero")))){
					id_genero = Integer.parseInt(request.getParameter("id_genero"));
				}else{
					mensaje = mensaje + "El código del equipo no existe en la BD.";
				}
			}
			
			if (request.getParameter("ncopias").isEmpty()){
				mensaje = mensaje + " El numero de copias no puede estar vacío";
			}else{
				ncopias = Integer.parseInt(request.getParameter("ncopias"));
			}
			
			if (request.getParameter("duracion").isEmpty()){
				mensaje = mensaje + " La duración no puede estar vacía";
			}else{
			duracion = Integer.parseInt(request.getParameter("duracion"));
			}
			
			if (request.getParameter("nombre").equalsIgnoreCase("")){
				mensaje = mensaje + " El nombre no puede estar vacío.";
			}else{
				nombre = request.getParameter("nombre");
			}
			
			if (request.getParameter("pegi").equalsIgnoreCase("")){
				mensaje = mensaje + " El pegi no puede estar vacío.";
			}else{
				pegi = request.getParameter("pegi");
			}
			
			if (request.getParameter("id_distribuidor").isEmpty()){
				mensaje = mensaje + " El id de distribuidor no puede estar vacío";
			}else{
				if (controladorBD.existeDistribuidor(Integer.parseInt(request.getParameter("id_distribuidor")))){
					id_distribuidor = Integer.parseInt(request.getParameter("id_distribuidor"));
				}else{
					mensaje = mensaje + "El código del distribuidor no existe en la BD.";
				}
			}
			
			if (request.getParameter("precio").isEmpty()){
				mensaje = mensaje + " El precio no puede estar vacío";
			}else{
			precio = Double.parseDouble(request.getParameter("precio"));
			}
			
			if (request.getParameter("consola").equalsIgnoreCase("")){
				mensaje = mensaje + " La consola no puede estar vacía.";
			}else{
				consola = request.getParameter("consola");
			}
			
			if (request.getParameter("nuevo").equalsIgnoreCase("")){
				mensaje = mensaje + " El campo nuevo no puede estar vacío.";
			}else{
				nuevo = request.getParameter("nuevo");
			}
				
			//Si la variable mensaje viene vacía es que no ha habido ningún error y todos los datos son correctos
			if (mensaje.equalsIgnoreCase("")){
				id_videojuego = controladorBD.calcularCod_videojuego();
				Videojuego juego = new Videojuego(id_videojuego, id_genero, ncopias, duracion, nombre, pegi,id_distribuidor,precio,consola,nuevo);
				
				controladorBD.insertarJuegoBDD(juego);
								
				mensaje = "Videojuego dado de alta con éxito";
			}else{
				mensaje = "Operación cancelada: " + mensaje;
			}
		}
		
		
	if (accion.equalsIgnoreCase("AltaVideojuegoDesarrolladora")){
			
			if (request.getParameter("id_videojuego").isEmpty()){
				mensaje = "El código del videojuego";
			}else{
				if (controladorBD.existeJuego(Integer.parseInt(request.getParameter("id_videojuego")))){
					id_videojuego = Integer.parseInt(request.getParameter("id_videojuego"));
				}else{
					mensaje = mensaje + "El código del videojuego";
				}
			}		
			
			if (request.getParameter("id_desarrolladora").isEmpty()){
				mensaje = mensaje + " El id de desarrolladora no puede estar vacío";
			}else{
				if (controladorBD.existeDesarrolladora(Integer.parseInt(request.getParameter("id_desarrolladora")))){
					id_desarrolladora = Integer.parseInt(request.getParameter("id_desarrolladora"));
				}else{
					mensaje = mensaje + "El código de la desarrolladora no existe";
				}
			}
			
			//Si la variable mensaje viene vacía es que no ha habido ningún error y todos los datos son correctos
			if (mensaje.equalsIgnoreCase("")){				
				controladorBD.insertarJuegoDesarrolladora(id_videojuego,id_desarrolladora);
				
				mensaje = "Videojuego unido a la desarrolladora indicada";
			}else{
				mensaje = "Operación cancelada: " + mensaje;
			}
		}
	
	if (accion.equalsIgnoreCase("AltaVideojuegoLocal")){
		
		if (request.getParameter("id_videojuego").isEmpty()){
			mensaje = "El código del videojuego";
		}else{
			if (controladorBD.existeJuego(Integer.parseInt(request.getParameter("id_videojuego")))){
				id_videojuego = Integer.parseInt(request.getParameter("id_videojuego"));
			}else{
				mensaje = mensaje + "El código del videojuego";
			}
		}		
		
		if (request.getParameter("id_local").isEmpty()){
			mensaje = mensaje + " El id del local no puede estar vacío";
		}else{
			if (controladorBD.existeLocal(Integer.parseInt(request.getParameter("id_local")))){
				id_local = Integer.parseInt(request.getParameter("id_local"));
			}else{
				mensaje = mensaje + "El código del local no existe";
			}
		}
		
		//Si la variable mensaje viene vacía es que no ha habido ningún error y todos los datos son correctos
		if (mensaje.equalsIgnoreCase("")){		
			
			controladorBD.insertarJuegoLocal(id_local, id_videojuego);
			
			mensaje = "Videojuego unido al local indicado";
		}else{
			mensaje = "Operación cancelada: " + mensaje;
		}
	}


		
		//BAJA Videojuego
		
		if(accion.equalsIgnoreCase("BajaVideojuego")){
			
			if(request.getParameter("id_videojuego").isEmpty()) {
				mensaje = mensaje + "El código del juego no puede estar vacío";
			}else{
				id_videojuego = Integer.parseInt(request.getParameter("id_videojuego"));
				if(controladorBD.existeJuego(id_videojuego)){
					controladorBD.borrarVideojuego(id_videojuego);
					mensaje = mensaje + "Videojuego dado de baja con exito";
				}else{
					//mensaje = mensaje + "Operación candelada, el código del jugador no existe en la BBDD";
				}
			}
		}
		

		
		%>

	<body>
		
		<div id="site-content">
			<div class="site-header">
				<div class="container">
					<a href="index.html" id="branding">
						<img src="images/logo.png" alt="" class="logo">
						<div class="logo-text">
							<h1 class="site-title">NelsON Games</h1>
							<small class="site-description">Reinventing the future</small>
						</div>
					</a> <!-- #branding -->

					<div class="right-section pull-right">
						<a href="index.jsp#">Logout <small>(Admin)</small></a>
					</div> <!-- .right-section -->


					<div class="main-navigation" style="width:1450px">
						<button class="toggle-menu"><i class="fa fa-bars"></i></button>
						<ul class="menu">
							<li class="menu-item home current-menu-item"><a href="index.jsp"><i class="icon-home"></i></a></li>
							<li class="menu-item"><a href="Altas/videojuegos.jsp">Videojuego</a></li>
							<li class="menu-item"><a href="alta_cliente.jsp">Cliente</a></li>
							<li class="menu-item"><a href="alta_local.jsp">Local </a></li>
							<li class="menu-item"><a href="alta_local.jsp">Género </a></li>
							<li class="menu-item"><a href="alta_local.jsp">Formato </a></li>
							<li class="menu-item"><a href="alta_local.jsp">Distribuidor </a></li>
							<li class="menu-item"><a href="alta_local.jsp">Desarrolladora </a></li>
							<li class="menu-item"><a href="Altas/Desarrolladora_videojuego.jsp">Desarrolladora-Videojuego</a></li>
							<li class="menu-item"><a href="Altas/Local_videojuego.jsp">Local-Videojuego</a></li>
						</ul> <!-- .menu -->
						<div class="mobile-navigation"></div> <!-- .mobile-navigation -->
					</div> <!-- .main-navigation -->
				</div> <!-- .container -->

					<div class="breadcrumbs">
						<div class="container">
							<a href="index.jsp">Home</a>
							<span>Altas</span>
						</div>
					</div>

				</div> <!-- .container -->
			</div> <!-- .site-header -->
			<main class="main-content">
				<div class="container">
					<div class="page">
						
						
						<div class="product-list">
							
							<section>
								<h3><%=mensaje %></h3>
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
								<h3 class="widget-title">Servicio de paqueterÃ­a</h3>
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

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="assets/js/index.js"></script>
			<script src="assets/js/dropdown.js"></script>

</body>

</html>