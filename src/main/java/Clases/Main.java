package Clases;

import java.util.ArrayList;
import java.util.Iterator;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		BDController controlador = new BDController();
		
		
		/*ArrayList<Videojuego> juegos = 	controlador.dameJuegosGenero(2);
		for (int i = 0; i < juegos.size(); i++) {
			System.out.println(juegos.get(i).toString());
		}*/
		
		//ArrayList<Videojuego> juegosCon = controlador.dameJuegosConsola("PC");
		//for (int i = 0; i < juegosCon.size(); i++) {
						//System.out.println(juegosCon.get(i).toString());
		//}
		System.out.println();
		
		
		int id_transaccion = controlador.calcularCod_transaccion();
		System.out.println(id_transaccion);
		
		ArrayList<Almacenar> almacenes = controlador.dameLocal_videojuego();
		
		for (int i = 0; i < almacenes.size(); i++) {
			System.out.println(controlador.dameNombreVideojuego(almacenes.get(i).getId_videojuego()));
		}
	}

}
