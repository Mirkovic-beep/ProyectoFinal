package Clases;

public class Genero {
	
	private int id;
	private String nombre;
	private String dificultad;
	
	public Genero(int id, String nombre, String dificultad) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.dificultad = dificultad;
	}
	
	public Genero() {
		
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

	public String getDificultad() {
		return dificultad;
	}

	public void setDificultad(String dificultad) {
		this.dificultad = dificultad;
	}

	@Override
	public String toString() {
		return "Genero [id=" + id + ", nombre=" + nombre + ", dificultad=" + dificultad + "]";
	}
	
	
	
	

}
