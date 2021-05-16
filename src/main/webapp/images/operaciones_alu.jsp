<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="fifa20.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA20</title>
</head>

<body class="is-preload">
		<div id="page-wrapper">
		
		<%
		//variables
		BDController controladorBD = new BDController();
		String accion = request.getParameter("accion");
		String nombre = "";
		String pierna = "";
		String nacionalidad = "";
		int cod_equipo = 0;
		int altura = 0;
		int cod_jugador = 0;
		String mensaje = "";
			
		//ALTA JUGADOR
		if (accion.equalsIgnoreCase("AltaJugador")){
			if (request.getParameter("nombre").equalsIgnoreCase("")){
				mensaje = "El nombre no puede estar vacío.";
			}else{
				nombre = request.getParameter("nombre");
			}
			if (request.getParameter("pierna").equalsIgnoreCase("")){
				mensaje = mensaje + " La pierna no puede estar vacía.";
			}else{
				pierna = request.getParameter("pierna");
			}
			if (request.getParameter("nacionalidad").equalsIgnoreCase("")){
				mensaje = mensaje + " La nacionalidad no puede estar vacía.";
			}else{
				nacionalidad = request.getParameter("nacionalidad");
			}
			
			
			//Para controlar valores númericos vacíos usamos .isEmpty
			if (request.getParameter("altura").isEmpty()){
				mensaje = mensaje + " La altura no puede ser 0.";
			}else{
				altura = Integer.parseInt(request.getParameter("altura"));
			}
			
			//Para controlar valores númericos vacíos usamos .isEmpty
			if (request.getParameter("cod_equipo").isEmpty()){
				mensaje = mensaje + " El código del equipo no puede estar vacío.";
			}else{				
				//Controlamos que el código del equipo exista
				if (controladorBD.existeEquipo(Integer.parseInt(request.getParameter("cod_equipo")))==true){
					cod_equipo = Integer.parseInt(request.getParameter("cod_equipo"));
				}else{
					mensaje = mensaje + "El código del equipo no existe en la BD.";
				}
			}	
			
			//Si la variable mensaje viene vacía es que no ha habido ningún error y todos los datos son correctos
			if (mensaje.equalsIgnoreCase("")){
				cod_jugador = controladorBD.calcularCod_jugador();
				Jugador newplayer = new Jugador(cod_jugador, nombre, cod_equipo, pierna, altura, nacionalidad);
				controladorBD.insertarJugadorBDD(newplayer);
				mensaje = "Jugador dado de alta con éxito.";
			}else{
				mensaje = "Operación cancelada: " + mensaje;
			}
		}
		//ALTA EQUIPO
		
		//ALTA LIGA
		
		//Baja Jugador
		if (request.getParameter("accion").equalsIgnoreCase("BajaJugador")){
			if (request.getParameter("cod_jugador").isEmpty()){
				mensaje = "El código del jugador no puede estar vacío.";
			}else{
				cod_jugador = Integer.parseInt(request.getParameter("cod_jugador"));
				if (controladorBD.existeJugador(cod_jugador)==true){
					controladorBD.borrarJugadorBD(cod_jugador);
					mensaje = "Jugador dado de baja con éxito";
				}else{
					mensaje = "Operación Cancelada. El jugador no existe en la BD.";
				}
			}
		}
		//Modificar Jugador
		if (accion.equalsIgnoreCase("ModificarJugador")){
			if (request.getParameter("nombre").equalsIgnoreCase("")){
				mensaje = "El nombre no puede estar vacío.";
			}else{
				nombre = request.getParameter("nombre");
			}
			if (request.getParameter("pierna").equalsIgnoreCase("")){
				mensaje = mensaje + " La pierna no puede estar vacía.";
			}else{
				pierna = request.getParameter("pierna");
			}
			if (request.getParameter("nacionalidad").equalsIgnoreCase("")){
				mensaje = mensaje + " La nacionalidad no puede estar vacía.";
			}else{
				nacionalidad = request.getParameter("nacionalidad");
			}
			
			
			//Para controlar valores númericos vacíos usamos .isEmpty
			if (request.getParameter("altura").isEmpty()){
				mensaje = mensaje + " La altura no puede ser 0.";
			}else{
				altura = Integer.parseInt(request.getParameter("altura"));
			}
			
			//Para controlar valores númericos vacíos usamos .isEmpty
			if (request.getParameter("cod_equipo").isEmpty()){
				mensaje = mensaje + " El código del equipo no puede estar vacío.";
			}else{				
				//Controlamos que el código del equipo exista
				if (controladorBD.existeEquipo(Integer.parseInt(request.getParameter("cod_equipo")))==true){
					cod_equipo = Integer.parseInt(request.getParameter("cod_equipo"));
				}else{
					mensaje = mensaje + "El código del equipo no existe en la BD.";
				}
			}	
			
			//Si la variable mensaje viene vacía es que no ha habido ningún error y todos los datos son correctos
			if (mensaje.equalsIgnoreCase("")){
				cod_jugador = Integer.parseInt(request.getParameter("cod_jugador"));
				Jugador newplayer = new Jugador(cod_jugador, nombre, cod_equipo, pierna, altura, nacionalidad);
				controladorBD.modificarJugador(newplayer);
				mensaje = "Jugador modificado con éxito.";
			}else{
				mensaje = "Operación cancelada: " + mensaje;
			}
		}
		
		
		
		
		

		%>
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.jsp" id="logo">FIFA20</a></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.jsp">Inicio</a></li>
								<li>
									<a href="#">Listados</a>
									<ul>
										<li><a href="ligas.jsp">FIFA 19 Ligas</a></li>
										<li><a href="equipos.jsp">FIFA 19 Equipos</a></li>
										<li><a href="jugadores.jsp">FIFA 19 Jugadores</a></li>
									</ul>
								</li>
								<li>
									<a href="#">Operaciones</a>
									<ul>
										<li>
											<a href="#">Jugadores</a>
											<ul>
												<li><a href="operaciones.jsp?tipo=altajugador">Alta Jugador</a></li>
												<li><a href="#">Baja Jugador</a></li>
												<li><a href="#">Modificar Jugador</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Equipos</a>
											<ul>
												<li><a href="#">Alta Equipo</a></li>
												<li><a href="#">Baja Equipo</a></li>
												<li><a href="#">Modificar Equipo</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Ligas</a>
											<ul>
												<li><a href="#">Alta Liga</a></li>
												<li><a href="#">Baja Liga</a></li>
												<li><a href="#">Modificar Liga</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Cartas</a>
											<ul>
												<li><a href="#">Alta Carta</a></li>
												<li><a href="#">Baja Carta</a></li>
												<li><a href="#">Modificar Carta</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li ><a href="#">Simulador</a>
									<ul>
										<li><a href="#">Construye tu Equipo</a></li>
									</ul>
								</li>
							</ul>
						</nav>
				</div>
				<!-- Main -->
				<section class="wrapper style1" style="height:500px;">
					<div class="container">
						<div id="content">

							<!-- Content -->
							
								<article>
									
									<section class="col-6 col-12-narrower">
								<h3><%=mensaje %></h3>
								
							</section>
								</article>
						</div>
					</div>
				</section>
										
			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Listados</h3>
								<ul class="links">
									<li><a href="jugadores.asp">Listado de Jugadores</a></li>
									<li><a href="equipos.asp">Listado de Equipos</a></li>
									<li><a href="ligas.asp">Listado de Ligas</a></li>
								
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Más Opciones</h3>
								<ul class="links">
									<li><a href="altaJugador.jsp">Alta Jugador</a></li>
									<li><a href="altaEquipo.jsp">Alta Equipo</a></li>
									<li><a href="altaLiga.jsp">Alta Liga</a></li>
									<li><a href="altaCarta.jsp">Alta Carta</a></li>
									<li><a href="modifiJugador.jsp">Modificar Jugador</a></li>
									<li><a href="modifiEquipo.jsp">Modificar Equipo</a></li>
									<li><a href="modifiLiga.jsp">Modificar Liga</a></li>
									<li><a href="modifiCarta.jsp">Modificar Carta</a></li>
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>Solicita Información</h3>
								<form>
									<div class="row gtr-50">
										<div class="col-6 col-12-mobilep">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="col-6 col-12-mobilep">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="col-12">
											<textarea name="message" id="message" placeholder="Message" rows="5"></textarea>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" class="button alt" value="Enviar Email" /></li>
											</ul>
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>

					<!-- Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
						</ul>

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; FIFA 20. Todos los derechos reservados</li><li>Design: <a href="https://www.centronelson.org">Centro Nelson</a></li>
							</ul>
						</div>

				</div>

		</div>

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