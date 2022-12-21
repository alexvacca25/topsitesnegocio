import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/data/models/sede/combo_plan.dart';
import 'package:topsitesnegocio/app/routes/app_pages.dart';
import 'package:topsitesnegocio/app/ui/widgets/snackbar.dart';

import '../../../../../data/models/sede/horario_sede.dart';
import '../../../../../data/models/sede/imagenes_sede.dart';
import '../../../../../data/models/sede/sede.dart';
import '../../../../../data/repository/sede_repository.dart';
import '../../../../widgets/input.dart';

class AgregarEditarSedeController extends GetxController {

  TextInputController txtNombreSede = TextInputController();
  TextInputController txtTelefono = TextInputController();
  TextInputController txtCelular = TextInputController();
  TextInputController txtDireccion = TextInputController();
  TextInputController txtCorreo = TextInputController();
  TextInputController txtDescripcion = TextInputController();

  bool esEditar = false;

  Sede? sede;

  final buscando = true.obs;

  SedeRepository sedeRepository = Get.find();
  ImagenesSede imagenesSede = ImagenesSede(fotosAdicionales: []);
  
  final horario = Horario(excepciones: [], horarioAtencion: []).obs;
  final combosPlanes = <ComboPlan>[].obs;

  
  void cargarDatosSede() async{
    sede = null;
    sede = await sedeRepository.getId(Get.parameters['id']);
    esEditar = sede != null;
    if(sede!=null){
      txtNombreSede.controlador.text = sede!.nombre ?? '';
      txtTelefono.controlador.text = sede!.telefono ?? '';
      txtCelular.controlador.text = sede!.celular ?? '';
      txtDireccion.controlador.text = sede!.direccion ?? '';
      txtCorreo.controlador.text = sede!.correo ?? '';
      txtDescripcion.controlador.text = sede!.descripcion ?? '';
      if(sede!.horario==null){
        horario.value.horarioAtencion =  [];
        horario.value.excepciones = [];
      }else{
        horario.value = sede!.horario!;
        horario.value.horarioAtencion = sede!.horario!.horarioAtencion ?? [];
        horario.value.excepciones = sede!.horario!.excepciones ?? [];
      }
      combosPlanes.value = sede!.getComboPlanes;
      buscando.value = false;
    }else{
      Get.offAllNamed('/dashboard/administrar_negocio');
      MensajeInferior.porDefecto(mensaje: 'Error', titulo: 'Sede no encontrada');
    }
  }

  guardar(){
    if(esEditar){
      editar();
    }else{
      agregar();
    }
  }

  agregar(){
    sedeRepository.add(getSede());
    Get.snackbar('Agregado', 'Se agrego correctamente', snackPosition: SnackPosition.BOTTOM, maxWidth: 500, margin: EdgeInsets.all(20));
  }
  
  editar(){
    Sede nueva = getSede();
    nueva.id = sede!.id;
    sedeRepository.edit(nueva);
    Get.snackbar('Editado', 'Se Editó correctamente', snackPosition: SnackPosition.BOTTOM, maxWidth: 500, margin: EdgeInsets.all(20));
  }

  getSede(){
    Sede nueva = Sede();
    nueva.nombre = txtNombreSede.controlador.text;
    nueva.telefono = txtTelefono.controlador.text;
    nueva.celular = txtCelular.controlador.text;
    nueva.direccion = txtDireccion.controlador.text;
    nueva.correo = txtCorreo.controlador.text;
    nueva.descripcion = txtDescripcion.controlador.text;
    nueva.imagenes = imagenesSede;
    nueva.horario = Horario(excepciones: horario.value.excepciones, horarioAtencion: horario.value.horarioAtencion, permitirReservarCada: horario.value.permitirReservarCada);
    return nueva;
  }

}