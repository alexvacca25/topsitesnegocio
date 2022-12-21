
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/data/models/sede/sede.dart';
import 'package:topsitesnegocio/app/ui/theme/colores.dart';
import 'package:topsitesnegocio/app/ui/widgets/boton.dart';
import 'package:topsitesnegocio/app/ui/widgets/row_column.dart';

import '../../../../../../data/models/sede/horario_sede.dart';
import '../../controller/agregar_editar_sede_controller.dart';
import 'excepcionItem.dart';
import 'horarioItem.dart';

class HorariosPage extends GetResponsiveView {
  
  AgregarEditarSedeController agregarEditarSedeController = Get.find();

  @override
  Widget builder() {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          agregarEditarSedeController.guardar();
        }, 
        label: const Text('Guardar'),
        icon: const Icon(Icons.save),
        backgroundColor: Colores.verde,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Obx(
            ()=>RowColumnResponsive(
              condicion: screen.isDesktop,
              children: [
                Text('Permitir reservar cada: '),
                Row(
                  children: [
                    Radio(
                      value: '15',
                      groupValue: agregarEditarSedeController.horario.value.permitirReservarCada.toString(),
                      onChanged: (value) {
                        agregarEditarSedeController.horario.value.permitirReservarCada = int.parse(value.toString());
                        print(value.toString());
                        agregarEditarSedeController.horario.refresh();
                      },
                    ),
                    Text('15 minutos'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: '30',
                      groupValue: agregarEditarSedeController.horario.value.permitirReservarCada.toString(),
                      onChanged: (value) {
                        agregarEditarSedeController.horario.value.permitirReservarCada = int.parse(value.toString());
                        agregarEditarSedeController.horario.refresh();
                      },
                    ),
                    Text('30 minutos'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: '60',
                      groupValue: agregarEditarSedeController.horario.value.permitirReservarCada.toString(),
                      onChanged: (value) {
                        agregarEditarSedeController.horario.value.permitirReservarCada = int.parse(value.toString());
                        agregarEditarSedeController.horario.refresh();
                      },
                    ),
                    Text('60 minutos'),
                  ],
                ),
              ],
            )
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Horarios'),
              Boton(
                accion: (){
                  agregarEditarSedeController.horario.value.horarioAtencion!.add(HorarioAtencion());
                  agregarEditarSedeController.horario.refresh();
                },
                child: const Text('Agregar horario', style: TextStyle(color: Colores.blanco),),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Obx((){
            agregarEditarSedeController.horario.value;
            return Column(
              children: List.generate(
                agregarEditarSedeController.horario.value.horarioAtencion!.length, 
                (index) => ItemHorario(screen: screen, index: index,)
              ),
            );
          }),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Excepciones'),
              Boton(
                accion: (){
                  agregarEditarSedeController.horario.value.excepciones!.add(Excepcion(exepcionPor: 'dia'));
                  agregarEditarSedeController.horario.refresh();
                },
                child: Text('Agregar Excepción', style: TextStyle(color: Colores.blanco),),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Obx((){
            agregarEditarSedeController.horario.value;
            return Column(
              children: List.generate(
                agregarEditarSedeController.horario.value.excepciones!.length, 
                (index) => ItemExcepcion(screen: screen, index: index,)
              ),
            );
          }),
          SizedBox(height: 100,),
        ],
      )
    );
  }
}
