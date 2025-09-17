enum Estado{creada,iniciada,terminada}

class PARTIDA{
  late Estado estado;
  Partida(){
    estado=Estado.creada;
  }
}