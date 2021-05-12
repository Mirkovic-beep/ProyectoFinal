package Clases;

public class Videojuego {
	
	private int id;
	private int id_genero;
	private int ncopias;
	private int duracion;
	private String nombre;
	private String pegi;
	private int id_distribuidor;
	private double precio;
	private String consola;
	private String nuevo;
	
	
	public Videojuego(int id, int id_genero, int ncopias, int duracion, String nombre, String pegi, int id_distribuidor,
			double precio,String consola,String nuevo) {
		super();
		this.id = id;
		this.id_genero = id_genero;
		this.ncopias = ncopias;
		this.duracion = duracion;
		this.nombre = nombre;
		this.pegi = pegi;
		this.id_distribuidor = id_distribuidor;
		this.precio = precio;
		this.consola = consola;
		this.nuevo = nuevo;
	}
	
	public Videojuego() {
		// TODO Auto-generated constructor stub
	}

	public String getNuevo() {
		return nuevo;
	}
	
	public void setNuevo(String nuevo) {
		this.nuevo = nuevo;
	}
	
	
	public String getConsola() {
		return consola;
	}
	
	public void setConsola(String consola) {
		this.consola = consola;
	}
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getId_genero() {
		return id_genero;
	}


	public void setId_genero(int id_genero) {
		this.id_genero = id_genero;
	}


	public int getNcopias() {
		return ncopias;
	}


	public void setNcopias(int ncopias) {
		this.ncopias = ncopias;
	}


	public int getDuracion() {
		return duracion;
	}


	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getPegi() {
		return pegi;
	}


	public void setPegi(String pegi) {
		this.pegi = pegi;
	}


	public int getId_distribuidor() {
		return id_distribuidor;
	}


	public void setId_distribuidor(int id_distribuidor) {
		this.id_distribuidor = id_distribuidor;
	}


	public double getPrecio() {
		return precio;
	}


	public void setPrecio(double precio) {
		this.precio = precio;
	}

	@Override
	public String toString() {
		return "Videojuego [id=" + id + ", id_genero=" + id_genero + ", ncopias=" + ncopias + ", duracion=" + duracion
				+ ", nombre=" + nombre + ", pegi=" + pegi + ", id_distribuidor=" + id_distribuidor + ", precio="
				+ precio + ", consola=" + consola + "]";
	}



	
	
	
	
	

}
