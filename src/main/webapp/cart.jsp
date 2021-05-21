<!DOCTYPE html>
<html lang="en">
	<head>
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		<%@ page import="Clases.*" %>
		<%@ page import="java.util.*" %>
		
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

<%	BDController controladorBD= new BDController(); 
	int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
	
	ArrayList<Compra> compras = controladorBD.dameCompras(id_cliente);
	
	
	
	
	
%>

	<body>
		
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
						<a href=index.jsp#">Logout <small>(Admin)</small></a>
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
									<th class="product-name" style="text-align:center;">Nombre del producto</th>
									<th class="product-price">Precio</th>
									<th class="product-qty">Local</th>
									<th class="product-total">Fecha</th>
								</tr>
							</thead>
							<tbody>
					
					<h2>Carrito de: <%=controladorBD.dameNombreCliente(id_cliente) %></h2>
					
					<%for(int i=0;i<compras.size();i++){ %>
								<tr>
									<td class="product-name">
									<div class="product-detail">
											<h3 class="product-title" style="text-align:center;"><%=controladorBD.dameNombreVideojuego(compras.get(i).getId_videojuego())%></h3>
										</div>
										<div class="product-thumbnail">
											<img src="images/<%=controladorBD.dameNombreVideojuego(compras.get(i).getId_videojuego())%>.jpg" style="width:100px" alt="">
										</div>
										
									</td>
									<td class="product-title" style="text-align:center;"><%=controladorBD.damePrecioVideojuego(compras.get(i).getId_videojuego()) %> €</td>
									<td class="product-thumbnail"><h3 class="product-title" style="text-align:center;"><%=controladorBD.dameNombreLocal(compras.get(i).getId_local())%></h3><img src="images/<%=controladorBD.dameNombreLocal(compras.get(i).getId_local())%>.jpg" style="width:200px" alt="">
									</td>
									<td class="product-title" style="text-align:center;"><%=compras.get(i).getFecha_compra() %> </td>
									</tr>
						<%} %>
								
						<%
						ArrayList <Videojuego> videojuegos = new ArrayList<Videojuego>();
						
						double total = 0;
						
						for(int i=0;i<compras.size();i++){
							
						total = controladorBD.dameJuego(compras.get(i).getId_videojuego()).getPrecio() + total;
							

						}
		
						
						
						%>
							</tbody>
						</table> <!-- .cart -->

						<div class="cart-total">
							<p><strong>Subtotal: </strong><%=total %>€</p>
							<p><strong>Envio: </strong> 10.00€</p>
							<p class="total"><strong>Total</strong><span class="num"><%=total +10 %></span></p>
							<p>
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