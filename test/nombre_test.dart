import 'package:test/test.dart';
import 'package:batalla_naval/nombre.dart';

void main() {
  group('Validaciones de Nombre', () {
    test('Debe tener un mínimo de longitud', () {
      expect(() => Nombre("abc"), throwsA(isA<LongitudMinimaException>()));
    });

    test('Debe tener un máximo de longitud', () {
      expect(() => Nombre("abcdefghijklmnop"), throwsA(isA<LongitudMaximaException>()));
    });

    test('No debe comenzar con un número', () {
      expect(() => Nombre("1nombre"), throwsA(isA<PrimerCaracterNumeroException>()));
    });

    test('No debe tener caracteres especiales', () {
      expect(() => Nombre("abc#de"), throwsA(isA<CaracteresInvalidosException>()));
    });
    
    test('No debe haber espacios', () {
      expect(() => Nombre("abc def"), throwsA(isA<CaracteresInvalidosException>()));
    });

    test('Debe aceptar un nombre válido', () {
      expect(Nombre("Carlos").candidato, equals("Carlos"));
    });

    test('Debe aceptar nombre con números pero no al inicio', () {
      expect(Nombre("Juan123").candidato, equals("Juan123"));
    });
  });
}
