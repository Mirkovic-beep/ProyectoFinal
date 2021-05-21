package Clases;

public class Almacenar {
	
	private int id_videojuego;
	private int id_local;
	
	public Almacenar(int id_local, int id_videojuego) {
		super();
		this.id_videojuego = id_videojuego;
		this.id_local = id_local;
	}
	
	public Almacenar() {
		
	}

	public int getId_videojuego() {
		return id_videojuego;
	}

	public void setId_videojuego(int id_videojuego) {
		this.id_videojuego = id_videojuego;
	}

	public int getId_local() {
		return id_local;
	}

	public void setId_desarrolaldora(int id_local) {
		this.id_local = id_local;
	}
	
	

}
