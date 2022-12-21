import 'package:get/get.dart';
import '../../../../data/models/sede/sede.dart';
import '../../../../data/repository/sede_repository.dart';

class SedeController extends GetxController {

    
  SedeRepository sedeRepository = Get.find();


  @override
  void onInit() {
    super.onInit();
  }

  agregarNuevaSede(Sede sede){
    sedeRepository.add(sede);
  }


}