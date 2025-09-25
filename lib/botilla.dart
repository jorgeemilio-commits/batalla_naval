import 'dart:io';
import 'package:batalla_naval/punto.dart'; // Corregido el nombre del paquete
import 'package:batalla_naval/elemento.dart'; // Corregido el nombre del paquete y la convención de minúsculas
enum TiposBarcos{bote,lancha,submarino,crucero,portaaviones}

enum DireccionesHacia{arriba,abajo,izquierda,derecha} // Corregido el typo 'DreccionesHacia'

class Barco{ // Corregido el nombre de la clase a 'Barco' (capitalizado)
final TiposBarcos tipo;
final DireccionesHacia direccion; // Corregido el typo 'DreccionesHacia'
final Punto puntoIncial;
List<Elemento> _elementos =[];

Barco({ // Corregido el nombre del constructor
  required this.tipo, 
  required this.puntoIncial, 
  required this.direccion
  });

int get tamano { // Corregido el nombre del getter a 'tamano' (sin 'ñ')
  
    switch (tipo) {
      case TiposBarcos.bote:
        return 1;
      case TiposBarcos.lancha:
        return 2;
      case TiposBarcos.submarino:
        return 3;
      case TiposBarcos.crucero:
        return 4;
      case TiposBarcos.portaaviones:
        return 5;
    }
  }

}

bool validarFlotilla(List<String> nombres) {
  if (_hayNombresRepetidos(nombres)) {
    throw Exception('No se permiten nombres de barcos repetidos.'); // Eliminado el 'return true;' incorrecto
  }
  if (_excedeTamanoMaximoFlotilla(nombres)) {
    throw Exception('La flotilla no puede tener más de 5 barcos.'); // Eliminado el 'return true;' incorrecto
  }
  return true; // Si todas las validaciones pasan, la flotilla es válida
}

bool _hayNombresRepetidos(List<String> nombres) {
  return nombres.length != nombres.toSet().length;
}

bool _excedeTamanoMaximoFlotilla(List<String> nombres) {
   const int maximoPermitido = 5;
  return nombres.length > maximoPermitido;
}