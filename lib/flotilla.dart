import 'dart:io';
import 'package:batalla_naval/punto.dart';
import 'package:batalla_naval/elemento.dart'; 
enum TiposBarcos{bote,lancha,submarino,crucero,portaaviones}

enum DireccionesHacia{arriba,abajo,izquierda,derecha}

class Barco{ 
final TiposBarcos tipo;
final DireccionesHacia direccion; 
final Punto puntoIncial;
List<Elemento> _elementos = [];

int get tamano => mapaTamanos[tipo]!;

Barco({ 
  required this.tipo, 
  required this.puntoIncial, 
  required this.direccion
  })
  {
    int cuantasVeces = mapaTamanos[tipo]!;
    int columna = puntoIncial.columna;
    int fila = puntoIncial.fila;
    while (cuantasVeces > 0) {
      _elementos.add(
        Elemento(
          punto: Punto(columna: columna, fila: fila),
        ));
        columna += dColumna[direccion]!;
        fila += dfila[direccion]!;
        cuantasVeces--;
    }
  }
}


bool validarFlotilla(List<String> nombres) {
  if (_hayNombresRepetidos(nombres)) {
    throw Exception('No se permiten nombres de barcos repetidos.'); 
  }
  if (_excedeTamanoMaximoFlotilla(nombres)) {
    throw Exception('La flotilla no puede tener más de 5 barcos.'); 
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

const mapaTamanos = {
  TiposBarcos.bote:1,
  TiposBarcos.lancha:2,
  TiposBarcos.submarino:3,
  TiposBarcos.crucero:4,
  TiposBarcos.portaaviones:5
};

var dfila = {
  DireccionesHacia.arriba: -1,
  DireccionesHacia.abajo: 1,
  DireccionesHacia.izquierda: 0,
  DireccionesHacia.derecha: 0
};

var dColumna = {
  DireccionesHacia.arriba: 0,
  DireccionesHacia.abajo: 0,
  DireccionesHacia.izquierda: -1,
  DireccionesHacia.derecha: 1
};

class flotilla{
 final List<Barco> _barcos;
 int get cabtidadadBarcos => _barcos.length;
 flotilla(this._barcos){
  if (!esCantidadCorrecta()) throw FlotillaCantidadExcepcion();
  if(!sonTiposCorrectos(_barcos)) throw FlotillaTiposExcepcion();
  if(!estanEnPosicionAdecuada()) throw FlotillaPosicionExcepcion();
 }

 bool esCantidadCorrecta() {
   const int minBarcosPermitidos = 1;
   const int maxBarcosPermitidos = 5;
   return _barcos.length >= minBarcosPermitidos && _barcos.length <= maxBarcosPermitidos;
 }

 bool sonTiposCorrectos(List<Barco> barcos) {
   final Set<TiposBarcos> tiposEnFlotilla = {};
   for (final barco in barcos) {
     if (tiposEnFlotilla.contains(barco.tipo)) {
       return false;
     }
     tiposEnFlotilla.add(barco.tipo);
   }
   return true;
 }

 bool estanEnPosicionAdecuada() {
   const int boardMin = 0;
   const int boardMax = 9;

   for (final barco in _barcos) {
     for (final elemento in barco._elementos) {
       if (elemento.punto.columna < boardMin || elemento.punto.columna > boardMax ||
           elemento.punto.fila < boardMin || elemento.punto.fila > boardMax) {
         return false;
       }
     }
   }

   final Set<Punto> puntosOcupados = {};
   for (final barco in _barcos) {
     for (final elemento in barco._elementos) {
       if (!puntosOcupados.add(elemento.punto)) {
         return false;
       }
     }
   }

   return true;
 }
}

class FlotillaCantidadExcepcion implements Exception {
  String toString() => 'La flotilla debe tener entre 1 y 5 barcos.';
}
class FlotillaTiposExcepcion implements Exception {
  String toString() => 'La flotilla tiene tipos de barcos inválidos o repetidos.';
}
class FlotillaPosicionExcepcion implements Exception {
  String toString() => 'La flotilla tiene barcos fuera del tablero o en posiciones inválidas.';
}
