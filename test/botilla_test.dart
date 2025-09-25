import 'package:batalla_naval/botilla.dart';
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
  });
}