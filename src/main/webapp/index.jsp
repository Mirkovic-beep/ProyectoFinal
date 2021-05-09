<!DOCTYPE html>
<html lang="es">
	<head>
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
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


	<body class="slider-collapse">
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
						<a href="cart.html" class="cart"><i class="icon-cart"></i> Carrito Vacio</a>
						<a href="#" class="login-button">Iniciar sesion/Registro</a>
					</div> <!-- .right-section -->

					<div class="main-navigation">
						<button class="toggle-menu"><i class="fa fa-bars"></i></button>
						<ul class="menu">
							<li class="menu-item home current-menu-item"><a href="index.html"><i class="icon-home"></i></a></li>
							<li class="menu-item"><a href="pc.html">PC</a></li>
							<li class="menu-item"><a href="playstation.html">PlayStation</a></li>
							<li class="menu-item"><a href="xbox.html">Xbox</a></li>
							<li class="menu-item"><a href="wii.html">Wii</a></li>
							<li class="menu-item"><a href="aboutus.html">Sobre nosotros</a></li>
						</ul> <!-- .menu -->
						<div class="search-form">
							<label><img src="images/icon-search.png"></label>
							<input type="text" placeholder="Buscar...">
						</div> <!-- .search-form -->

						<div class="mobile-navigation"></div> <!-- .mobile-navigation -->
					</div> <!-- .main-navigation -->
				</div> <!-- .container -->
			</div> <!-- .site-header -->

			<div class="home-slider">
				<ul class="slides">
					<li data-bg-image="images/fondo.jpg">
						<div class="container">
							<div class="slide-content">
								<h2 class="slide-title">Skyrim</h2>
								<small class="slide-subtitle">70.00€</small>
								
								<p>The Elder Scrolls V: Skyrim Dragonborn es el tercer contenido descargable y ultimo por el momento. oficial para el videojuego de rol de accion de mundo abierto</p>
								
								<a href="cart.jsp" class="button">Añadir al carrito</a>
							</div>

							<img src="images/skyrim.jpg" class="slide-image">
						</div>
					</li>
					<li data-bg-image="images/fondo.jpg">
						<div class="container">
							<div class="slide-content">
								<h2 class="slide-title">Super Mario Galaxy</h2>
								<small class="slide-subtitle">60.00€</small>
								
								<p>Super Mario Galaxy 2 es un videojuego de plataformas desarrollado por Nintendo EAD Tokio y publicado por Nintendo para su consola Wii. Fue anunciado en el E3 2009 y es la secuela directa de Super Mario Galaxy</p>
								
								<a href="cart.jsp" class="button">Añadir al carrito</a>
							</div>

							<img src="images/mario.jpg" class="slide-image">
						</div>
					</li>
					<li data-bg-image="images/fondo.jpg">
						<div class="container">
							<div class="slide-content">
								<h2 class="slide-title">Borderlands (2009)</h2>
								<small class="slide-subtitle">40.00€</small>
								
								<p>Borderlands es una serie de videojuegos de accion y disparos en primera persona ambientados en escenarios space western y de ciencia ficcion fantastica, desarrollados por Gearbox Software para multiples plataformas.</p>
								
								<a href="cart.jsp" class="button">Añadir al carrito</a>
							</div>

							<img src="images/borderlands.jpg" class="slide-image">
						</div>
					</li>
				</ul> <!-- .slides -->
			</div> <!-- .home-slider -->

			<main class="main-content">
				<div class="container">
					<div class="page">
						<section>
							<header>
								<h2 class="section-title">Juegos nuevos</h2>
							</header>

							<div class="product-list">
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.jsp"><img src="images/diablo.jpg" alt="Game 1"></a>
										</div>
										<h3 class="product-title"><a href="#">Diablo III</a></h3>
										<small class="price">19.00€</small>
										<a href="cart.jsp" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.jsp"><img src="images/deadspace.jpg" alt="Game 2"></a>
										</div>
										<h3 class="product-title"><a href="#">Dead Space</a></h3>
										<small class="price">39.00€</small>
										<a href="cart.jsp" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.jsp"><img src="images/hotline.jpg" alt="Game 3"></a>
										</div>
										<h3 class="product-title"><a href="#">Hotline Miami</a></h3>
										<small class="price">29.00€</small>
										<a href="cart.jsp" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.jsp"><img src="images/mortalkombat.jpg" alt="Game 4"></a>
										</div>
										<h3 class="product-title"><a href="#">Mortal Kombat</a></h3>
										<small class="price">59.00€</small>
										<a href="cart.jsp" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

							</div> <!-- .product-list -->

						</section>

						<section>
							<header>
								<h2 class="section-title">Hall de la fama</h2>
							</header>

							<div class="product-list">
								
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.jsp"><img src="images/bioshock.jpg" alt="Game 1"></a>
										</div>
										<h3 class="product-title"><a href="#">Bioshock</a></h3>
										<small class="price">59.00€</small>
										<a href="cart.jsp" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->
								
								
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.jsp"><img src="images/halo4.jpg" alt="Game 2"></a>
										</div>
										<h3 class="product-title"><a href="#">Halo 4</a></h3>
										<small class="price">19.00€</small>
										<a href="cart.jsp" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->
								
								
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.jsp"><img src="images/crazytaxi.jpg" alt="Game 3"></a>
										</div>
										<h3 class="product-title"><a href="#">Crazy Taxi</a></h3>
										<small class="price">29.00€</small>
										<a href="cart.jsp" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->
								
								
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.jsp"><img src="images/colossus.jpg" alt="Game 4"></a>
										</div>
										<h3 class="product-title"><a href="#">Shadow of the colossus</a></h3>
										<small class="price">49.00€</small>
										<a href="cart.jsp" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->
								
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
						<input type="text" placeholder="Nombre de usuario...">
						<input type="password" placeholder="Contraseña...">
						<input type="submit" value="Iniciar sesion">
					</form>
				</div> <!-- .column -->
				<div class="col-md-6">
					<h2 class="section-title">Crear una cuenta</h2>
					<form action="#">
						<input type="text" placeholder="Nombre de usuario...">
						<input type="text" placeholder="Email...">
						<input type="text" placeholder="Contraseña...">
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