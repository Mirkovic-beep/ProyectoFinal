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
		
<%BDController cotroladorBD= new BDController(); %>
<%ArrayList<Videojuego> ofertas = cotroladorBD.dameJuegosOferta();%>
<%ArrayList<Videojuego> nuevos = cotroladorBD.dameJuegosNuevos(1);%>


	</head>


	<body class="slider-collapse">
		<div id="site-content">
			<div class="site-header">
				<div class="container">
					<a href="index.jsp" id="branding">
						<img src="images/logo.png" alt="" class="logo">
						<div class="logo-text">
							<h1 class="site-title">NelsON Games</h1>
							<small class="site-description">Reinventing the future</small>
						</div>
					</a> <!-- #branding -->

					<div class="right-section pull-right">
						<a href="cart.jsp" class="cart"><i class="icon-cart"></i> Carrito Vacio</a>
						<a href="#" class="login-button">Iniciar sesion/Registro</a>
					</div> <!-- .right-section -->

					<div class="main-navigation">
						<button class="toggle-menu"><i class="fa fa-bars"></i></button>
						<ul class="menu">
							<li class="menu-item home current-menu-item"><a href="index.jsp"><i class="icon-home"></i></a></li>
							<li class="menu-item"><a href="pc.jsp">PC</a></li>
							<li class="menu-item"><a href="playstation.jsp">PlayStation</a></li>
							<li class="menu-item"><a href="xbox.jsp">Xbox</a></li>
							<li class="menu-item"><a href="wii.jsp">Wii</a></li>
							<li class="menu-item"><a href="aboutus.jsp">Sobre nosotros</a></li>
						</ul> <!-- .menu -->
						
						
						<div class="search-form">
								<%int id = 3; %>
																	
								<form action="single.jsp?id=<%=id %>" method="post">
									<label><img src="images/icon-search.png"></label>
									<input type="text" name="nombre_juego" id="nombre_juego" placeholder="Buscar...">
								</form>
								
						</div> <!-- .search-form -->

						<div class="mobile-navigation"></div> <!-- .mobile-navigation -->
					</div> <!-- .main-navigation -->
				</div> <!-- .container -->
			</div> <!-- .site-header -->
			
		

			<div class="home-slider">
				<ul class="slides">
				
				<%for(int i=0;i<nuevos.size();i++){ %>
				
						<li data-bg-image="images/fondo1.jpg">
							<div class="container">
								<div class="slide-content">
									<h2 class="slide-title"><%=nuevos.get(i).getNombre() %></h2>
									<small class="slide-subtitle"><%=nuevos.get(i).getPrecio() %> €</small>
									<img src="images/<%=nuevos.get(i).getPegi()%>.png" style="width:100px" alt="Game 1">
									<!-- <a href="cart.jsp" class="button">Añadir al carrito</a> -->
								</div>
								
							<a href="single.jsp?id=<%=nuevos.get(i).getId() %>"><img src="images/<%=nuevos.get(i).getNombre()%>.jpg" class="slide-image" alt="Game 1"></a>
							
							</div>
						</li>
				<%} %>
				</ul> <!-- .slides -->
			</div> <!-- .home-slider -->
		

			<main class="main-content">
				<div class="container">
					<div class="page">
						<section>
							<header>
								<h2 class="section-title">Precios Ultra Rebajados</h2>
							</header>

						
							<div class="product-list">
						
							<%for(int i=0;i<ofertas.size();i++){ %>
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.jsp?id=<%=ofertas.get(i).getId() %>"><img src="images/<%=ofertas.get(i).getNombre()%>.jpg" alt="Game 1"></a>
										</div>
										<h3 class="product-title"><a href="#"><%=ofertas.get(i).getNombre().toUpperCase() %></a></h3>
										<small class="price"><%=ofertas.get(i).getPrecio() %> €</small>
										<a href="cart.jsp" class="button">Añadir al carrito</a>
										<a href="single.jsp?id=<%=ofertas.get(i).getId() %>" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->	
							<%} %>
							</div> <!-- .product-list -->

						</section>

						<section>
							<header>
								<h2 class="section-title">Juegos nuevos</h2>
							</header>

							<div class="product-list">
							
							<%for(int i=0;i<nuevos.size();i++){ %>
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
												<a href="single.jsp?id=<%=nuevos.get(i).getId() %>"><img src="images/<%=nuevos.get(i).getNombre()%>.jpg" alt="Game 1"></a>
										</div>
										<h3 class="product-title"><a href="#"><%=nuevos.get(i).getNombre().toUpperCase() %></a></h3>
										<small class="price"><%=nuevos.get(i).getPrecio() %> €</small>
										<a href="cart.jsp" class="button">Añadir al carrito</a>
										<a href="single.jsp?id=<%=nuevos.get(i).getId() %>" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->
							<%} %>
								
								
							</div> <!-- .product-list -->

						</section>
					</div>
				</div> <!-- .container -->
			</main> <!-- .main-content -->

			<div class="site-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-2">
							<div class="widget">
								<h3 class="widget-title">Información</h3>
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
									<li><a href="#">Cerrar sesión</a></li>
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
				</div> <!-- .column -->
				<div class="col-md-6">
					<h2 class="section-title">Crear una cuenta</h2>
					<form action="operaciones_alu.jsp?accion=AltaCliente" method="post">
						<input type="text" name="nombre_cliente" id="nombre_cliente" placeholder="Nombre de usuario...">
						<input type="text" name="apellidos_cliente" id="id_cliente" placeholder="Apellidos...">
						<input type="text" name="dni_cliente" id="dni_cliente"placeholder="Dni...">
						<input type="submit" value="Dar de alta">
					</form>
				</div> <!-- .column -->
			</div> <!-- .row -->
		</div> <!-- .auth-popup -->

		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/app.js"></script>
		
	</body>

</html>