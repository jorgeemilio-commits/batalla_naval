import 'package:test/test.dart';

void main() {

    test('Al crearse debe marcarse', () {
      Partidida partida = Partida();
      expect(partida.marcada, false);
    });
}