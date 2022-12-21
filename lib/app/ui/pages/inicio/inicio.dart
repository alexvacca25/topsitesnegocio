import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/controllers/sesion_controller.dart';

import '../../theme/colores.dart';
import '../../theme/fonts.dart';

class InicioPage extends GetView {

  SesionController sesionController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colores.crema,
      appBar: AppBar(
        title: Text('Bienvenido'),
        // title: Text('Bienvenido!'),
        backgroundColor: Colores.crema,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colores.negro,
          fontFamily: Fuentes.ztgraftonBold,
          fontSize: 20
        ),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Row(
              
            ),
          )
        ],
      )
    );
  }
}