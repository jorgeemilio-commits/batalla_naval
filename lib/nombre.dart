class Nombre {
  late String candidato;

  Nombre(String c) {
    // Verifica longitud minima
    if (c.length < LongitudMinimaPermitida) {
      throw LongitudMinimaException();
    }

    // Verifica longitud maxima
    if (c.length > LongitudMaximaPermitida) {
      throw LongitudMaximaException();
    }

    // Verifica que el primer caracter no sea un número
    if (RegExp(r'^[0-9]').hasMatch(c)) {
      throw PrimerCaracterNumeroException();
    }

    // Verifica que no tenga caracteres especiales
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(c)) {
      throw CaracteresInvalidosException();
    }

    candidato = c;
  }
}

const int LongitudMinimaPermitida = 5;
const int LongitudMaximaPermitida = 15;

class LongitudMinimaException extends Error {}
class LongitudMaximaException extends Error {}
class PrimerCaracterNumeroException extends Error {}
class CaracteresInvalidosException extends Error {}