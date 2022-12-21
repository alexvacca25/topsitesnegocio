import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colores.dart';

class MensajeInferior {
  static porDefecto({String titulo = '', String mensaje = ''}){
    Get.snackbar(
      titulo, 
      mensaje,
      animationDuration: const Duration(seconds: 1),
      borderRadius: 5,
      duration: const Duration(milliseconds: 1500),
      backgroundColor: Colores.negro,
      colorText: Colores.blanco,
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: 300,
      margin: const EdgeInsets.all(20)
    );
  }
}