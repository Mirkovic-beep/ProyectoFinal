package Clases;

import java.util.ArrayList;
import java.util.Iterator;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		BDController controlador = new BDController();
		
		
		//ArrayList<Videojuego> juegos = 	controlador.dameVideojuegos();
		//for (int i = 0; i < juegos.size(); i++) {
			//System.out.println(juegos.get(i).toString());
		//}
		
		//ArrayList<Videojuego> juegosCon = controlador.dameJuegosConsola("PC");
		//for (int i = 0; i < juegosCon.size(); i++) {
						//System.out.println(juegosCon.get(i).toString());
		//}
		
		System.out.println(controlador.existeCliente(0));
		
		System.out.println(controlador.dameJuego(4));
		
		
	}

}
