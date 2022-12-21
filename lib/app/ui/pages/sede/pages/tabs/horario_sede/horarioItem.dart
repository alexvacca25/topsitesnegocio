
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/colores.dart';
import '../../../../../widgets/boton.dart';
import '../../../../../widgets/input.dart';
import '../../../../../widgets/modal.dart';
import '../../../../../widgets/row_column.dart';
import '../../../../../widgets/snackbar.dart';
import '../../controller/agregar_editar_sede_controller.dart';

class ItemHorario extends StatelessWidget {

  AgregarEditarSedeController agregarEditarSedeController = Get.find();

  final int index;

  ItemHorario({
    super.key, 
    required this.screen, 
    required this.index,
  });

  final ResponsiveScreen screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colores.crema,
        borderRadius: BorderRadius.circular(5)
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Dia de la semana'),
                  SizedBox(height: 10,),
                  Wrap(
                    spacing: 6.0, runSpacing: 6.0,
                    children: [
                      ChoiceChip(
                        padding: const EdgeInsets.all(5),
                        label: Text('Lunes'),
                        selected: agregarEditarSedeController.horario.value.horarioAtencion![index].lunes,
                        onSelected: (bool){
                          agregarEditarSedeController.horario.value.horarioAtencion![index].lunes = !agregarEditarSedeController.horario.value.horarioAtencion![index].lunes;
                          agregarEditarSedeController.horario.refresh();
                        },
                        selectedColor: agregarEditarSedeController.horario.value.horarioAtencion![index].lunes ? Colores.verde : Colores.grisClaro,
                      ),
                      ChoiceChip(
                        padding: const EdgeInsets.all(5),
                        label: Text('Martes'),
                        selected: agregarEditarSedeController.horario.value.horarioAtencion![index].martes,
                        onSelected: (bool){
                          agregarEditarSedeController.horario.value.horarioAtencion![index].martes = !agregarEditarSedeController.horario.value.horarioAtencion![index].martes;
                          agregarEditarSedeController.horario.refresh();
                        },
                        selectedColor: agregarEditarSedeController.horario.value.horarioAtencion![index].martes ? Colores.verde : Colores.grisClaro,
                      ),
                      ChoiceChip(
                        padding: const EdgeInsets.all(5),
                        label: Text('Miercoles'),
                        selected: agregarEditarSedeController.horario.value.horarioAtencion![index].miercoles,
                        onSelected: (bool){
                          agregarEditarSedeController.horario.value.horarioAtencion![index].miercoles = !agregarEditarSedeController.horario.value.horarioAtencion![index].miercoles;
                          agregarEditarSedeController.horario.refresh();
                        },
                        selectedColor: agregarEditarSedeController.horario.value.horarioAtencion![index].miercoles ? Colores.verde : Colores.grisClaro,
                      ),
                      ChoiceChip(
                        padding: const EdgeInsets.all(5),
                        label: Text('Jueves'),
                        selected: agregarEditarSedeController.horario.value.horarioAtencion![index].jueves,
                        onSelected: (bool){
                          agregarEditarSedeController.horario.value.horarioAtencion![index].jueves = !agregarEditarSedeController.horario.value.horarioAtencion![index].jueves;
                          agregarEditarSedeController.horario.refresh();
                        },
                        selectedColor: agregarEditarSedeController.horario.value.horarioAtencion![index].jueves ? Colores.verde : Colores.grisClaro,
                      ),
                      ChoiceChip(
                        padding: const EdgeInsets.all(5),
                        label: Text('Viernes'),
                        selected: agregarEditarSedeController.horario.value.horarioAtencion![index].viernes,
                        onSelected: (bool){
                          agregarEditarSedeController.horario.value.horarioAtencion![index].viernes = !agregarEditarSedeController.horario.value.horarioAtencion![index].viernes;
                          agregarEditarSedeController.horario.refresh();
                        },
                        selectedColor: agregarEditarSedeController.horario.value.horarioAtencion![index].viernes ? Colores.verde : Colores.grisClaro,
                      ),
                      ChoiceChip(
                        padding: const EdgeInsets.all(5),
                        label: Text('Sabado'),
                        selected: agregarEditarSedeController.horario.value.horarioAtencion![index].sabado,
                        onSelected: (bool){
                          agregarEditarSedeController.horario.value.horarioAtencion![index].sabado = !agregarEditarSedeController.horario.value.horarioAtencion![index].sabado;
                          agregarEditarSedeController.horario.refresh();
                        },
                        selectedColor: agregarEditarSedeController.horario.value.horarioAtencion![index].sabado ? Colores.verde : Colores.grisClaro,
                      ),
                      ChoiceChip(
                        padding: const EdgeInsets.all(5),
                        label: Text('Domingo'),
                        selected: agregarEditarSedeController.horario.value.horarioAtencion![index].domingo,
                        onSelected: (bool){
                          agregarEditarSedeController.horario.value.horarioAtencion![index].domingo = !agregarEditarSedeController.horario.value.horarioAtencion![index].domingo;
                          agregarEditarSedeController.horario.refresh();
                        },
                        selectedColor: agregarEditarSedeController.horario.value.horarioAtencion![index].domingo ? Colores.verde : Colores.grisClaro,
                      ),
                    ],
                  ),
                ],
              ),
              RowColumnResponsive(
                condicion: screen.isDesktop, 
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Inputs(
                      titulo: 'Cantidad máx de personas',
                      controller: TextInputController().init(agregarEditarSedeController.horario.value.horarioAtencion![index].cantidadMaxPersonas),
                      onChanged: (str){
                        try {
                          agregarEditarSedeController.horario.value.horarioAtencion![index].cantidadMaxPersonas = int.parse(str!);
                        } catch (e) {
                          
                        }
                      },
                      tipoTeclado: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hora inicio:'),
                        Row(
                          children: [
                            Text( agregarEditarSedeController.horario.value.horarioAtencion![index].horaInicio == null ? '12:00 A.M':
                          agregarEditarSedeController.horario.value.horarioAtencion![index].horaInicio.format(context).toString()),
                          SizedBox(width: 10,),
                            Boton(
                              child: Icon(BootstrapIcons.clock),
                              color: Colores.verde,
                              accion: (){
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Colores.rosa,
                                          onSurface: Colores.rosa,
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                ).then((value) {
                                  try {
                                    agregarEditarSedeController.horario.value.horarioAtencion![index].horaInicio = value!;
                                    agregarEditarSedeController.horario.refresh();
                                  } catch (e) {
                                    
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hora fin:'),
                        Row(
                          children: [
                            Text( agregarEditarSedeController.horario.value.horarioAtencion![index].horaFin == null ? '12:00 A.M':
                              agregarEditarSedeController.horario.value.horarioAtencion![index].horaFin.format(context).toString()),
                              SizedBox(width: 10,),
                            Boton(
                              child: Icon(BootstrapIcons.clock),
                              color: Colores.verde,
                              accion: (){
                                showTimePicker(
                                  context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Colores.rosa,
                                          onSurface: Colores.rosa,
                                        ),
                                      ),
                                      child: child!,
                                      );
                                    },
                                ).then((value) {
                                  agregarEditarSedeController.horario.value.horarioAtencion![index].horaFin = value!;
                                  agregarEditarSedeController.horario.refresh();
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  

                ]
              ),
            ],
          ),
          Boton(
            color: Colores.rojo,
            child: Icon(BootstrapIcons.trash, color: Colores.blanco,),
            accion: (){
              Modal.porDefecto(
                context, 
                titulo: 'Eliminar',
                child: const Text('¿Desea eliminar este horario?'),
                onAceptar: (){
                  agregarEditarSedeController.horario.value.horarioAtencion!.removeAt(index);
                  agregarEditarSedeController.horario.refresh();
                  Get.back();
                  MensajeInferior.porDefecto(titulo:'Borrado', mensaje: 'se elimino correctamente');
                }
              );
            },
          ),
        ],
      ),
    );
  }
}