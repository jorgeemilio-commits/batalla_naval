import 'package:batalla_naval/flotilla.dart';
import 'package:batalla_naval/punto.dart';
import 'package:test/test.dart';

void main() {
  group('hayNombresRepetidos', () {
    test('Debe devolver false si no hay nombres repetidos', () {
      final nombres = ['Portaaviones', 'Acorazado', 'Submarino','Submarino',];
      expect(validarFlotilla  (nombres), isFalse);
   });
   test('La flotilla dede ser maximo de 5 barcos', () {
      final nombres = ['Portaaviones', 'Acorazado', 'Submarino','a','b',];
      expect(validarFlotilla(nombres), isFalse);
      
   });
 


  test('Barco portaaviones', () {
    final miBarco = Barco(
      tipo: TiposBarcos.portaaviones,
      puntoIncial: Punto(columna: 1, fila: 1),
      direccion: DireccionesHacia.derecha,
    );
      expect(miBarco.tamano, 5);
   });

   test('Barco lancha es 2', () {
    final miBarco = Barco(
      tipo: TiposBarcos.lancha,
      puntoIncial: Punto(columna: 1, fila: 1),
      direccion: DireccionesHacia.derecha,
    );
      expect(miBarco.tamano, 2);
   });

   test('Barco lancha es 2', () {
    final miBarco = Barco(
      tipo: TiposBarcos.lancha,
      puntoIncial: Punto(columna: 1, fila: 1),
      direccion: DireccionesHacia.derecha,
    );
      expect(miBarco.tamano, 3);
   });

   test('Barco lancha no puede estar afuera', () {
    final miBarco = Barco(
      tipo: TiposBarcos.lancha,
      puntoIncial: Punto(columna: 1, fila: 1),
      direccion: DireccionesHacia.arriba,
    );
      expect(miBarco.tamano, 2);
   });

var barcosIncorrectos = [
    Barco(
      tipo: TiposBarcos.bote,
      puntoIncial: Punto(columna: 1, fila: 1),
      direccion: DireccionesHacia.arriba,
    ),
    Barco(
      tipo: TiposBarcos.lancha,
      puntoIncial: Punto(columna: 1, fila: 1),
      direccion: DireccionesHacia.abajo,
    ),
    Barco(
      tipo: TiposBarcos.submarino,
      puntoIncial: Punto(columna: 1, fila: 1),
      direccion: DireccionesHacia.izquierda,
    ),
    Barco(
      tipo: TiposBarcos.crucero,
      puntoIncial: Punto(columna: 1, fila: 1),
      direccion: DireccionesHacia.derecha,
    ),
    Barco(
      tipo: TiposBarcos.portaaviones,
      puntoIncial: Punto(columna: 1, fila: 1),
      direccion: DireccionesHacia.arriba,
    ),
  ];
  test('Flotilla con barcos en posiciones incorrectas', () {
    expect(() => flotilla(barcosIncorrectos), throwsA(isA<FlotillaPosicionExcepcion>()));
  });
}