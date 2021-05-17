package Clases;

public class Compra {
	
	private int id_videojuego;
	private int id_cliente;
	private int id_transaccion;
	private String fecha_compra;
	private int id_local;
	
	public Compra(int id_videojuego, int id_cliente, int id_transaccion, String fecha_compra, int id_local) {
		super();
		this.id_videojuego = id_videojuego;
		this.id_cliente = id_cliente;
		this.id_transaccion = id_transaccion;
		this.fecha_compra = fecha_compra;
		this.id_local = id_local;
	}
	
	public Compra() {
		
	}

	public int getId_videojuego() {
		return id_videojuego;
	}

	public void setId_videojuego(int id_videojuego) {
		this.id_videojuego = id_videojuego;
	}

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public int getId_transaccion() {
		return id_transaccion;
	}

	public void setId_transaccion(int id_transaccion) {
		this.id_transaccion = id_transaccion;
	}

	public String getFecha_compra() {
		return fecha_compra;
	}

	public void setFecha_compra(String fecha_compra) {
		this.fecha_compra = fecha_compra;
	}

	public int getId_local() {
		return id_local;
	}

	public void setId_local(int id_local) {
		this.id_local = id_local;
	}
	
	
	
	
	

}
