import 'package:get/get.dart';
import 'package:topsitesnegocio/app/controllers/sesion_controller.dart';
import 'package:topsitesnegocio/app/data/models/cliente.dart';
import 'package:topsitesnegocio/app/data/models/locacion.dart';
import 'package:topsitesnegocio/app/data/models/negocio.dart';
import 'package:topsitesnegocio/app/data/models/red.dart';
import 'package:topsitesnegocio/app/data/repository/negocio_repository.dart';
import 'package:topsitesnegocio/app/data/repository/tipo_servicio_repository.dart';
import 'package:topsitesnegocio/app/ui/widgets/input.dart';

import '../data/models/promedio_venta_mes.dart';

class RegistroNegocioController extends GetxController {

  SesionController sesionController = Get.find();
  TipoServicioRepository tipoServicio = Get.find();
  NegocioRepository negocioRepository = Get.find();

  final paises = <Pais>[].obs;
  final departamentos = <Departamento>[].obs;
  final ciudades = <Ciudad>[].obs;
  final promedioVentaMes = <PromedioVentaMes>[].obs;

  @override
  void onInit() {
    paises.value = [Pais(id: 'Pais',nombre: 'Pais'), Pais(id: 0, nombre: 'Pais 1')];
    departamentos.value = [Departamento(id:'Departamento',nombre: 'Departamento'), Departamento(id: 0, nombre: 'departamento 1')];
    ciudades.value = [Ciudad(id:'Ciudad',nombre: 'Ciudad'), Ciudad(id: 0, nombre: 'ciudad 1')];
    promedioVentaMes.value = [PromedioVentaMes(id:'Promedio de ventas al mes',promedioVenta: 'Promedio de ventas al mes'), PromedioVentaMes(id: 0, promedioVenta: 'promedio 1')];
    super.onInit();
  }

  TextInputController txtNumeroIdentificacion = TextInputController();
  TextInputController txtNombreNegocio = TextInputController();
  TextInputController txtNombreContacto = TextInputController();
  TextInputController txtDireccion = TextInputController();
  TextInputController txtNumeroContacto = TextInputController();
  TextInputController txtCorreo = TextInputController();
  TextInputController txtConfirmacionCorreo = TextInputController();
  TextInputController txtInstagram = TextInputController();
  TextInputController txtMensaje = TextInputController();

  final tipoPersonaSeleccionado = 'Tipo de persona'.obs;
  final paisSeleccionado = 'Pais'.obs;
  final departamentoSeleccionado = 'Departamento'.obs;
  final ciudadSeleccionado = 'Ciudad'.obs;
  final promedioVentasSeleccionado = 'Promedio de ventas al mes'.obs;

  registrarNegocio(){
    if(validar()){
      return;
    }
    
    Negocio negocio = Negocio(
      tipoPersona : tipoPersonaSeleccionado.value,
      numeroIdentificacion : txtNumeroContacto.controlador.text,
      nombreNegocio : txtNombreNegocio.controlador.text,
      nombreContacto : txtNombreContacto.controlador.text,
      pais : Pais(nombre: paisSeleccionado.value),
      departamento : Departamento(nombre: departamentoSeleccionado.value),
      ciudad : Ciudad(nombre: ciudadSeleccionado.value),
      direccion : txtDireccion.controlador.text,
      numeroContacto: txtNumeroContacto.controlador.text,
      correo: txtCorreo.controlador.text,
      promedioVentaMes: PromedioVentaMes(promedioVenta: promedioVentasSeleccionado.value),
      redesSociales: [Red(url: txtInstagram.controlador.text)],
      mensaje: txtMensaje.controlador.text,
      estado: true,
      cuentaVerificada: false,
      usuario: Usuario(correo: txtCorreo.controlador.text, clave: txtNumeroIdentificacion.controlador.text)
    );

    if(negocioRepository.add(negocio)){
      Get.snackbar('Registrado', 'Registrado correctamente');
    }else{
      Get.snackbar('Error', 'Este correo ya esta registrado');
    }

  }

  validar(){
    bool error = false;
    String requerido = 'Este campo es requerido';
    String esNumerico = 'Este campo es numerico';
    String esCorreo = 'Debe ingresar un correo valido';
    
    if(txtCorreo.controlador.text != txtConfirmacionCorreo.controlador.text){
      txtConfirmacionCorreo.error.value = 'Los correos no coinciden';
      error = true;
    }

    if(!txtNumeroIdentificacion.controlador.text.isNum){
      txtNumeroIdentificacion.error.value = esNumerico;
      error = true;
    }
    if(txtNumeroIdentificacion.controlador.text.isEmpty){
      txtNumeroIdentificacion.error.value = requerido;
      error = true;
    }
    if(txtNombreNegocio.controlador.text.isEmpty){
      txtNombreNegocio.error.value = requerido;
      error = true;
    }
    if(txtNombreContacto.controlador.text.isEmpty){
      txtNombreContacto.error.value = requerido;
      error = true;
    }
    if(txtDireccion.controlador.text.isEmpty){
      txtDireccion.error.value = requerido;
      error = true;
    }
    if(!txtNumeroContacto.controlador.text.isNum){
      txtNumeroContacto.error.value = esNumerico;
      error = true;
    }
    if(txtNumeroContacto.controlador.text.isEmpty){
      txtNumeroContacto.error.value = requerido;
      error = true;
    }
    if(!txtCorreo.controlador.text.isEmail){
      txtCorreo.error.value = esCorreo;
      error = true;
    }
    if(txtCorreo.controlador.text.isEmpty){
      txtCorreo.error.value = requerido;
      error = true;
    }
    if(!txtConfirmacionCorreo.controlador.text.isEmail){
      txtConfirmacionCorreo.error.value = esCorreo;
      error = true;
    }
    if(txtConfirmacionCorreo.controlador.text.isEmpty){
      txtConfirmacionCorreo.error.value = requerido;
      error = true;
    }
    if(txtInstagram.controlador.text.isEmpty){
      txtInstagram.error.value = requerido;
      error = true;
    }
    if(txtMensaje.controlador.text.isEmpty){
      txtMensaje.error.value = requerido;
      error = true;
    }
    return error;
  }

}