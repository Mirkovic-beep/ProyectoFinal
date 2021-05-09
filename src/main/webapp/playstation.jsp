<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>Play Station</title>

		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:100,400,700|" rel="stylesheet" type="text/css">
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

					<div class="breadcrumbs">
						<div class="container">
							<a href="index.html">Home</a>
							<span>Play Station</span>
						</div>
					</div>

				</div> <!-- .container -->
			</div> <!-- .site-header -->
			<main class="main-content">
				<div class="container">
					<div class="page">
						<div class="filter-bar">
							<div class="filter">
								<span>
									<label>Ordenar por:</label>
									<select name="#">
										<option value="#">Popularidad</option>
										<option value="#">Mas votados</option>
										<option value="#">Precio más bajo</option>
									</select>
								</span>
					
							</div> <!-- .filter -->
						</div> <!-- .filter-bar -->
						
						<div class="product-list">
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/colossus.jpg" alt="Game 1"></a>
										</div>
										<h3 class="product-title"><a href="#">Shadow of the colossus</a></h3>
										<small class="price">19.00€</small>
										<a href="cart.html" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/crazytaxi.jpg" alt="Game 2"></a>
										</div>
										<h3 class="product-title"><a href="#">Crazy Taxi</a></h3>
										<small class="price">39.00€</small>
										<a href="cart.html" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/dragonquest.jpg" alt="Game 3"></a>
										</div>
										<h3 class="product-title"><a href="#">Dragon Quest</a></h3>
										<small class="price">29.00€</small>
										<a href="cart.html" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/finalfantasy.jpg" alt="Game 4"></a>
										</div>
										<h3 class="product-title"><a href="#">Final Fantasy</a></h3>
										<small class="price">59.00€</small>
										<a href="cart.html" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/gtavice.jpg" alt="Game 1"></a>
										</div>
										<h3 class="product-title"><a href="#">GTA Vice City</a></h3>
										<small class="price">19.00€</small>
										<a href="cart.html" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/ico.jpg" alt="Game 2"></a>
										</div>
										<h3 class="product-title"><a href="#">Ico</a></h3>
										<small class="price">39.00€</small>
										<a href="cart.html" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/okami.jpg" alt="Game 3"></a>
										</div>
										<h3 class="product-title"><a href="#">Okami</a></h3>
										<small class="price">29.00€</small>
										<a href="cart.html" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="images/resistance3.jpg" alt="Game 4"></a>
										</div>
										<h3 class="product-title"><a href="#">Resistance 3</a></h3>
										<small class="price">59.00€</small>
										<a href="cart.html" class="button">Añadir al carrito</a>
										<a href="#" class="button muted">Detalles</a>
									</div>
								</div> <!-- .product -->

							</div> <!-- .product-list -->

						<div class="pagination-bar">
							<div class="pagination">
								<a href="#" class="page-number"><i class="fa fa-angle-left"></i></a>
								<span class="page-number current">1</span>
								<a href="#" class="page-number">2</a>
								<a href="#" class="page-number">3</a>
								<a href="#" class="page-number">...</a>
								<a href="#" class="page-number">12</a>
								<a href="#" class="page-number"><i class="fa fa-angle-right"></i></a>
							</div> <!-- .pagination -->
						</div>
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