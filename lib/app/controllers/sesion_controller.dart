import 'package:get/get.dart';
import 'package:topsitesnegocio/app/data/models/negocio.dart';
import 'package:topsitesnegocio/app/data/repository/negocio_repository.dart';
import 'package:topsitesnegocio/app/data/repository/sesion_repository.dart';
import 'package:topsitesnegocio/app/routes/app_pages.dart';


class SesionController extends GetxController {
  
  NegocioRepository negocioRepository = Get.put(NegocioRepository());
  SesionRepository sesionRepository = Get.put(SesionRepository());

  final negocio = Negocio().obs;

  Future<Map?> iniciarSesion(String correo, String clave)async{
    Map? response = await sesionRepository.get(correo, clave);
    if(response!['encontrado']){
      negocio.value = response['negocio'];
      Get.offAllNamed('/dashboard/inicio');
      // Get.offAllNamed(Routes.PRINCIPAL, parameters: {'url_0':'inicio'});
      return null;
    }
    return response;
  }
  Future<Map?> claveOlvidada(String correo)async{
    return await sesionRepository.claveOlvidada(correo);
  }
}