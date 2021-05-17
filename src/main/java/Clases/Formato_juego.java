package Clases;

public class Formato_juego {
	
	private int id_videojuego;
	private int id_formato;
	
	public Formato_juego(int id_videojuego, int id_formato) {
		super();
		this.id_videojuego = id_videojuego;
		this.id_formato = id_formato;
	}

	public Formato_juego() {
		super();
	}

	public int getId_videojuego() {
		return id_videojuego;
	}

	public void setId_videojuego(int id_videojuego) {
		this.id_videojuego = id_videojuego;
	}

	public int getId_formato() {
		return id_formato;
	}

	public void setId_formato(int id_formato) {
		this.id_formato = id_formato;
	}
	
	
	
	

}
