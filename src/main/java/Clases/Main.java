package Clases;

import java.util.ArrayList;
import java.util.Iterator;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		BDController controlador = new BDController();
		
		Videojuego juego = new Videojuego(34,6,300,600,"Minecraft","+7",5,50.40,"PC","9");
		
		/*ArrayList<Videojuego> juegos = 	controlador.dameJuegosGenero(2);
		for (int i = 0; i < juegos.size(); i++) {
			System.out.println(juegos.get(i).toString());
		}*/
		
		//ArrayList<Videojuego> juegosCon = controlador.dameJuegosConsola("PC");
		//for (int i = 0; i < juegosCon.size(); i++) {
						//System.out.println(juegosCon.get(i).toString());
		//}
		System.out.println();
		System.out.println(controlador.dameCliente(controlador.dameCodigoClienteNombre("Galo")));
		
		for (int j = 0; j < 3; j++) {
			System.out.println(controlador.dameCompras(11).get(j).getId_cliente());

		}
	}

}
