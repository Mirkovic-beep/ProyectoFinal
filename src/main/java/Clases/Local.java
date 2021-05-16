package Clases;

public class Local {
	
	private int id;
	private String nombre;
	private String localización;
	
	
	public Local(int id, String nombre, String localización) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.localización = localización;
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


	public String getLocalización() {
		return localización;
	}


	public void setLocalización(String localización) {
		this.localización = localización;
	}
	
	
	
	
	
	
	
	

}
