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
    final Set<String> allowedCharsSet = caracteresPermitidos.split('').toSet();
    for (final char in c.split('')) {
      if (!allowedCharsSet.contains(char)) {
        throw CaracteresInvalidosException();
      }
    }
    // Si pasa todas las validaciones, asigna el nombre
    candidato = c;
  }
}

const caracteresPermitidos = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZñÑ0123456789';
const int LongitudMinimaPermitida = 5;
const int LongitudMaximaPermitida = 15;

class LongitudMinimaException extends Error {}
class LongitudMaximaException extends Error {}
class PrimerCaracterNumeroException extends Error {}
class CaracteresInvalidosException extends Error {}