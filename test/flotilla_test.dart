import 'package:batalla_naval/flotilla.dart';
import 'package:batalla_naval/punto.dart';
import 'package:test/test.dart';

void main() {
  group('validarFlotilla', () {
    test('Debe lanzar excepcion si hay nombres repetidos', () {
      final nombres = ['Portaaviones', 'Acorazado', 'Submarino','Submarino',];
      expect(() => validarFlotilla(nombres), throwsA(isA<Exception>()));
    });
    test('Debe lanzar excepcion si la flotilla excede 5 barcos', () {
      final nombres = ['Portaaviones', 'Acorazado', 'Submarino','a','b','c'];
      expect(() => validarFlotilla(nombres), throwsA(isA<Exception>()));
    });
    test('Debe devolver true si la flotilla es valida (sin repetidos y <= 5)', () {
      final nombres = ['Portaaviones', 'Acorazado', 'Submarino','Lancha','Bote'];
      expect(validarFlotilla(nombres), isTrue);
    });
  });

  group('Barco', () {
    test('Barco portaaviones tiene tamaño 5', () {
      final miBarco = Barco(
        tipo: TiposBarcos.portaaviones,
        puntoIncial: Punto(columna: 1, fila: 1),
        direccion: DireccionesHacia.derecha,
      );
      expect(miBarco.tamano, 5);
    });

    test('Barco lancha tiene tamaño 2', () {
      final miBarco = Barco(
        tipo: TiposBarcos.lancha,
        puntoIncial: Punto(columna: 1, fila: 1),
        direccion: DireccionesHacia.derecha,
      );
      expect(miBarco.tamano, 2);
    });
  });

  group('Flotilla', () {
    test('Debe lanzar FlotillaPosicionExcepcion si un barco esta fuera del tablero', () {
      final barcoFuera = Barco(
        tipo: TiposBarcos.lancha,
        puntoIncial: Punto(columna: 0, fila: 0),
        direccion: DireccionesHacia.arriba,
      );
      final barcos = [barcoFuera];
      expect(() => flotilla(barcos), throwsA(isA<FlotillaPosicionExcepcion>()));
    });

    test('Debe lanzar FlotillaPosicionExcepcion si los barcos se superponen', () {
      final barco1 = Barco(
        tipo: TiposBarcos.bote, 
        puntoIncial: Punto(columna: 1, fila: 1),
        direccion: DireccionesHacia.derecha,
      );
      final barco2 = Barco(
        tipo: TiposBarcos.bote, 
        puntoIncial: Punto(columna: 1, fila: 1),
        direccion: DireccionesHacia.derecha,
      );
      final barcos = [barco1, barco2];
      expect(() => flotilla(barcos), throwsA(isA<FlotillaPosicionExcepcion>()));
    });

    test('Debe lanzar FlotillaCantidadExcepcion si la cantidad de barcos es incorrecta (menos de 1)', () {
      final barcos = <Barco>[]; // Lista vacía
      expect(() => flotilla(barcos), throwsA(isA<FlotillaCantidadExcepcion>()));
    });

    test('Debe lanzar FlotillaCantidadExcepcion si la cantidad de barcos es incorrecta (mas de 5)', () {
      final barcos = [
        Barco(tipo: TiposBarcos.bote, puntoIncial: Punto(columna: 0, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.lancha, puntoIncial: Punto(columna: 2, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.submarino, puntoIncial: Punto(columna: 5, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.crucero, puntoIncial: Punto(columna: 0, fila: 2), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.portaaviones, puntoIncial: Punto(columna: 5, fila: 2), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.bote, puntoIncial: Punto(columna: 0, fila: 4), direccion: DireccionesHacia.derecha), 
      ];
      expect(() => flotilla(barcos), throwsA(isA<FlotillaCantidadExcepcion>()));
    });

    test('Debe lanzar FlotillaTiposExcepcion si hay tipos de barcos repetidos', () {
      final barco1 = Barco(
        tipo: TiposBarcos.bote,
        puntoIncial: Punto(columna: 0, fila: 0),
        direccion: DireccionesHacia.derecha,
      );
      final barco2 = Barco(
        tipo: TiposBarcos.bote, 
        puntoIncial: Punto(columna: 2, fila: 0),
        direccion: DireccionesHacia.derecha,
      );
      final barcos = [barco1, barco2];
      expect(() => flotilla(barcos), throwsA(isA<FlotillaTiposExcepcion>()));
    });

    test('Flotilla con barcos en posiciones correctas y sin solapamiento debe ser válida', () {
      final barcosCorrectos = [
        Barco(
          tipo: TiposBarcos.bote,
          puntoIncial: Punto(columna: 0, fila: 0),
          direccion: DireccionesHacia.derecha,
        ),
        Barco(
          tipo: TiposBarcos.lancha,
          puntoIncial: Punto(columna: 2, fila: 0),
          direccion: DireccionesHacia.derecha,
        ),
        Barco(
          tipo: TiposBarcos.submarino,
          puntoIncial: Punto(columna: 5, fila: 0),
          direccion: DireccionesHacia.derecha,
        ),
        Barco(
          tipo: TiposBarcos.crucero,
          puntoIncial: Punto(columna: 0, fila: 2),
          direccion: DireccionesHacia.derecha,
        ),
        Barco(
          tipo: TiposBarcos.portaaviones,
          puntoIncial: Punto(columna: 5, fila: 2),
          direccion: DireccionesHacia.derecha,
        ),
      ];
      expect(() => flotilla(barcosCorrectos), returnsNormally);
    });
  });
}