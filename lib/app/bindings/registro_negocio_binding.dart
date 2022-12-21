import 'package:get/get.dart';

import '../controllers/negocio_registro_controller.dart';

class RegistroNegocioBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RegistroNegocioController>(RegistroNegocioController());
  }
}