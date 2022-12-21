import 'sede.dart';

class Horario {
  dynamic id;
  int? permitirReservarCada;
  DateTime? tempoMinimoReservar;
  dynamic tiempoCancelacion;
  List<HorarioAtencion>? horarioAtencion;
  List<Excepcion>? excepciones;
  Horario({
    this.id,
    this.permitirReservarCada,
    this.tempoMinimoReservar,
    this.tiempoCancelacion,
    this.horarioAtencion,
    this.excepciones,
  });
}

class HorarioAtencion {
  dynamic id;
  bool lunes;
  bool martes;
  bool miercoles;
  bool jueves;
  bool viernes;
  bool sabado;
  bool domingo;
  int? cantidadMaxPersonas;
  dynamic horaInicio;
  dynamic horaFin;
  HorarioAtencion({
    this.id,
    this.lunes = true,
    this.martes = true,
    this.miercoles = true,
    this.jueves = true,
    this.viernes = true,
    this.sabado = true,
    this.domingo = true,
    this.cantidadMaxPersonas,
    this.horaInicio,
    this.horaFin,
  });

}

class Excepcion {
  dynamic id;
  bool lunes;
  bool martes;
  bool miercoles;
  bool jueves;
  bool viernes;
  bool sabado;
  bool domingo;
  dynamic exepcionPor;
  dynamic horaInicio;
  dynamic horaFin;
  dynamic fechaInicio;
  dynamic fechaFin;
  Excepcion({
    this.id,
    this.lunes = true,
    this.martes = true,
    this.miercoles = true,
    this.jueves = true,
    this.viernes = true,
    this.sabado = true,
    this.domingo = true,
    this.exepcionPor,
    this.horaInicio,
    this.horaFin,
    this.fechaInicio,
    this.fechaFin,
  });
}