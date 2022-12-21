
import 'package:get/get.dart';

import '../models/sede/sede.dart';

class SedeRepository extends GetxController {

  final sedes = <Sede>[
    Sede(
      id: 1,
      fechaRegistro: '2022/12/04',
      estado: true,
      nombre: 'sede 1',
    ),
  ].obs;

  getAll(){
    return sedes.value;
  }
  Future getId(id)async{
    print('object: $id');
    for (Sede item in sedes.value) {
      print(item.nombre);
      if(item.id.toString()==id.toString()){
        print(item.nombre);
        return item;
      }
    }
    return null;
  }
  delete(id){
    for (var i = 0; i < sedes.value.length; i++) {
      if(sedes.value[i].id == id){
        sedes.value.remove(sedes.value[i]);
        sedes.refresh();
      }
    }
    return null;
  }
  edit(Sede obj){
    for (var i = 0; i < sedes.value.length; i++) {
      if(sedes.value[i].id == obj.id){
        sedes.value[i] = obj;
        sedes.refresh();
        return;
      }
    }
  }
  add(Sede obj){
    obj.id = '${int.parse('${sedes.value[sedes.value.length - 1].id}') + 1}';
    sedes.add(obj);
    sedes.refresh();
  }

}