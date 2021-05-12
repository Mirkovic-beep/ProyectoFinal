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
		String sqlconsultaPrepExisteJugador = "SELECT*FROM jugadores WHERE cod_jugador=?";
		String sqlconsultaPrepExisteEquipo = "SELECT * FROM equipos WHERE cod_equipo=?";
		String sqlconsultaPrepExisteNombreEquipo = "SELECT*FROM equipos WHERE nombre=?";
		String sqlconsultaPrepExisteLiga = "SELECT*FROM ligas WHERE cod_liga=?";
		
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

			ResultSet rs = miStatement.executeQuery("SELECT * FROM  WHERE formato id='" + id_formato + "'");

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
	
	public ArrayList<Genero> dameGeneros() {
		ArrayList<Genero> generos = new ArrayList<Genero>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM generos");

			while (rs.next() == true) {
				generos.add(new Genero(rs.getInt(1),rs.getString(1),rs.getString(2)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameGeneros del BDController" + e.getMessage());
		}
		return generos;
	}
	
	public ArrayList<Distribuidor> dameDistribuidores() {
		ArrayList<Distribuidor> distribuidores = new ArrayList<Distribuidor>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM distribuidores");

			while (rs.next() == true) {
				distribuidores.add(new Distribuidor(rs.getInt(1),rs.getString(1),rs.getString(2),rs.getString(3)));
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

			ResultSet rs = miStatement.executeQuery("SELECT * FROM desarrolladoras");

			while (rs.next() == true) {
				desarrolladoras.add(new Desarrolladora(rs.getInt(1),rs.getString(1),rs.getString(2)));
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

			ResultSet rs = miStatement.executeQuery("SELECT * FROM formatos");

			while (rs.next() == true) {
				formatos.add(new Formato(rs.getInt(1),rs.getString(1),rs.getInt(2)));
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
	
	public String dameDesarrolladoraVideojuego(int id) {
		String desarrolladora="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT nombre FROM desarrolladora WHERE id in (SELECT id_desarrolladora from es_desarrollado where id_videojuego in (SELECT id from videojuegos where id='"+id+"'));");

			if (rs.first() == true) {
				desarrolladora = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameDesarrolladoraVideojuego del BDController" + e.getMessage());
		}
		return desarrolladora;	
	}
	
	public String dameLocalVideojuego(int id) {
		String local="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT nombre FROM local_fisico WHERE id in (SELECT id_local from almacenar where id_videojuego in (SELECT id from videojuegos where id='"+id+"'));");

			if (rs.first() == true) {
				local = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLocalVideojuego del BDController" + e.getMessage());
		}
		return local;	
	}
	

}