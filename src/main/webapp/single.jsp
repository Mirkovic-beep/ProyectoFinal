<!DOCTYPE html>
<html lang="en">
	<head>
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		<%@ page import="Clases.*" %>
		<%@ page import="java.util.*" %>
		
		<title>Juego PlaceHolder</title>

		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,700|" rel="stylesheet" type="text/css">
		<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">

		<!-- Loading main css file -->
		<link rel="stylesheet" href="style.css">
		
		<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->

	</head>


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
						<a href="cart.html" class="cart"><i class="icon-cart"></i> Carrito Vacío</a>
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
							<label><img src="images/icon-search.png"></label>
							<input type="text" placeholder="Buscar...">
						</div> <!-- .search-form -->

						<div class="mobile-navigation"></div> <!-- .mobile-navigation -->
					</div> <!-- .main-navigation -->
					<div class="breadcrumbs">
						
					</div>
				</div> <!-- .container -->
			</div> <!-- .site-header -->
			
			<% 
					int id = Integer.parseInt(request.getParameter("id"));
					BDController controlador = new BDController();
					Videojuego juego = controlador.dameJuego(id);	
			%>
			
			<main class="main-content">
				<div class="container">
					<div class="page">
						
						<div class="entry-content">
							<div class="row">
								<div class="col-sm-6 col-md-4">
									<div class="product-images">
										<figure class="large-image">
											<a href="images/<%=juego.getNombre()%>.jpg"><img src="images/<%=juego.getNombre()%>.jpg" alt="<%=juego.getNombre()%>"></a>
										</figure>
										<div class="thumbnails">
											<a href="images/<%=controlador.dameDesarrolladoraVideojuego(id)%>.png"><img src="images/<%=controlador.dameDesarrolladoraVideojuego(id)%>.png" alt=""></a>
											<a href="images/<%=controlador.dameDistribuidoraVideojuego(id)%>.png"><img src="images/<%=controlador.dameDistribuidoraVideojuego(id)%>.png" alt=""></a>
											<a href="images/<%=controlador.dameLocalVideojuego(id)%>.jpg"><img src="images/<%=controlador.dameLocalVideojuego(id)%>.jpg" alt=""></a>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-8">
									<h2 class="entry-title"><%=juego.getNombre() %></h2>
									<small class="price"><%=juego.getPrecio()%> €</small>

									<p>Copias disponibles: <%=juego.getNcopias() %></p>
									<br>
									<p>Duracion: <%=juego.getDuracion()%> minutos</p>
									<p>Distribuidora: <%=controlador.dameDistribuidoraVideojuego(id) %>
									<p>Desarrolladora: <%=controlador.dameDesarrolladoraVideojuego(id)%>
									<p>Local físico: <%=controlador.dameLocalVideojuego(id) %>
																		

									<div class="addtocart-bar">
										<form action="#">
											<label for="#">Cantidad</label>
											<select name="#">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
											</select>
											<input type="submit" value="Añadir al carrito">
										</form>

										<div class="social-links square">
											<strong>Share</strong>
											<a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
											<a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
											<a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
											<a href="#" class="pinterest"><i class="fa fa-pinterest"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<section>
							<header>
								<h2 class="section-title">Productos similares</h2>
							</header>
							<div class="product-list">
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/hotline.jpg" alt="Game 1"></a>
										</div>
										<h3 class="product-title"><a href="#">Hotline Miama</a></h3>
										<small class="price">19.00â¬</small>
										<a href="cart.html" class="button">AÃ±adir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/deadspace.jpg" alt="Game 2"></a>
										</div>
										<h3 class="product-title"><a href="#">Dead Space</a></h3>
										<small class="price">39.00â¬</small>
										<a href="cart.html" class="button">AÃ±adir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/quakearena.jpg" alt="Game 3"></a>
										</div>
										<h3 class="product-title"><a href="#">Quake Arena</a></h3>
										<small class="price">29.00â¬</small>
										<a href="cart.html" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/scurge.jpg" alt="Game 4"></a>
										</div>
										<h3 class="product-title"><a href="#">Scurge</a></h3>
										<small class="price">39.00â¬</small>
										<a href="cart.html" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->
								
							</div> <!-- .product-list --></section>

						
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
								<h3 class="widget-title">Â¿Quieres recibir notificaciones?</h3>
								<form action="#" class="newsletter-form">
									<input type="text" placeholder="Inserta tu email...">
									<input type="submit" value="Suscribirse">
								</form>
							</div> <!-- .widget -->
						</div> <!-- column -->
					</div><!-- .row -->

					<div class="colophon">
						<div class="copy">Copyright 2014 Company name. Designed by Themezy. All rights reserved.</div>
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

		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/app.js"></script>
		
	</body>

</html>