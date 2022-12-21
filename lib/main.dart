import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app/app.dart';
import 'app/data/repository/negocio_repository.dart';
import 'app/data/repository/sede_repository.dart';
import 'app/data/repository/tipo_servicio_repository.dart';







Future<void> main() async{
  Get.put(TipoServicioRepository());
  Get.put(NegocioRepository());
  Get.put(SedeRepository());
  setPathUrlStrategy();
  runApp(const App());
}








