package Clases;

public class Local {
	
	private int id;
	private String nombre;
	private String localizaci�n;
	
	
	public Local(int id, String nombre, String localizaci�n) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.localizaci�n = localizaci�n;
	}
	
	public Local() {
		
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


	public String getLocalizaci�n() {
		return localizaci�n;
	}


	public void setLocalizaci�n(String localizaci�n) {
		this.localizaci�n = localizaci�n;
	}
	
	
	
	
	
	
	
	

}
