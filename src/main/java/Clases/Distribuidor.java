package Clases;

public class Distribuidor {
	
	private int id;
	private String nombre;
	private String afiliacion;
	private String sede;
	
	public Distribuidor(int id, String nombre, String afiliacion, String sede) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.afiliacion = afiliacion;
		this.sede = sede;
	}
	
	public Distribuidor() {
		
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

	public String getAfiliacion() {
		return afiliacion;
	}

	public void setAfiliacion(String afiliacion) {
		this.afiliacion = afiliacion;
	}

	public String getSede() {
		return sede;
	}

	public void setSede(String sede) {
		this.sede = sede;
	}

	@Override
	public String toString() {
		return "Distribuidor [id=" + id + ", nombre=" + nombre + ", afiliacion=" + afiliacion + ", sede=" + sede + "]";
	}
	
	
	

}
