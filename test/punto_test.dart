import 'dart:math';
import 'package:batalla_naval/punto.dart';
import 'package:test/test.dart';

void main() {
  test('', () {

    Punto p1 = Punto(columna: 1, fila: 1);
    Punto p2 = Punto(columna: 2, fila: 1);
      expect(p1.distancia(p2), equals(1));
  });

    test('Deben de estar a 2 cordenadas de distancia', () {

    Punto p1 = Punto(columna: 1, fila: 1);
      Punto p2 = Punto(columna: 3, fila: 1);
     expect(p1.distancia(p2), equals(2));
  });

test('Deben de estar a 2 cordenadas de distancia', () {

    Punto p1 = Punto(columna: 1, fila: 1);
    Punto p2 = Punto(columna: 3, fila: 1);
    expect(p1.distancia(p2), equals(2));
  });  
  

  test('1,1', () {

    Punto p1 = Punto(columna: 1, fila: 1);
    Punto p2 = Punto(columna: 3, fila: 1);
    expect(p1.distancia(p2), equals(2));
  });  
  


}