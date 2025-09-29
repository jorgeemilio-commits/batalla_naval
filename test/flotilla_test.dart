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

    test('Barco lancha se crea correctamente en B2 hacia la derecha', () {
      // Crear una lancha (tamaño 2) en columna 1, fila 2 (B2) hacia la derecha
      final miBarco = Barco(
        tipo: TiposBarcos.lancha,
        puntoIncial: Punto(columna: 1, fila: 2), // B2
        direccion: DireccionesHacia.derecha,
      );

      final puntosOcupados = miBarco.elementos.map((e) => e.punto).toSet(); 

      // Definir los puntos esperados
      final puntoB2 = Punto(columna: 1, fila: 2);
      final puntoB3 = Punto(columna: 2, fila: 2); 

      // Definir un punto que NO debería estar ocupado
      final puntoB4 = Punto(columna: 3, fila: 2); 

      // Verificar que el barco tiene el tamaño correcto
      expect(puntosOcupados.length, miBarco.tamano);
      expect(puntosOcupados.length, 2); // Una lancha tiene tamaño 2

      // Verificar que los puntos correctos están ocupados
      expect(puntosOcupados, contains(puntoB2));
      expect(puntosOcupados, contains(puntoB3));

      // Verificar que el punto incorrecto NO está ocupado
      expect(puntosOcupados, isNot(contains(puntoB4)));
    });

    test('Barco bote se crea correctamente en A0', () {
      // Crear un bote (tamaño 1) en columna 0, fila 0 (A0)
      final miBarco = Barco(
        tipo: TiposBarcos.bote,
        puntoIncial: Punto(columna: 0, fila: 0), // A0
        direccion: DireccionesHacia.derecha,
      );

      final puntosOcupados = miBarco.elementos.map((e) => e.punto).toSet();

      final puntoA0 = Punto(columna: 0, fila: 0);
      final puntoA1 = Punto(columna: 1, fila: 0); // Punto que NO debería estar ocupado

      expect(puntosOcupados.length, miBarco.tamano);
      expect(puntosOcupados.length, 1); // Un bote tiene tamaño 1

      expect(puntosOcupados, contains(puntoA0));
      expect(puntosOcupados, isNot(contains(puntoA1)));
    });

    test('Barco submarino se crea correctamente en C3 hacia abajo', () {
      // Crear un submarino (tamaño 3) en columna 2, fila 3 (C3) hacia abajo
      final miBarco = Barco(
        tipo: TiposBarcos.submarino,
        puntoIncial: Punto(columna: 2, fila: 3), // C3
        direccion: DireccionesHacia.abajo,
      );

      final puntosOcupados = miBarco.elementos.map((e) => e.punto).toSet();

      final puntoC3 = Punto(columna: 2, fila: 3);
      final puntoC4 = Punto(columna: 2, fila: 4);
      final puntoC5 = Punto(columna: 2, fila: 5);
      final puntoC6 = Punto(columna: 2, fila: 6); // Punto que NO debería estar ocupado

      expect(puntosOcupados.length, miBarco.tamano);
      expect(puntosOcupados.length, 3); // Un submarino tiene tamaño 3

      expect(puntosOcupados, contains(puntoC3));
      expect(puntosOcupados, contains(puntoC4));
      expect(puntosOcupados, contains(puntoC5));
      expect(puntosOcupados, isNot(contains(puntoC6)));
    });

    test('Barco crucero se crea correctamente en G7 hacia la izquierda', () {
      // Crear un crucero (tamaño 4) en columna 6, fila 7 (G7) hacia la izquierda
      final miBarco = Barco(
        tipo: TiposBarcos.crucero,
        puntoIncial: Punto(columna: 6, fila: 7), // G7
        direccion: DireccionesHacia.izquierda,
      );

      final puntosOcupados = miBarco.elementos.map((e) => e.punto).toSet();

      final puntoG7 = Punto(columna: 6, fila: 7);
      final puntoF7 = Punto(columna: 5, fila: 7);
      final puntoE7 = Punto(columna: 4, fila: 7);
      final puntoD7 = Punto(columna: 3, fila: 7);
      final puntoC7 = Punto(columna: 2, fila: 7); // Punto que NO debería estar ocupado

      expect(puntosOcupados.length, miBarco.tamano);
      expect(puntosOcupados.length, 4); // Un crucero tiene tamaño 4

      expect(puntosOcupados, contains(puntoG7));
      expect(puntosOcupados, contains(puntoF7));
      expect(puntosOcupados, contains(puntoE7));
      expect(puntosOcupados, contains(puntoD7));
      expect(puntosOcupados, isNot(contains(puntoC7)));
    });

    test('Barco portaaviones se crea correctamente en A1 hacia arriba', () {
      // Crear un portaaviones (tamaño 5) en columna 0, fila 1 (A1) hacia arriba
      final miBarco = Barco(
        tipo: TiposBarcos.portaaviones,
        puntoIncial: Punto(columna: 0, fila: 4), // A4
        direccion: DireccionesHacia.arriba,
      );

      final puntosOcupados = miBarco.elementos.map((e) => e.punto).toSet();

      final puntoA4 = Punto(columna: 0, fila: 4);
      final puntoA3 = Punto(columna: 0, fila: 3);
      final puntoA2 = Punto(columna: 0, fila: 2);
      final puntoA1 = Punto(columna: 0, fila: 1);
      final puntoA0 = Punto(columna: 0, fila: 0);
      final puntoA5 = Punto(columna: 0, fila: 5); // Punto que NO debería estar ocupado

      expect(puntosOcupados.length, miBarco.tamano);
      expect(puntosOcupados.length, 5); // Un portaaviones tiene tamaño 5

      expect(puntosOcupados, contains(puntoA4));
      expect(puntosOcupados, contains(puntoA3));
      expect(puntosOcupados, contains(puntoA2));
      expect(puntosOcupados, contains(puntoA1));
      expect(puntosOcupados, contains(puntoA0));
      expect(puntosOcupados, isNot(contains(puntoA5)));
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