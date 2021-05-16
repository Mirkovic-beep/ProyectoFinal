package Clases;

public class Formato {
	
	private int id;
	private String nombre;
	private int Stock;
	
	
	public Formato(int id, String nombre, int stock) {
		super();
		this.id = id;
		this.nombre = nombre;
		Stock = stock;
	}
	
	public Formato() {
		
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public int getStock() {
		return Stock;
	}


	public void setStock(int stock) {
		Stock = stock;
	}


	@Override
	public String toString() {
		return "Formato [id=" + id + ", nombre=" + nombre + ", Stock=" + Stock + "]";
	}
	
	
	

}
