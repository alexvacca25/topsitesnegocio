

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:topsitesnegocio/app/ui/theme/colores.dart';
import 'package:topsitesnegocio/app/ui/widgets/boton.dart';
import 'package:topsitesnegocio/app/ui/widgets/date_picker.dart';
import 'package:topsitesnegocio/app/ui/widgets/modal.dart';
import 'package:topsitesnegocio/app/ui/widgets/row_column.dart';
import 'package:topsitesnegocio/app/ui/widgets/snackbar.dart';

import '../../../../../widgets/time_picker.dart';
import '../../controller/agregar_editar_sede_controller.dart';

class ItemExcepcion extends StatelessWidget {

  AgregarEditarSedeController agregarEditarSedeController = Get.find();

  final int index;

  ItemExcepcion({
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
          RowColumnResponsive(
            condicion: screen.isDesktop, 
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Excepcion por'),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: 'dia',
                              groupValue: agregarEditarSedeController.horario.value.excepciones![index].exepcionPor,
                              onChanged: (value) {
                                agregarEditarSedeController.horario.value.excepciones![index].exepcionPor = value;
                                agregarEditarSedeController.horario.refresh();
                              },
                            ),
                            Text('Dia')
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: 'fecha',
                              groupValue: agregarEditarSedeController.horario.value.excepciones![index].exepcionPor,
                              onChanged: (value) {
                                agregarEditarSedeController.horario.value.excepciones![index].exepcionPor = value;
                                agregarEditarSedeController.horario.refresh();
                              },
                            ),
                            Text('Fecha')
                          ],
                        ),
                      ),

                    ],
                  )
                ],
              ),
              agregarEditarSedeController.horario.value.excepciones![index].exepcionPor == 'dia' ? ExcepcionDia(agregarEditarSedeController: agregarEditarSedeController, index: index)
              :
              Column(
                children: [
                  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fecha inicio:'),
                    Row(
                      children: [
                        Text(agregarEditarSedeController.horario.value.excepciones![index].fechaInicio == null ? DateFormat('yyyy-MM-dd').format(DateTime.now()):
                          DateFormat('yyyy-MM-dd').format(agregarEditarSedeController.horario.value.excepciones![index].fechaInicio)),
                        SizedBox(width: 10,),
                        Boton(
                          child: Icon(BootstrapIcons.calendar2),
                          color: Colores.verde,
                          accion: (){
                            DatePicker().porDefecto(context).then(
                              (value) {
                                agregarEditarSedeController.horario.value.excepciones![index].fechaInicio = value;
                                agregarEditarSedeController.horario.refresh();
                              }
                            );
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
                    Text('Fecha fin:'),
                    Row(
                      children: [
                        Text(agregarEditarSedeController.horario.value.excepciones![index].fechaFin == null ? DateFormat('yyyy-MM-dd').format(DateTime.now()):
                          DateFormat('yyyy-MM-dd').format(agregarEditarSedeController.horario.value.excepciones![index].fechaFin)),
                          SizedBox(width: 10,),
                        Boton(
                          child: Icon(BootstrapIcons.calendar2),
                          color: Colores.verde,
                          accion: (){
                            DatePicker().porDefecto(context).then(
                              (value) {
                                if(value!=null){
                                  agregarEditarSedeController.horario.value.excepciones![index].fechaFin = value;
                                }
                              }
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Hora inicio:'),
                        Row(
                          children: [
                            Text(agregarEditarSedeController.horario.value.excepciones![index].horaInicio == null ? '12:00 A.M':
                          agregarEditarSedeController.horario.value.excepciones![index].horaInicio.format(context).toString()),
                          SizedBox(width: 10,),
                            Boton(
                              child: Icon(BootstrapIcons.clock),
                              color: Colores.verde,
                              accion: (){
                                TimePicker().porDefecto(context).then((value) {
                                  if(value!=null){
                                    agregarEditarSedeController.horario.value.excepciones![index].horaInicio = value;
                                    agregarEditarSedeController.horario.refresh();
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
                        const Text('Hora fin:'),
                        Row(
                          children: [
                            Text(agregarEditarSedeController.horario.value.excepciones![index].horaFin == null ? '12:00 A.M':
                              agregarEditarSedeController.horario.value.excepciones![index].horaFin.format(context).toString()),
                            SizedBox(width: 10,),
                            Boton(
                              child: Icon(BootstrapIcons.clock),
                              color: Colores.verde,
                              accion: (){
                                TimePicker().porDefecto(context).then((value) {
                                  if(value!=null){
                                    agregarEditarSedeController.horario.value.excepciones![index].horaFin = value;
                                    agregarEditarSedeController.horario.refresh();
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]
          ),
          Boton(
            color: Colores.rojo,
            child: Icon(BootstrapIcons.trash, color: Colores.blanco,),
            accion: (){
              Modal.porDefecto(
                context, 
                titulo: 'Eliminar',
                child: const Text('¿Desea eliminar esta excepción?'),
                onAceptar: (){
                  agregarEditarSedeController.horario.value.excepciones!.removeAt(index);
                  agregarEditarSedeController.horario.refresh();
                  Get.back();
                  MensajeInferior.porDefecto(titulo:'Borrado', mensaje: 'se eliminó correctamente');
                }
              );
            },
          ),
        ],
      ),
    );
  }
}

class ExcepcionDia extends StatelessWidget {
  const ExcepcionDia({
    Key? key,
    required this.agregarEditarSedeController,
    required this.index,
  }) : super(key: key);

  final AgregarEditarSedeController agregarEditarSedeController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dia de la semana'),
        SizedBox(height: 10,),
        Wrap(
          spacing: 6.0, runSpacing: 6.0,
          children: [
            ChoiceChip(
              padding: const EdgeInsets.all(5),
              label: Text('Lunes'),
              selected: agregarEditarSedeController.horario.value.excepciones![index].lunes,
              onSelected: (bool){
                agregarEditarSedeController.horario.value.excepciones![index].lunes = !agregarEditarSedeController.horario.value.excepciones![index].lunes;
                agregarEditarSedeController.horario.refresh();
              },
              selectedColor: agregarEditarSedeController.horario.value.excepciones![index].lunes ? Colores.verde : Colores.grisClaro,
            ),
            ChoiceChip(
              padding: const EdgeInsets.all(5),
              label: Text('Martes'),
              selected: agregarEditarSedeController.horario.value.excepciones![index].martes,
              onSelected: (bool){
                agregarEditarSedeController.horario.value.excepciones![index].martes = !agregarEditarSedeController.horario.value.excepciones![index].martes;
                agregarEditarSedeController.horario.refresh();
              },
              selectedColor: agregarEditarSedeController.horario.value.excepciones![index].martes ? Colores.verde : Colores.grisClaro,
            ),
            ChoiceChip(
              padding: const EdgeInsets.all(5),
              label: Text('Miercoles'),
              selected: agregarEditarSedeController.horario.value.excepciones![index].miercoles,
              onSelected: (bool){
                agregarEditarSedeController.horario.value.excepciones![index].miercoles = !agregarEditarSedeController.horario.value.excepciones![index].miercoles;
                agregarEditarSedeController.horario.refresh();
              },
              selectedColor: agregarEditarSedeController.horario.value.excepciones![index].miercoles ? Colores.verde : Colores.grisClaro,
            ),
            ChoiceChip(
              padding: const EdgeInsets.all(5),
              label: Text('Jueves'),
              selected: agregarEditarSedeController.horario.value.excepciones![index].jueves,
              onSelected: (bool){
                agregarEditarSedeController.horario.value.excepciones![index].jueves = !agregarEditarSedeController.horario.value.excepciones![index].jueves;
                agregarEditarSedeController.horario.refresh();
              },
              selectedColor: agregarEditarSedeController.horario.value.excepciones![index].jueves ? Colores.verde : Colores.grisClaro,
            ),
            ChoiceChip(
              padding: const EdgeInsets.all(5),
              label: Text('Viernes'),
              selected: agregarEditarSedeController.horario.value.excepciones![index].viernes,
              onSelected: (bool){
                agregarEditarSedeController.horario.value.excepciones![index].viernes = !agregarEditarSedeController.horario.value.excepciones![index].viernes;
                agregarEditarSedeController.horario.refresh();
              },
              selectedColor: agregarEditarSedeController.horario.value.excepciones![index].viernes ? Colores.verde : Colores.grisClaro,
            ),
            ChoiceChip(
              padding: const EdgeInsets.all(5),
              label: Text('Sabado'),
              selected: agregarEditarSedeController.horario.value.excepciones![index].sabado,
              onSelected: (bool){
                agregarEditarSedeController.horario.value.excepciones![index].sabado = !agregarEditarSedeController.horario.value.excepciones![index].sabado;
                agregarEditarSedeController.horario.refresh();
              },
              selectedColor: agregarEditarSedeController.horario.value.excepciones![index].sabado ? Colores.verde : Colores.grisClaro,
            ),
            ChoiceChip(
              padding: const EdgeInsets.all(5),
              label: Text('Domingo'),
              selected: agregarEditarSedeController.horario.value.excepciones![index].domingo,
              onSelected: (bool){
                agregarEditarSedeController.horario.value.excepciones![index].domingo = !agregarEditarSedeController.horario.value.excepciones![index].domingo;
                agregarEditarSedeController.horario.refresh();
              },
              selectedColor: agregarEditarSedeController.horario.value.excepciones![index].domingo ? Colores.verde : Colores.grisClaro,
            ),
          ],
        ),
      ],
    );
  }
}