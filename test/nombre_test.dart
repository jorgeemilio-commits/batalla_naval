import 'package:test/test.dart';
import 'package:batalla_naval/nombre.dart';

void main(){
  test('Debe tener un minimo de longitud', () {
    expect(() => Nombre(""), throwsA(isA<LongitudMinimaException>()));

  });
}