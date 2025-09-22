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
    if (int.tryParse(c[0]) != null) {
      throw PrimerCaracterNumeroException();
    }

    // Verifica que no tenga caracteres especiales
    for (final codeUnit in c.codeUnits) {
      final isDigit = codeUnit >= 48 && codeUnit <= 57; // 0-9
      final isUppercase = codeUnit >= 65 && codeUnit <= 90; // A-Z
      final isLowercase = codeUnit >= 97 && codeUnit <= 122; // a-z

      if (!isDigit && !isUppercase && !isLowercase) {
        throw CaracteresInvalidosException();
      }
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