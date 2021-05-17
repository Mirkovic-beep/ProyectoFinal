package Clases;

public class Desarrollo {
	
	private int id_videojeugo;
	private int id_desarrolladora;
	
	public Desarrollo(int id_videojeugo, int id_desarrolladora) {
		super();
		this.id_videojeugo = id_videojeugo;
		this.id_desarrolladora = id_desarrolladora;
	}
	
	public Desarrollo(){
		
	}

	public int getId_videojeugo() {
		return id_videojeugo;
	}

	public void setId_videojeugo(int id_videojeugo) {
		this.id_videojeugo = id_videojeugo;
	}

	public int getId_desarrolladora() {
		return id_desarrolladora;
	}

	public void setId_desarrolladora(int id_desarrolladora) {
		this.id_desarrolladora = id_desarrolladora;
	}
	
	
	

}
