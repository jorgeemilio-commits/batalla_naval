import 'package:batalla_naval/partida.dart';
import 'package:test/test.dart';

void main() {

    test('Al crearse debe marcarse', () {
      Partida partida = Partida();
      expect(partida.estado, equals(Estado.creada));
    });
}
