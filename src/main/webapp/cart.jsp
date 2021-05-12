<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>Carrito</title>

		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:400,700|" rel="stylesheet" type="text/css">
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
						<div class="container">
							<a href="index.html">Home</a>
							<span>Cart</span>
						</div>
					</div>
				</div> <!-- .container -->
			</div> <!-- .site-header -->
			<main class="main-content">
				<div class="container">
					<div class="page">
						
						<table class="cart">
							<thead>
								<tr>
									<th class="product-name">Nombre del producto</th>
									<th class="product-price">Precio</th>
									<th class="product-qty">Cantidad</th>
									<th class="product-total">Total</th>
									<th class="action"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="product-name">
										<div class="product-thumbnail">
											<img src="images/diablo-carrito.jpg" alt="">
										</div>
										<div class="product-detail">
											<h3 class="product-title">Diablo III</h3>
											<p>Diablo III es un videojuego de rol de acción, desarrollado por Blizzard Entertainment. Ésta es la continuación de Diablo II y la tercera parte de la serie que fue creada por la compañía estadounidense Blizzard. Su temática es de fantasía oscura y terrorífica.</p>
										</div>
									</td>
									<td class="product-price">50.00€</td>
									<td class="product-qty">
										<select name="#">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select>
									</td>
									<td class="product-total">50.00€</td>
									<td class="action"><a href="#"><i class="fa fa-times"></i></a></td>
								</tr>
								<tr>
									<td class="product-na">
										<div class="product-thumbnail">
											<img src="images/borderlands-carrito.jpg" alt="">
										</div>
										<div class="product-detail">
											<h3 class="product-title">Borderlands</h3>
											<p>Borderlands es una serie de videojuegos de acción y disparos en primera persona ambientados en escenarios space western y de ciencia ficción fantástica, desarrollados por Gearbox Software para múltiples plataformas.</p>
										</div>
									</td>
									<td class="product-price">60.00€</td>
									<td class="product-qty">
										<select name="#">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select>
									</td>
									<td class="product-total">60.00€</td>
									<td class="action"><a href="#"><i class="fa fa-times"></i></a></td>
								</tr>
							</tbody>
						</table> <!-- .cart -->

						<div class="cart-total">
							<p><strong>Subtotal:</strong> 110.00€</p>
							<p><strong>Envio:</strong> 10.00€</p>
							<p class="total"><strong>Total</strong><span class="num">120.00€</span></p>
							<p>
								<a href="#" class="button muted">Continuar comprando</a>
								<a href="#" class="button">Finalizar y pagar</a>
							</p>
						</div> <!-- .cart-total -->
						
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
					<h2 class="section-title">Inicio de sesi�n</h2>
					<form action="#">
                    <input type="text" id="nombreLogin" placeholder="Nombre de usuario...">
                    <input type="password" id="passLogin" placeholder="Contrase�a...">
                    <input type="button" id="enviarLogin" onclick="Revisar()" value="Iniciar sesion">
                </form>
                </div>
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