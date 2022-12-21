import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/controllers/sesion_controller.dart';
import 'package:topsitesnegocio/app/data/repository/sede_repository.dart';

import '../../inicio/inicio.dart';
import '../../sede/controller/sede_controller.dart';
import '../../sede/pages/tabs_sede_page.dart';
import '../../sede/sede_list.dart';


class DashboardController extends GetxController {

  int seleccionado = 0;
  String vista = '';
  final page = Container().obs;

  SesionController sesionController = Get.find();
  SedeRepository sedeRepository = Get.find();
  SedeController sedeController = Get.put(SedeController());
  

  @override
  void onInit() {
    vista = armarUrl(Get.parameters);    
    bool vistaEncontrada = false; 
    for (var i = 0; i < rutas.length; i++) {
      if(rutas[i]['url']==vista){
        seleccionado=i;
        vistaEncontrada = true;
        break;
      }
    }

    if (vistaEncontrada == false) {
      Get.offAllNamed('/dashboard/inicio');
    }

    page.value = Container(child: rutas[seleccionado]['vista'],);

    super.onInit();
  }

  armarUrl(Map<String,dynamic> parametros){
    String ruta = '';
    parametros.forEach(
      (key, value) { 
        if(key.contains('url')){
          ruta += '$value/';
        }
      }
    );
    return ruta;
  }

  List vistas = [
    {
      'icono':BootstrapIcons.house,
      'nombre':'Inicio',
      'url':'inicio',
    },
    {
      'icono':BootstrapIcons.shop,
      'nombre':'Administrar Negocio',
      'url':'administrar_negocio',
    },
    {
      'icono':BootstrapIcons.folder,
      'nombre':'Documentación',
      'url':'documentacion',
    },
    {
      'icono':BootstrapIcons.person,
      'nombre':'Usuarios y permisos',
      'url':'usuarios_permisos',   
    },
    {
      'icono':BootstrapIcons.check2_square,
      'nombre':'Reservas o compras',
      'url':'reservas_compras',
    },
  ];
  List rutas = [
    {
      'url':'inicio/',
      'vista': InicioPage()
    },
    {
      'url':'administrar_negocio/',
      'vista': SedeListPage()
    },
    {
      'url':'documentacion/',
      'vista': null
    },
    {
      'url':'usuarios_permisos/',
      'vista': null
    },
    {
      'url':'reservas_compras/',
      'vista': null
    },
    {
      'url': 'administrar_negocio/sede/',
      'vista': TabsSedePage()
    },
  ];

  navegarVista(int index){
    Get.offAllNamed('/dashboard/${vistas[index]['url']}');
  }
  navegarVistaStr(str){
    Get.offAllNamed('/dashboard/$str');
  }
}