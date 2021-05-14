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
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id) FROM cliente");
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
	
}