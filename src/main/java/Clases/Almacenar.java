package Clases;

public class Almacenar {
	
	private int id_videojuego;
	private int id_desarrolaldora;
	
	public Almacenar(int id_videojuego, int id_desarrolaldora) {
		super();
		this.id_videojuego = id_videojuego;
		this.id_desarrolaldora = id_desarrolaldora;
	}
	
	public Almacenar() {
		
	}

	public int getId_videojuego() {
		return id_videojuego;
	}

	public void setId_videojuego(int id_videojuego) {
		this.id_videojuego = id_videojuego;
	}

	public int getId_desarrolaldora() {
		return id_desarrolaldora;
	}

	public void setId_desarrolaldora(int id_desarrolaldora) {
		this.id_desarrolaldora = id_desarrolaldora;
	}
	
	

}
