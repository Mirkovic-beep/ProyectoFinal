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
		String nombre_genero = "";
		String nuevo = "";
		String nombre_distribuidor = "";
		String nombre_videojuego = "";
		String nombre_local = "";
		String nombre_desarrolladora = "";
		String dificultad = "";
		String sede = "";
		String localizacion = "";
		String afiliacion = "";
		String nombre_cliente = "";
		String apellidos_cliente = "";
		String dni_cliente = "";
		String fecha_compra = "";
		String nombre_formato = "";
		int id_genero = 0;
		int ncopias = 0;
		int duracion = 0;
		int id_videojuego = 0;
		double precio = 0;
		int id_distribuidor = 0;
		int id_desarrolladora = 0;
		int id_local = 0;
		int stock = 0;
		int id_formato = 0;
		int id_cliente = 0;
		int id_transaccion = 0;
		String mensaje = "";
			
		
		//Modificar Videojuego
		
				if (accion.equalsIgnoreCase("ModificarVideojuego")){
					
					nombre_genero = request.getParameter("nombre_genero");
					nombre_distribuidor = request.getParameter("nombre_distribuidor");
					
					id_distribuidor = controladorBD.dameCodigoDistribuidorNombre(nombre_distribuidor);
					id_genero = controladorBD.dameCodigoGeneroNombre(nombre_genero);
					
					if (Integer.toString(id_genero).equalsIgnoreCase("")){
						mensaje = "El nombre del genero no puede estar vacio";
						
					}else{
						if (controladorBD.existeGenero(id_genero)){
							id_genero = controladorBD.dameCodigoGeneroNombre(nombre_genero);
						}else{
							mensaje = mensaje + "El nombre del genero no existe en la BD.";
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
					
					if (Integer.toString(id_distribuidor).equalsIgnoreCase("")){
						mensaje = mensaje + " El nombre del distribuidor no puede estar vacío";
					}else{
						if (controladorBD.existeDistribuidor(id_distribuidor)){
							id_distribuidor = controladorBD.dameCodigoDistribuidorNombre(nombre_distribuidor);
						}else{
							mensaje = mensaje + "El nombre del distribuidor no existe en la BD.";
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
					}
					
					if(Integer.parseInt(request.getParameter("nuevo"))!=1 && Integer.parseInt(request.getParameter("nuevo"))!=0) {
						mensaje = mensaje + "El juego solo puede ser nuevo o no nuevo (1/0)";
					}else{
						nuevo = request.getParameter("nuevo");
					}
					
					
						
					//Si la variable mensaje viene vacía es que no ha habido ningún error y todos los datos son correctos
					if (mensaje.equalsIgnoreCase("")){
						id_videojuego = Integer.parseInt(request.getParameter("id_videojuego"));
						Videojuego juego = new Videojuego(id_videojuego, id_genero, ncopias, duracion, nombre, pegi,id_distribuidor,precio,consola,nuevo);
						
						controladorBD.modificarVideojuego(juego);
										
						mensaje = "Videojuego modificado con éxito";
					}else{
						mensaje = "Operación cancelada: " + mensaje;
					}
				}
				
				
			//Modificar videojuego desarrolladora
			
			if (accion.equalsIgnoreCase("AltaVideojuegoDesarrolladora")){
				
				nombre_videojuego = request.getParameter("nombre_videojuego");
				nombre_desarrolladora = request.getParameter("nombre_desarrolladora");
				
				id_videojuego = controladorBD.dameCodigoVideojuegoNombre(nombre_videojuego);
				id_desarrolladora = controladorBD.dameCodigoDesarrolladoraNombre(nombre_desarrolladora);
				
				if (Integer.toString(id_videojuego).equalsIgnoreCase("")){
					mensaje = "El nombre del videojuego no puede estar vacio";
					
				}else{
					if (controladorBD.existeJuego(id_videojuego)){
						id_videojuego = controladorBD.dameCodigoVideojuegoNombre(nombre_videojuego);
					}else{
						mensaje = mensaje + "El nombre del videojuego no existe en la BD.";
					}
				}
				
				if (Integer.toString(id_desarrolladora).equalsIgnoreCase("")){
					mensaje = "El nombre de la desarrolladora no puede estar vacio";
					
				}else{
					if (controladorBD.existeDesarrolladora(id_desarrolladora)){
						id_desarrolladora = controladorBD.dameCodigoDesarrolladoraNombre(nombre_desarrolladora);
					}else{
						mensaje = mensaje + "El nombre de la desarrolladora no existe en la BD.";
					}
				}
				
				if(controladorBD.existeJuegoDesarrolladora(id_desarrolladora, id_videojuego)){
					mensaje = "El juego ya pertenece a esa desarrolladora";
				}else{
				}
					
					//Si la variable mensaje viene vacía es que no ha habido ningún error y todos los datos son correctos
					if (mensaje.equalsIgnoreCase("")){				
						controladorBD.insertarJuegoDesarrolladora(id_videojuego,id_desarrolladora);
						
						mensaje = "Videojuego unido a la desarrolladora indicada";
					}else{
						mensaje = "Operación cancelada: " + mensaje;
					}
				}
			
			//Modificar videojuego formato
			
			if (accion.equalsIgnoreCase("AltaVideojuegoFormato")){
					
					nombre_videojuego = request.getParameter("nombre_videojuego");
					nombre_formato = request.getParameter("nombre_formato");
					
					id_videojuego = controladorBD.dameCodigoVideojuegoNombre(nombre_videojuego);
					id_formato = controladorBD.dameCodigoFormatoNombre(nombre_formato);
					
					if (Integer.toString(id_videojuego).equalsIgnoreCase("")){
						mensaje = "El nombre del videojuego no puede estar vacio";
						
					}else{
						if (controladorBD.existeJuego(id_videojuego)){
							id_videojuego = controladorBD.dameCodigoVideojuegoNombre(nombre_videojuego);
						}else{
							mensaje = mensaje + "El nombre del videojuego no existe en la BD.";
						}
					}
					
					if (Integer.toString(id_formato).equalsIgnoreCase("")){
						mensaje = "El formato del juego no puede estar vacio";
						
					}else{
						if (controladorBD.existeFormato(id_formato)){
							id_formato = controladorBD.dameCodigoFormatoNombre(nombre_formato);
						}else{
							mensaje = mensaje + "El nombre del formato no existe en la BD.";
						}
					}
					
					if(controladorBD.existeJuegoFormato(id_desarrolladora, id_videojuego)){
						mensaje = "El juego ya tiene ese formato registrado";
					}else{
					}
						
						//Si la variable mensaje viene vacía es que no ha habido ningún error y todos los datos son correctos
						if (mensaje.equalsIgnoreCase("")){				
							controladorBD.insertarJuegoFormato(id_videojuego,id_formato);
							
							mensaje = "Formato registrado para el juego";
						}else{
							mensaje = "Operación cancelada: " + mensaje;
						}
					}

			
			//Modificar videojuego-local
			
			if (accion.equalsIgnoreCase("AltaVideojuegoLocal")){
				
				nombre_videojuego = request.getParameter("nombre_videojuego");
				nombre_local = request.getParameter("nombre_local");
				
				id_videojuego = controladorBD.dameCodigoVideojuegoNombre(nombre_videojuego);
				id_local = controladorBD.dameCodigoLocalNombre(nombre_local);
				
				if (Integer.toString(id_videojuego).equalsIgnoreCase("")){
					mensaje = "El nombre del videojuego no puede estar vacio";
					
				}else{
					if (controladorBD.existeJuego(id_videojuego)){
						id_videojuego = controladorBD.dameCodigoVideojuegoNombre(nombre_videojuego);
					}else{
						mensaje = mensaje + "El nombre del videojuego no existe en la BD.";
					}
				}	
				
				if (Integer.toString(id_local).equalsIgnoreCase("")){
					mensaje = "El nombre del local no puede estar vacio";
					
				}else{
					if (controladorBD.existeLocal(id_local)){
						id_local = controladorBD.dameCodigoLocalNombre(nombre_local);
					}else{
						mensaje = mensaje + "El nombre del local no existe en la BD.";
					}
				}
				
				if(controladorBD.existeJuegoLocal(id_local, id_videojuego)==true){
					mensaje = "El juego ya pertenece a ese local";
				}else{
				}
				
				//Si la variable mensaje viene vacía es que no ha habido ningún error y todos los datos son correctos
				if (mensaje.equalsIgnoreCase("")){		
					
					controladorBD.insertarJuegoLocal(id_local, id_videojuego);
					
					mensaje = "Videojuego unido al local indicado";
				}else{
					mensaje = "Operación cancelada: " + mensaje;
				}
			}
			
			//Modificar videojuego-cliente-local
			
			if (accion.equalsIgnoreCase("AltaCompraVideojuegoLocal")){
					
					nombre_videojuego = request.getParameter("nombre_videojuego");
					nombre_local = request.getParameter("nombre_local");
					nombre_cliente = request.getParameter("nombre_cliente");
					fecha_compra = request.getParameter("fecha_compra");
					
					id_videojuego = controladorBD.dameCodigoVideojuegoNombre(nombre_videojuego);
					id_local = controladorBD.dameCodigoLocalNombre(nombre_local);
					id_cliente = controladorBD.dameCodigoClienteNombre(nombre_cliente);
					
					if (Integer.toString(id_videojuego).equalsIgnoreCase("")){
						mensaje = "El nombre del videojuego no puede estar vacio";
						
					}else{
						if (controladorBD.existeJuego(id_videojuego)){
							id_videojuego = controladorBD.dameCodigoVideojuegoNombre(nombre_videojuego);
						}else{
							mensaje = mensaje + "El nombre del videojuego no existe en la BD.";
						}
					}	
					
					if (Integer.toString(id_local).equalsIgnoreCase("")){
						mensaje = "El nombre del local no puede estar vacio";
						
					}else{
						if (controladorBD.existeLocal(id_local)){
							id_local = controladorBD.dameCodigoLocalNombre(nombre_local);
						}else{
							mensaje = mensaje + "El nombre del local no existe en la BD.";
						}
					}
					
					if (Integer.toString(id_cliente).equalsIgnoreCase("")){
						mensaje = "El nombre del cliente no puede estar vacio";
						
					}else{
						if (controladorBD.existeCliente(id_cliente)){
							id_local = controladorBD.dameCodigoLocalNombre(nombre_local);
						}else{
							mensaje = mensaje + "El nombre del cliente no existe en la BD.";
						}
					}
					
					if(controladorBD.existeTransaccion(id_transaccion)){
						mensaje = "El id de transaccion ya existe";
					}else{
						id_transaccion = Integer.parseInt(request.getParameter("id_transaccion"));
					}
					
					if(controladorBD.existeClienteJuegoLocal(id_cliente, id_videojuego,id_local)==true){
						mensaje = "El ese id de transacción ya existe";
					}else{
					}
					
					//Si la variable mensaje viene vacía es que no ha habido ningún error y todos los datos son correctos
					if (mensaje.equalsIgnoreCase("")){		
						
						controladorBD.insertarCompraClienteLocal(id_local, id_videojuego, id_cliente, id_transaccion, fecha_compra);
						
						mensaje = "Compra de videojuego registrada";
					}else{
						mensaje = "Operación cancelada: " + mensaje;
					}
				}

		//Modificar genero
			
			if (accion.equalsIgnoreCase("ModificarGenero")){
					
					if (request.getParameter("nombre").equalsIgnoreCase("")){
						mensaje = mensaje + " El nombre no puede estar vacío.";
					}else{
						nombre = request.getParameter("nombre");
					}
					
					
					if (request.getParameter("dificultad").equalsIgnoreCase("")){
						mensaje = mensaje + " La dificultad no puede estar vacía";
					}else{
						dificultad = request.getParameter("dificultad");
					}
					
						
						
					if (mensaje.equalsIgnoreCase("")){
						id_genero = Integer.parseInt(request.getParameter("id_genero"));
						Genero genero = new Genero(id_genero,nombre,dificultad);
						
						controladorBD.modificarGenero(genero);
						
						mensaje = "Genero modificado de alta";
					}else{
						mensaje = "Operación cancelada: " + mensaje;
					}
					}

			//Modificar desarrolladora
			
				if (accion.equalsIgnoreCase("ModificarDesarrolladora")){
						
						if (request.getParameter("nombre_desarrolladora").equalsIgnoreCase("")){
							mensaje = mensaje + " El nombre no puede estar vacío.";
						}else{
							nombre = request.getParameter("nombre_desarrolladora");
						}
						
						
						if (request.getParameter("sede_desarrolladora").equalsIgnoreCase("")){
							mensaje = mensaje + " La sede no puede estar vacía";
						}else{
							sede = request.getParameter("sede_desarrolladora");
						}
							
							
						if (mensaje.equalsIgnoreCase("")){
							id_desarrolladora = Integer.parseInt(request.getParameter("id_desarrolladora"));

							Desarrolladora desarrolladora = new Desarrolladora(id_desarrolladora,nombre,sede);
							
							controladorBD.modificarDesarrolladora(desarrolladora);
							
							mensaje = "Desarrolladora modificada";
						}else{
							mensaje = "Operación cancelada: " + mensaje;
						}
						}
			
				//Modificar Formato
				
					if (accion.equalsIgnoreCase("ModificarFormato")){
							
							if (request.getParameter("nombre").equalsIgnoreCase("")){
								mensaje = mensaje + " El nombre no puede estar vacío.";
							}else{
								nombre = request.getParameter("nombre");
							}
							
							if (request.getParameter("stock").isEmpty()){
								mensaje = mensaje + "El stock no puede estar vacío";
							}else{
								stock = Integer.parseInt(request.getParameter("stock"));
							}
							
									
							if (mensaje.equalsIgnoreCase("")){
								id_formato = controladorBD.dameCodigoFormatoNombre(nombre);
								
								Formato formato = new Formato(id_formato,nombre,stock);
								
								controladorBD.modificarFormato(formato);
								
								mensaje = "Formato modificado";
							}else{
								mensaje = "Operación cancelada: " + mensaje;
							}
							}
				
					//Modificar Local
					
					if (accion.equalsIgnoreCase("ModificarLocal")){
							
							if (request.getParameter("nombre").equalsIgnoreCase("")){
								mensaje = mensaje + " El nombre no puede estar vacío.";
							}else{
								nombre = request.getParameter("nombre");
							}
							
							if (request.getParameter("localizacion").equalsIgnoreCase("")){
								mensaje = mensaje + "La localización no puede estar vacia";
							}else{
								localizacion = request.getParameter("localizacion");
							}
							
																
							if (mensaje.equalsIgnoreCase("")){
								
								id_local = Integer.parseInt(request.getParameter("id_local"));
								
								Local local = new Local(id_local,nombre,localizacion);
								
								controladorBD.modificarLocal(local);
								
								mensaje = "Local modificado";
							}else{
								mensaje = "Operación cancelada: " + mensaje;
							}
							}
					
					//Modificar Distribuidor
					
					if (accion.equalsIgnoreCase("ModificarDistribuidor")){
							
							if (request.getParameter("nombre_distribuidor").equalsIgnoreCase("")){
								mensaje = mensaje + " El nombre no puede estar vacío.";
							}else{
								nombre = request.getParameter("nombre_distribuidor");
							}
							
							if (request.getParameter("afiliacion_distribuidor").equalsIgnoreCase("")){
								mensaje = mensaje + "La afiliacion no puede estar vacia";
							}else{
								afiliacion = request.getParameter("afiliacion_distribuidor");
							}
							
							if (request.getParameter("sede_distribuidor").equalsIgnoreCase("")){
								mensaje = mensaje + "La sede no puede estar vacia";
							}else{
								sede = request.getParameter("sede_distribuidor");
							}
							
									
							if (mensaje.equalsIgnoreCase("")){
								id_distribuidor = Integer.parseInt(request.getParameter("id_distribuidor"));
								
								Distribuidor distribuidor = new Distribuidor(id_distribuidor,nombre,afiliacion,sede);
								
								controladorBD.modificarDistribuidor(distribuidor);
								
								mensaje = "Distribuidor modificado";
							}else{
								mensaje = "Operación cancelada: " + mensaje;
							}
							}
					
					//Modificar cliente
					
					if (accion.equalsIgnoreCase("ModificarCliente")){
							
							if (request.getParameter("nombre_cliente").equalsIgnoreCase("")){
								mensaje = mensaje + " El nombre no puede estar vacío.";
							}else{
								nombre = request.getParameter("nombre_cliente");
							}
							
							if (request.getParameter("apellidos_cliente").equalsIgnoreCase("")){
								mensaje = mensaje + "Los apellidos del cliente no pueden estar vacios";
							}else{
								apellidos_cliente = request.getParameter("apellidos_cliente");
							}
							
							if (request.getParameter("dni_cliente").equalsIgnoreCase("")){
								mensaje = mensaje + "El dni del cliente no puede estar vacio";
							}else{
								dni_cliente = request.getParameter("dni_cliente");
							}
								
							if (mensaje.equalsIgnoreCase("")){
								
								id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
								
								Cliente cliente = new Cliente(id_cliente,nombre,apellidos_cliente,dni_cliente);
								
								controladorBD.modificarCliente(cliente);
								
								mensaje = "Cliente modificado";
							}else{
								mensaje = "Operación cancelada: " + mensaje;
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


					<div class="main-navigation">
						<button class="toggle-menu"><i class="fa fa-bars"></i></button>
							<ul class="menu">
							<li class="menu-item home current-menu-item"><a href="index.jsp"><i class="icon-home"></i></a></li>
							<li class="menu-item"><a href="Modificaciones/videojuegoslist.jsp">Videojuego</a></li>
							<li class="menu-item"><a href="Modificaciones/clienteslist.jsp">Cliente</a></li>
							<li class="menu-item"><a href="Modificacion/localeslist.jsp">Local </a></li>
							<li class="menu-item"><a href="Modificaciones/generoslist.jsp">Género </a></li>
							<li class="menu-item"><a href="Modificaciones/formatoslist.jsp">Formato </a></li>
							<li class="menu-item"><a href="Modificaciones/distribuidoreslist.jsp">Distribuidor </a></li>
							<li class="menu-item"><a href="Modificaciones/desarrolladoraslist.jsp">Desarrolladora </a></li>
						</ul> <!-- .menu -->
						<div class="mobile-navigation"></div> <!-- .mobile-navigation -->
					</div> <!-- .main-navigation -->
				</div> <!-- .container -->

					<div class="breadcrumbs">
						<div class="container">
							<a href="index.jsp">Home</a>
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
						<input type="text" placeholder="Contrasena...">
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