package Clases;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import org.apache.tomcat.util.http.fileupload.FileItem;



public class BDController {
	private Connection miConexion;

	public BDController() {
		try {
			
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) { 
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			this.miConexion = DriverManager.getConnection("jdbc:mysql://localhost/proyecto_final", "root", "");

		} catch (SQLException e) {
			System.out.println("Error en constructor BDController" + e.getMessage()); 
		}		
	}
	
	public BDController(Connection miConexion) {
		super();
		this.miConexion = miConexion;
	}

	public Connection getMiConexion() {
		return miConexion;
	}

	public void setMiConexion(Connection miConexion) {
		this.miConexion = miConexion;
	}
	
	
// Comprobar existencia
	
	public Boolean existeJuego(int id_videojuego) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM videojuegos WHERE id='" + id_videojuego + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeJuego del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeCliente(int id_cliente) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM clientes WHERE id='" + id_cliente + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeCliente del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeGenero(int id_genero) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM genero WHERE id='" + id_genero + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeGenero del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeFormato(int id_formato) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM formato WHERE  id='" + id_formato + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existFormato del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeDistribuidor(int id_distribuidor) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM distribuidor WHERE id='" + id_distribuidor + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeDistribuidor del BDController" + e.getMessage());
		}
		return existe;
	}
	
	
	public Boolean existeTransaccion(int id_transaccion) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM compra WHERE id_transaccion='" + id_transaccion + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeDistribuidor del BDController" + e.getMessage());
		}
		return existe;
	}

	
	
	
	public Boolean existeLocal(int id_local) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM local_fisico WHERE id='" + id_local + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeLocal del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeDesarrolladora(int id_desarrolladora) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM desarrolladora WHERE id='" + id_desarrolladora + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeDesarrolladora del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeJuegoDesarrolladora(int id_desarrolladora,int id_videojuego) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			
			ResultSet rs = miStatement.executeQuery("SELECT * FROM es_desarrollado WHERE id_desarrolladora IN (SELECT id FROM desarrolladora WHERE id='" + id_desarrolladora + "')" + " AND id_videojuego IN (SELECT id FROM videojuegos WHERE id='" + id_videojuego +"')");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeJuegoDesarrolladora del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeClienteJuegoLocal(int id_cliente,int id_videojuego, int id_local) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			
			ResultSet rs = miStatement.executeQuery("SELECT * FROM compra WHERE id_local IN (SELECT id FROM local_fisico WHERE id='" + id_local + "')" + " AND (id_videojuego IN (SELECT id FROM videojuegos WHERE id='" + id_videojuego +"'))" + " AND (id_cliente IN (SELECT id FROM clientes WHERE id='" + id_cliente +"'));");
			
			
			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeClienteJuegoLocal del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeJuegoLocal(int id_local,int id_videojuego) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			
			ResultSet rs = miStatement.executeQuery("SELECT * FROM almacenar WHERE id_local IN (SELECT id FROM local_fisico WHERE id='" + id_local + "')" + "AND id_videojuego IN (SELECT id FROM videojuegos WHERE id='" + id_videojuego +"')");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeJuegoLocal del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeJuegoFormato(int id_formato,int id_videojuego) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			
			ResultSet rs = miStatement.executeQuery("SELECT * FROM formato_juego WHERE id_formato IN (SELECT id FROM formato WHERE id='" + id_formato + "')" + "AND id_videojuego IN (SELECT id FROM videojuegos WHERE id='" + id_videojuego +"')");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeJuegoFormato del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeJuegoNombre(String nombre) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM videojuegos WHERE nombre like '" + nombre + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeJuegoNombre del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeLocalNombre(String nombre) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM local_fisico WHERE nombre like '" + nombre + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeLocalNombre del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeDesarrolladorNombre(String nombre) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM desarrolladora WHERE nombre like '" + nombre + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeDesarrolladoraNombre del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeClienteNombre(String nombre) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM clientes WHERE nombre like '" + nombre + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeClienteNombre del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeFormatoNombre(String nombre) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM formato WHERE nombre like '" + nombre + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeFormatoNombre del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeGeneroNombre(String nombre) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM genero WHERE nombre like '" + nombre + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeGeneroNombre del BDController" + e.getMessage());
		}
		return existe;
	}
	
	public Boolean existeDistribuidorNombre(String nombre) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM distribuidor WHERE nombre like '" + nombre + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeDistribuidorNombre del BDController" + e.getMessage());
		}
		return existe;
	}
	
	
// Extraer datos simples
	
	public ArrayList<Videojuego> dameVideojuegos() {
		ArrayList<Videojuego> juegos = new ArrayList<Videojuego>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM videojuegos");

			while (rs.next() == true) {
				juegos.add(new Videojuego(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getDouble(8),rs.getString(9),rs.getString(10)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameVideojuegos del BDController" + e.getMessage());
		}
		return juegos;
	}
	
	public ArrayList<Cliente> dameClientes() {
		ArrayList<Cliente> clientes = new ArrayList<Cliente>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM clientes");

			while (rs.next() == true) {
				clientes.add(new Cliente(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameClientes del BDController" + e.getMessage());
		}
		return clientes;
	}

	
	public ArrayList<Genero> dameGeneros() {
		ArrayList<Genero> generos = new ArrayList<Genero>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM genero");

			while (rs.next() == true) {
				generos.add(new Genero(rs.getInt(1),rs.getString(2),rs.getString(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameGeneros del BDController" + e.getMessage());
		}
		return generos;
	}
	
	public ArrayList<Local> dameLocales() {
		ArrayList<Local> locales = new ArrayList<Local>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM local_fisico");

			while (rs.next() == true) {
				locales.add(new Local(rs.getInt(1),rs.getString(2),rs.getString(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLocales del BDController" + e.getMessage());
		}
		return locales;
	}

	
	public ArrayList<Distribuidor> dameDistribuidores() {
		ArrayList<Distribuidor> distribuidores = new ArrayList<Distribuidor>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM distribuidor");

			while (rs.next() == true) {
				distribuidores.add(new Distribuidor(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameDistribuidores del BDController" + e.getMessage());
		}
		return distribuidores;
	}
	
	public ArrayList<Desarrolladora> dameDesarrolladoras() {
		ArrayList<Desarrolladora> desarrolladoras = new ArrayList<Desarrolladora>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM desarrolladora");

			while (rs.next() == true) {
				desarrolladoras.add(new Desarrolladora(rs.getInt(1),rs.getString(2),rs.getString(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameDesarrolladoras del BDController" + e.getMessage());
		}
		return desarrolladoras;
	}
	
	public ArrayList<Formato> dameFormatos() {
		ArrayList<Formato> formatos = new ArrayList<Formato>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM formato");

			while (rs.next() == true) {
				formatos.add(new Formato(rs.getInt(1),rs.getString(2),rs.getInt(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameFormatos del BDController" + e.getMessage());
		}
		return formatos;
	}
	

	
	public Videojuego dameJuego(int juego) {
		Videojuego jueguito = new Videojuego();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT*FROM videojuegos WHERE id='"+juego+"'");

			if (rs.first() == true) {
				 jueguito = (new Videojuego(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getDouble(8), rs.getString(9),rs.getString(10)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameEquipo del BDController" + e.getMessage());
		}
		return jueguito;
	}
	
	public Cliente dameCliente(int cliente) {
		Cliente clientes = new Cliente();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM clientes WHERE id='"+cliente+"'");

			if (rs.first() == true) {
				 clientes = (new Cliente(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCliente del BDController" + e.getMessage());
		}
		return clientes;
	}
	
	public Desarrolladora dameDesarrolladora(int desarrolladora) {
		Desarrolladora desarrolladoras = new Desarrolladora();
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM desarrolladora WHERE id='"+desarrolladora+"'");

			if (rs.first() == true) {
				 desarrolladoras = (new Desarrolladora(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameDesarrolladora del BDController" + e.getMessage());
		}
		return desarrolladoras;
	}
	
	public Distribuidor dameDistribuidor(int distribuidor) {
		Distribuidor distribuidores = new Distribuidor();
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM distribuidor WHERE id='"+distribuidor+"'");

			if (rs.first() == true) {
				 distribuidores = (new Distribuidor(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameDesarrolladora del BDController" + e.getMessage());
		}
		return distribuidores;
	}
	
	public Formato dameFormato(int formato) {
		Formato formatos = new Formato();
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM formato WHERE id='"+formato+"'");

			if (rs.first() == true) {
				 formatos = (new Formato(rs.getInt(1), rs.getString(2), rs.getInt(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameFormato del BDController" + e.getMessage());
		}
		return formatos;
	}
	
	public Genero dameGenero(int genero) {
		Genero generos = new Genero();
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM genero WHERE id='"+genero+"'");

			if (rs.first() == true) {
				 generos = (new Genero(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameGenero del BDController" + e.getMessage());
		}
		return generos;
	}
	
	public Local dameLocal(int local) {
		Local locales = new Local();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM local_fisico WHERE id='"+local+"'");

			if (rs.first() == true) {
				 locales = (new Local(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLocal del BDController" + e.getMessage());
		}
		return locales;
	}

	
	
// Datos complejos
	
	public ArrayList<Videojuego> dameJuegosConsola(String consola) {
		ArrayList<Videojuego> juegos = new ArrayList<Videojuego>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT*FROM videojuegos WHERE consola='"+consola+"'");

			while (rs.next() == true) {
				juegos.add(new Videojuego(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getDouble(8),rs.getString(9),rs.getString(10)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameJuegosConsola del BDController" + e.getMessage());
		}
		return juegos;
	}
	
	public ArrayList<Almacenar> dameLocal_videojuego() {
		ArrayList<Almacenar> almacenar = new ArrayList<Almacenar>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * from almacenar");

			while (rs.next() == true) {
				almacenar.add(new Almacenar(rs.getInt(1),rs.getInt(2)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLocalesJuego del BDController" + e.getMessage());
		}
		return almacenar;
	}
	
	public ArrayList<Desarrollo> dameDesarrolladora_videojuego() {
		ArrayList<Desarrollo> almacenar = new ArrayList<Desarrollo>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * from es_desarrollado");

			while (rs.next() == true) {
				almacenar.add(new Desarrollo(rs.getInt(1),rs.getInt(2)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameDesarrolladoraVideojuego del BDController" + e.getMessage());
		}
		return almacenar;
	}
	
	public ArrayList<Formato_juego> dameFormato_videojuego() {
		ArrayList<Formato_juego> formatos = new ArrayList<Formato_juego>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * from formato_juego");

			while (rs.next() == true) {
				formatos.add(new Formato_juego(rs.getInt(1),rs.getInt(2)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLocalesJuego del BDController" + e.getMessage());
		}
		return formatos;
	}
	
	
	public ArrayList<Integer> dameLocalesJuego(int id) {
		ArrayList<Integer> locales = new ArrayList<Integer>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT id_local from almacenar WHERE id_videojuego='"+id+"'");

			while (rs.next() == true) {
				locales.add(rs.getInt(1));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLocalesJuego del BDController" + e.getMessage());
		}
		return locales;
	}
	
	
	public ArrayList<Videojuego> dameJuegosOferta() {
		ArrayList<Videojuego> juegos = new ArrayList<Videojuego>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT*FROM videojuegos WHERE videojuegos.precio <= 20;");

			while (rs.next() == true) {
				juegos.add(new Videojuego(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getDouble(8),rs.getString(9),rs.getString(10)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameJuegosOferta del BDController" + e.getMessage());
		}
		return juegos;
	}
	
	public ArrayList<Videojuego> dameJuegosNuevos(int nuevo) {
		ArrayList<Videojuego> juegos = new ArrayList<Videojuego>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT*FROM videojuegos WHERE nuevo='"+nuevo+"'");

			while (rs.next() == true) {
				juegos.add(new Videojuego(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getDouble(8),rs.getString(9),rs.getString(10)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameJuegosNuevos del BDController" + e.getMessage());
		}
		return juegos;
	}
	
	public ArrayList<Videojuego> dameJuegos() {
		ArrayList<Videojuego> juegos = new ArrayList<Videojuego>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT*FROM videojuegos");

			while (rs.next() == true) {
				juegos.add(new Videojuego(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getDouble(8),rs.getString(9),rs.getString(10)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameJuegos del BDController" + e.getMessage());
		}
		return juegos;
	}
	
	
public ArrayList<Compra> dameCompra() {
		
		ArrayList<Compra> compras = new ArrayList<Compra>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM compra");

			while (rs.next() == true) {
				compras.add(new Compra(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getInt(5)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCompras del BDController" + e.getMessage());
		}
		return compras;
	}


	public ArrayList<Compra> dameCompras(int id_cliente) {
		
		ArrayList<Compra> compras = new ArrayList<Compra>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM compra WHERE id_cliente='"+id_cliente+"'");

			while (rs.next() == true) {
				compras.add(new Compra(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getInt(5)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCompras del BDController" + e.getMessage());
		}
		return compras;
	}
	
	
	public String dameDistribuidoraVideojuego(int id) {
		String distribuidora="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT nombre FROM distribuidor WHERE id in (SELECT id_distribuidor from videojuegos where id='"+id+"')");

			if (rs.first() == true) {
				distribuidora = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameDistribuidorLiga del BDController" + e.getMessage());
		}
		return distribuidora;	
	}
	
	public ArrayList<String> dameDesarrolladoraVideojuego(int id) {
		ArrayList<String> desarrolladoras = new ArrayList<String>();
				
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT nombre FROM desarrolladora WHERE id in (SELECT id_desarrolladora from es_desarrollado where id_videojuego in (SELECT id from videojuegos where id='"+id+"'));");

			while (rs.next() == true) {
				desarrolladoras.add(rs.getString(1));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameDesarrolladoraVideojuego del BDController" + e.getMessage());
		}
		return desarrolladoras;	
	}
	
	public ArrayList<String> dameFormatoVideojuego(int id) {
		ArrayList<String> formatos = new ArrayList<String>();
				
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT nombre FROM formato WHERE id in (SELECT id_formato from formato_juego where id_videojuego in (SELECT id from videojuegos where id='"+id+"'));");

			while (rs.next() == true) {
				formatos.add(rs.getString(1));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameFormatoVideojuego del BDController" + e.getMessage());
		}
		return formatos;	
	}
	
	public int dameDesarrolladoraVideojuegoId(int id) {
		int desarrolladora=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT id FROM desarrolladora WHERE id in (SELECT id_desarrolladora from es_desarrollado where id_videojuego in (SELECT id from videojuegos where id='"+id+"'));");

			if (rs.first() == true) {
				desarrolladora = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameDesarrolladoraVideojuegoId del BDController" + e.getMessage());
		}
		return desarrolladora;	
	}
	
	public ArrayList<String> dameLocalVideojuego(int id) {
		ArrayList<String> locales = new ArrayList<String>();

		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT nombre FROM local_fisico WHERE id in (SELECT id_local from almacenar where id_videojuego in (SELECT id from videojuegos where id='"+id+"'));");

			while (rs.next() == true) {
				locales.add(rs.getString(1));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLocalVideojuego del BDController" + e.getMessage());
		}
		return locales;	
	}
	
	public int dameLocalVideojuegoId(int id) {
		int id_videojuego=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT id FROM local_fisico WHERE id in (SELECT id_local from almacenar where id_videojuego in (SELECT id from videojuegos where id='"+id+"'));");

			if (rs.first() == true) {
				id_videojuego = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLocalVideojuego del BDController" + e.getMessage());
		}
		return id_videojuego;	
	}
	
	public int damePrecioVideojuego(int id) {
		int precio=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT precio FROM videojuegos WHERE id='"+id+"'");

			if (rs.first() == true) {
				precio = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en damePrecioVideojuego del BDController" + e.getMessage());
		}
		return precio;	
	}
	
	public String dameConsolaVideojuego(int id) {
		String consola = "";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT consola from videojuegos where id='"+id+"'");

			if (rs.first() == true) {
				consola = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameConsolaVideojuego del BDController" + e.getMessage());
		}
		return consola;	
	}


	
	public String dameNombreGenero(int id) {
		String genero="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT nombre FROM genero WHERE id IN (SELECT id_genero FROM videojuegos WHERE id='"+id+"')");
			
			if (rs.first() == true) {
				genero = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLocalVideojuego del BDController" + e.getMessage());
		}
		return genero;	
	}
	
	public String dameNombreDesarrolladora(int id) {
		String genero="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT nombre FROM desarrolladora WHERE id='"+id+"'");
			
			if (rs.first() == true) {
				genero = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLocalVideojuego del BDController" + e.getMessage());
		}
		return genero;	
	}
	
	public String dameNombreFormato(int id) {
		String formato="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT nombre FROM formato WHERE id='"+id+"'");
			
			if (rs.first() == true) {
				formato = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameNombreFormato del BDController" + e.getMessage());
		}
		return formato;	
	}
	
	public String dameNombreVideojuego(int id) {
		String genero="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT nombre FROM videojuegos WHERE id='"+id+"'");
			
			if (rs.first() == true) {
				genero = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameNombreVideojuego del BDController" + e.getMessage());
		}
		return genero;	
	}
	
	public String dameNombreDistribuidor(int id) {
		String distribuidor="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT nombre FROM distribuidor WHERE id='"+id+"'");
			
			if (rs.first() == true) {
				distribuidor = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameNombreDistribuidor del BDController" + e.getMessage());
		}
		return distribuidor;	
	}
	
	
	
	public String dameNombreCliente(int id) {
		String distribuidor="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT nombre FROM clientes WHERE id='"+id+"'");
			
			if (rs.first() == true) {
				distribuidor = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameNombreClientes del BDController" + e.getMessage());
		}
		return distribuidor;	
	}
	
	public String dameNombreLocal(int id) {
		String distribuidor="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT nombre FROM local_fisico WHERE id='"+id+"'");
			
			if (rs.first() == true) {
				distribuidor = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameNombreLocal del BDController" + e.getMessage());
		}
		return distribuidor;	
	}
	

	public int dameGeneroVideojuego(int id) {
		int genero=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT id FROM genero WHERE id IN (SELECT id_genero FROM videojuegos WHERE id='"+id+"')");
			
			if (rs.first() == true) {
				genero = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLocalVideojuego del BDController" + e.getMessage());
		}
		return genero;	
	}
	

	public String damePegiVideojuego(int id) {
		String pegi="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT pegi FROM videojuegos WHERE id='"+id+"'");
			
			if (rs.first() == true) {
				pegi = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en damePegiVideojuego del BDController" + e.getMessage());
		}
		return pegi;	
	}
	
	public int dameCodigoGeneroNombre(String nombre) {
		int id=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT id FROM genero WHERE nombre like '"+nombre+"'");
			
			if (rs.first() == true) {
				id = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCodigoGeneroNombre del BDController" + e.getMessage());
		}
		return id;	
	}
	
	public int dameCodigoVideojuegoNombre(String nombre) {
		int id=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT id FROM videojuegos WHERE nombre like '"+nombre+"'");
			
			if (rs.first() == true) {
				id = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCodigoJuegoNombre del BDController" + e.getMessage());
		}
		return id;	
	}
	
	public int dameCodigoDesarrolladoraNombre(String nombre) {
		int id=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT id FROM desarrolladora WHERE nombre like '"+nombre+"'");
			
			if (rs.first() == true) {
				id = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCodigoDesarrolladoraNombre del BDController" + e.getMessage());
		}
		return id;	
	}
	
	public int dameCodigoDistribuidorNombre(String nombre) {
		int id=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT id FROM distribuidor WHERE nombre like '"+nombre+"'");
			
			if (rs.first() == true) {
				id = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCodigoDistribuidorNombre del BDController" + e.getMessage());
		}
		return id;	
	}
	
	public int dameCodigoLocalNombre(String nombre) {
		int id=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(" SELECT id FROM local_fisico WHERE nombre like '"+nombre+"'");
			
			if (rs.first() == true) {
				id = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCodigoLocalNombre del BDController" + e.getMessage());
		}
		return id;	
	}
	
	public int dameCodigoClienteNombre(String nombre) {
		int id=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT id FROM clientes WHERE nombre like '"+nombre+"'");
			
			if (rs.first() == true) {
				id = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCodigoClienteNombre del BDController" + e.getMessage());
		}
		return id;	
	}
	
	public int dameCodigoFormatoNombre(String nombre) {
		int id=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT id FROM formato WHERE nombre like '"+nombre+"'");
			
			if (rs.first() == true) {
				id = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCodigoFormatoNombre del BDController" + e.getMessage());
		}
		return id;	
	}

	
	public ArrayList<Almacenar> dameAlmacenar() {
		ArrayList<Almacenar> almacenar = new ArrayList<Almacenar>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM almacenar");

			while (rs.next() == true) {
				almacenar.add(new Almacenar(rs.getInt(1),rs.getInt(2)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameAlmacenar del BDController" + e.getMessage());
		}
		return almacenar;
	}
	
	
	
	
	public ArrayList<Videojuego> dameJuegosGenero(int id) {
		ArrayList<Videojuego> juegos = new ArrayList<Videojuego>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			int id_genero = dameGeneroVideojuego(id);

			ResultSet rs = miStatement.executeQuery("SELECT * FROM videojuegos WHERE id_genero='"+id_genero+"'");

			while (rs.next() == true) {
				juegos.add(new Videojuego(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getDouble(8),rs.getString(9),rs.getString(10)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameJuegosGenero del BDController" + e.getMessage());
		}
		return juegos;
	}
	
	// Calcular codigos
	
	
	public int calcularCod_videojuego() {
		int id_videojuego = 1;
		try {
			Statement miStatement = this.miConexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id) FROM videojuegos");
			if (rs.first() == true) {
				id_videojuego = rs.getInt(1);
				id_videojuego++;
				}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			System.out.println("Error en calcularCod_liga del BDController" + e.getMessage());
		}
		return id_videojuego;
	}
	
	public int calcularCod_transaccion() {
		int id_videojuego = 1;
		try {
			Statement miStatement = this.miConexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id_transaccion) FROM compra");
			if (rs.first() == true) {
				id_videojuego = rs.getInt(1);
				id_videojuego++;
				}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			System.out.println("Error en calcularCodTransaccion del BDController" + e.getMessage());
		}
		return id_videojuego;
	}
	
	public int calcularCod_genero() {
		int id_genero = 1;
		try {
			Statement miStatement = this.miConexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id) FROM genero");
			if (rs.first() == true) {
				id_genero = rs.getInt(1);
				id_genero++;
				}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			System.out.println("Error en calcularCod_genero del BDController" + e.getMessage());
		}
		return id_genero;
	}
	
	public int calcularCod_desarrolladora() {
		int id_desarrolladora = 1;
		try {
			Statement miStatement = this.miConexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id) FROM desarrolladora");
			if (rs.first() == true) {
				id_desarrolladora = rs.getInt(1);
				id_desarrolladora++;
				}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			System.out.println("Error en calcularCod_desarrolladora del BDController" + e.getMessage());
		}
		return id_desarrolladora;
	}
	
	public int calcularCod_cliente() {
		int id_cliente = 1;
		try {
			Statement miStatement = this.miConexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id) FROM clientes");
			if (rs.first() == true) {
				id_cliente = rs.getInt(1);
				id_cliente++;
				}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			System.out.println("Error en calcularCod_cliente del BDController" + e.getMessage());
		}
		return id_cliente;
	}
	
	public int calcularCod_formato() {
		int id_formato = 1;
		try {
			Statement miStatement = this.miConexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id) FROM formato");
			if (rs.first() == true) {
				id_formato = rs.getInt(1);
				id_formato++;
				}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			System.out.println("Error en calcularCod_formato del BDController" + e.getMessage());
		}
		return id_formato;
	}
	
	public int calcularCod_local() {
		int id_local = 1;
		try {
			Statement miStatement = this.miConexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id) FROM local_fisico");
			if (rs.first() == true) {
				id_local = rs.getInt(1);
				id_local++;
				}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			System.out.println("Error en calcularCod_local del BDController" + e.getMessage());
		}
		return id_local;
	}
	
	public int calcularCod_distribuidor() {
		int id_distribuidor = 1;
		try {
			Statement miStatement = this.miConexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id) FROM distribuidor");
			if (rs.first() == true) {
				id_distribuidor = rs.getInt(1);
				id_distribuidor++;
				}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			System.out.println("Error en calcularCod_distribuidor del BDController" + e.getMessage());
		}
		return id_distribuidor;
	}
	
	//Insercciones
	
	public void insertarJuegoBDD(Videojuego juego) {
					
		try {
			Statement miStatement = this.miConexion.createStatement();
			
			String sql = "INSERT INTO videojuegos VALUES ('" + juego.getId() + "', '" + juego.getId_genero() + "', '" + juego.getNcopias() +  "', '" + juego.getDuracion() + "', '" + juego.getNombre() + "', '" + juego.getPegi() + "', '" + juego.getId_distribuidor() + "', '" + juego.getPrecio() + "', '" + juego.getConsola() + "', '" + juego.getNuevo() + "')";
			miStatement.executeUpdate(sql);			
			
			miStatement.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarJuego del BDController" + e.getMessage());
		}
	}
	
	
	public void insertarGeneroBDD(Genero genero) {
		
		try {
			Statement miStatement = this.miConexion.createStatement();
			
			String sql = "INSERT INTO genero VALUES ('" + genero.getId() + "', '" + genero.getNombre() + "', '" + genero.getDificultad() + "')";
			miStatement.executeUpdate(sql);			
			
			miStatement.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarGenero del BDController" + e.getMessage());
		}
	}
	
public void insertarFormatoBDD(Formato formato) {
		
		try {
			Statement miStatement = this.miConexion.createStatement();
			
			String sql = "INSERT INTO formato VALUES ('" + formato.getId() + "', '" + formato.getNombre() + "', '" + formato.getStock() + "')";
			miStatement.executeUpdate(sql);			
			
			miStatement.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarFormato del BDController" + e.getMessage());
		}
	}


public void insertarLocalBDD(Local local) {
	
	try {
		Statement miStatement = this.miConexion.createStatement();
		
		String sql = "INSERT INTO local_fisico VALUES ('" + local.getId() + "', '" + local.getNombre() + "', '" + local.getLocalización() + "')";
		miStatement.executeUpdate(sql);			
		
		miStatement.close();
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("Error en insertarLocal del BDController" + e.getMessage());
	}
}
	
	public void insertarDesarrolladoraBDD(Desarrolladora desarrolladora) {
			
			try {
				Statement miStatement = this.miConexion.createStatement();
				
				String sql = "INSERT INTO desarrolladora VALUES ('" + desarrolladora.getId() + "', '" + desarrolladora.getNombe() + "', '" + desarrolladora.getSede() + "')";
				miStatement.executeUpdate(sql);			
				
				miStatement.close();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Error en insertarDesarrolladora del BDController" + e.getMessage());
			}
		}
	
	public void insertarDistribuidorBDD(Distribuidor distribuidor) {
		
		try {
			Statement miStatement = this.miConexion.createStatement();
			
			String sql = "INSERT INTO distribuidor VALUES ('" + distribuidor.getId() + "', '" + distribuidor.getNombre() + "', '" + distribuidor.getAfiliacion() + "', '" + distribuidor.getSede() + "')";
			miStatement.executeUpdate(sql);			
			
			miStatement.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarDistribuidor del BDController" + e.getMessage());
		}
	}
	
public void insertarClienteBDD(Cliente cliente) {
		
		try {
			Statement miStatement = this.miConexion.createStatement();
			
			String sql = "INSERT INTO clientes VALUES ('" + cliente.getId() + "', '" + cliente.getNombre() + "', '" + cliente.getApellidos() + "', '" + cliente.getDni() + "')";
			miStatement.executeUpdate(sql);			
			
			miStatement.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarCliente del BDController" + e.getMessage());
		}
	}
	
	
	
	public void insertarJuegoDesarrolladora(int id_videojuego,int id_desarrolladora) {
		
			try {
				Statement miStatement = this.miConexion.createStatement();
				
				String sql ="INSERT INTO es_desarrollado values ('" +id_videojuego +"' , '"+ id_desarrolladora+"')";
				miStatement.executeUpdate(sql);
				
				miStatement.close();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Error en insertarJuegoDesarrolladora del BDController" + e.getMessage());
			}
		}
	
	
	public void insertarJuegoFormato(int id_videojuego,int id_formato) {
		
		try {
			Statement miStatement = this.miConexion.createStatement();
			
			String sql ="INSERT INTO formato_juego values ('" +id_videojuego +"' , '"+ id_formato+"')";
			miStatement.executeUpdate(sql);
			
			miStatement.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarJuegoFormato del BDController" + e.getMessage());
		}
	}
	
	
	public void insertarCompraClienteLocal(int id_local,int id_videojuego,int id_cliente,int id_transaccion,String fecha_compra) {
		
		try {
			Statement miStatement = this.miConexion.createStatement();
			
			String sql ="INSERT INTO compra values ('" +id_videojuego +"' , '"+ id_cliente+"' , '"+ id_transaccion +"' , '"+ fecha_compra + "' , '" + id_local+ "')";
			miStatement.executeUpdate(sql);
			
			miStatement.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarCompraClienteLocal del BDController" + e.getMessage());
		}
	}
	
	public void insertarJuegoLocal(int id_local,int id_videojuego) {
		
		try {
			Statement miStatement = this.miConexion.createStatement();
			
			String sql ="INSERT INTO almacenar values ('" +id_local +"' , '"+ id_videojuego+"')";
			miStatement.executeUpdate(sql);
			
			miStatement.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarJuegoLocal del BDController" + e.getMessage());
		}
	}
	
	
	//Bajas
	
	public void borrarVideojuego(int id_juego) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "DELETE FROM videojuegos WHERE id='"+id_juego+"'";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en borrarJuego del BDController" + e.getMessage());
		}
	}
	
	public void borrarCliente(int id_cliente) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "DELETE FROM clientes WHERE id='"+id_cliente+"'";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en borrarCliente del BDController" + e.getMessage());
		}
	}
	
	public void borrarLocal(int id_local) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "DELETE FROM local_fisico WHERE id='"+id_local+"'";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en borrarLocal del BDController" + e.getMessage());
		}
	}
	
	public void borrarGenero(int id_genero) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "DELETE FROM genero WHERE id='"+id_genero+"'";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en borrarGenero del BDController" + e.getMessage());
		}
	}
	
	public void borrarFormato(int id_formato) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "DELETE FROM formato WHERE id='"+id_formato+"'";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en borrarFormato del BDController" + e.getMessage());
		}
	}
	
	public void borrarDistribuidor(int id_distribuidor) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "DELETE FROM distribuidor WHERE id='"+id_distribuidor+"'";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en borrarDistribuidor del BDController" + e.getMessage());
		}
	}
	
	public void borrarDesarrolladora(int id_desarrolladora) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "DELETE FROM desarrolladora WHERE id='"+id_desarrolladora+"'";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en borrarDesarrolladora del BDController" + e.getMessage());
		}
	}
	
	public void borrarJuegoLocal(int id_local,int id_videojuego){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "DELETE FROM almacenar where id_local="+id_local+" and id_videojuego="+id_videojuego+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	public void borrarJuegoDesarrolladora(int id_desarrolladora,int id_videojuego){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "DELETE FROM es_desarrollado where id_videojuego="+id_videojuego+" and id_desarrolladora="+id_desarrolladora+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	public void borrarJuegoFormato(int id_formato,int id_videojuego){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "DELETE FROM formato_juego where id_videojuego="+id_videojuego+" and id_formato="+id_formato+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	public void borrarCompra(int id_videojuego,int id_cliente, int id_local){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "DELETE FROM compra where id_videojuego="+id_videojuego+" and id_cliente="+id_cliente+" and id_local="+id_local+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	//Modificaciones
	
	public void modificarVideojuego(Videojuego videojuego){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "UPDATE videojuegos SET id_genero="+videojuego.getId_genero()+
                    ", ncopias='"+videojuego.getNcopias()+"', duracion='"+videojuego.getDuracion()+
                    "', nombre='"+videojuego.getNombre()+"', pegi='"+videojuego.getPegi()+"', id_distribuidor='"+videojuego.getId_distribuidor()+"', precio='"+videojuego.getPrecio()+"', consola='"+videojuego.getConsola()+ "', nuevo='"+videojuego.getNuevo()+ "' where id="+videojuego.getId()+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	public void modificarCliente(Cliente cliente){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "UPDATE clientes SET nombre='"+cliente.getNombre()+
                    "', apellidos='"+cliente.getApellidos()+"', dni='"+cliente.getDni()+ "' where id="+cliente.getId()+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	public void modificarDesarrolladora(Desarrolladora desarrolladora){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "UPDATE desarrolladora SET nombre='"+desarrolladora.getNombe()+
                    "', sede='"+desarrolladora.getSede()+ "' where id="+desarrolladora.getId()+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	public void modificarDistribuidor(Distribuidor distribuidor){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "UPDATE distribuidor SET nombre='"+distribuidor.getNombre()+
                    "',afiliacion='"+distribuidor.getAfiliacion()+ "', sede='"+distribuidor.getSede()+"' where id="+distribuidor.getId()+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	public void modificarFormato(Formato formato){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "UPDATE formato SET nombre='"+formato.getNombre()+
                    "',stock='"+formato.getStock() +"' where id="+formato.getId()+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	public void modificarGenero(Genero genero){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "UPDATE genero SET nombre='"+genero.getNombre()+
                    "',dificultad='"+genero.getDificultad() +"' where id="+genero.getId()+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	public void modificarLocal(Local local){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "UPDATE local_fisico SET nombre='"+local.getNombre()+
                    "',localizacion='"+local.getLocalización() +"' where id="+local.getId()+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	public void modificarJuegoLocal(int id_local,int id_videojuego){
        try {
            Statement miStatement = this.miConexion.createStatement();
            String cadena = "UPDATE almacenar SET id_local='"+id_local+ "' where id_videojuego="+id_videojuego+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
}