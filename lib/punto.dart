import 'dart:math';

class Punto {
final int columna;
final int fila;

Punto({required this.columna, required this.fila});


int distancia(Punto otro){
int x = columna - otro.columna;
int y = fila - otro.fila;

num hipo = pow(x,2) + pow(y,2);
num raiz = sqrt(hipo);
return raiz.toInt();

}
}