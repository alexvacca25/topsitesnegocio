import 'package:get/get.dart';
import 'package:topsitesnegocio/app/data/repository/negocio_repository.dart';

class SesionRepository extends GetxController{

  NegocioRepository negocioRepository = Get.find();

  Future<Map?> get(String correo, String clave)async{
    bool encontrado = false;
    for (var item in negocioRepository.negocios.value) {
      // if(item.usuario!.correo == correo){
      //   encontrado = true;
      // }
      if(item.usuario!.correo == correo && item.usuario!.clave == clave){        
        return {'encontrado':true, 'negocio':item};
      }
    }
    return {'encontrado' : encontrado};
  }

  Future<Map?> claveOlvidada(String correo)async{
    bool encontrado = false;
    for (var item in negocioRepository.negocios.value) {
      if(item.usuario!.correo == correo){
        item.usuario!.reestablecer = true;
        encontrado = true;
      }
    }
    return {'encontrado' : encontrado};
  }

  Future<bool> tokenValido(String token)async{
    for (var item in negocioRepository.negocios.value) {
      if(item.usuario!.correo == token && item.usuario!.reestablecer! == true){
        return true;
      }
    }
    return false;  
  }

}