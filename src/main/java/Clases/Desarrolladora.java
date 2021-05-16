package Clases;

public class Desarrolladora {
	
	private int id;
	private String nombe;
	private String sede;
	
	public Desarrolladora(int id, String nombe, String sede) {
		super();
		this.id = id;
		this.nombe = nombe;
		this.sede = sede;
	}
	
	public Desarrolladora() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombe() {
		return nombe;
	}

	public void setNombe(String nombe) {
		this.nombe = nombe;
	}

	public String getSede() {
		return sede;
	}

	public void setSede(String sede) {
		this.sede = sede;
	}

	@Override
	public String toString() {
		return "Desarrolladora [id=" + id + ", nombe=" + nombe + ", sede=" + sede + "]";
	}
	
	

}
