import 'package:get/get.dart';
import 'package:topsitesnegocio/app/data/models/cliente.dart';
import '../models/negocio.dart';

class NegocioRepository  extends GetxController  {
  
  final negocios = <Negocio>[
    Negocio(
      id: '0',
      numeroIdentificacion: '123456789',
      correo:'negocio@correo.com',
      estado: true,
      cuentaVerificada: false,
      usuario: Usuario(id: 1, correo: 'negocio@correo.com', clave: '123456', reestablecer: false),
    ),
    Negocio(
      id: '1',
      numeroIdentificacion: '123456789',
      correo:'negocio2@correo.com',
      estado: true,
      cuentaVerificada: false,
      usuario: Usuario(id: 1, correo: 'negocio2@correo.com', clave: '123456', reestablecer: true),
    ),
  ].obs;

  getAll(){
    return negocios.value;
  }
  getId(id){
    for (Negocio item in negocios.value) {
      if(item.id == id){
        return item;
      }
    }
    return null;
  }
  getCorreo(correo){
    for (Negocio item in negocios.value) {
      if(item.correo == correo){
        return item;
      }
    }
    return null;
  }
  delete(id){
    for (Negocio item in negocios.value) {
      if(item.id == id){
        negocios.value.remove(item);
        return true;
      }
    }
    return false;
  }
  edit(Negocio obj){
    for (var i = 0; i < negocios.value.length; i++) {
      if(negocios.value[i].id == obj.id){
        negocios.value[i] = obj;
        return negocios.value[i];
      }
    }
    return null;
  }
  add(Negocio obj){
    if(getCorreo(obj.correo)==null){
      negocios.value.add(obj);
      return true;
    }else{
      return false;
    }
  }

}
