import 'package:topsitesnegocio/app/data/models/locacion.dart';
import 'package:topsitesnegocio/app/data/models/sede/evento.dart';

import 'combo_plan.dart';
import 'horario_sede.dart';
import 'imagenes_sede.dart';

class Sede {
  dynamic id;
  String? nombre;
  String? telefono;
  String? celular;
  Pais? pais;
  Departamento? departamento;
  Ciudad? ciudad;
  String? direccion;
  String? correo;
  String? descripcion;

  ImagenesSede? imagenes;
  Horario? horario;

  List<ComboPlan>? combosPlanes;
  List<Evento>? eventos;

  get getComboPlanes{
    return combosPlanes ?? [];
  }


  dynamic fechaRegistro;
  dynamic estado;

  Sede({
    this.id,
    this.nombre,
    this.telefono,
    this.celular,
    this.pais,
    this.departamento,
    this.ciudad,
    this.direccion,
    this.correo,
    this.descripcion,
    this.imagenes,
    this.horario,
    this.combosPlanes,
    this.fechaRegistro,
    this.estado,
  });

}


