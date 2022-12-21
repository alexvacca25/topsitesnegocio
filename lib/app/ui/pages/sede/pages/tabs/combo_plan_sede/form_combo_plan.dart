import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:topsitesnegocio/app/ui/theme/colores.dart';
import 'package:topsitesnegocio/app/ui/widgets/boton.dart';
import 'package:topsitesnegocio/app/ui/widgets/input.dart';
import 'package:topsitesnegocio/app/ui/widgets/modal.dart';

import '../../../../../../data/models/sede/combo_plan.dart';
import '../../../../../widgets/dropdown.dart';
import '../../../../../widgets/file_picker.dart';
import '../../controller/agregar_editar_sede_controller.dart';

class FormComboPlanPage extends StatelessWidget {
  FormComboPlanPage({super.key, required this.comboPlan});
  final ComboPlan comboPlan;

  @override
  Widget build(BuildContext context) {
    return Responsive(comboPlan: comboPlan,context: context,);
  }
}
class Responsive extends GetResponsiveView {

  final cambia = false.obs;
  final context;
  final ComboPlan comboPlan;

  AgregarEditarSedeController agregarEditarSedeController = Get.find();
  
  Responsive({
    this.context, 
    required this.comboPlan,
  });

  @override
  Widget builder() {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(screen.isDesktop ? 20 : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Combo / plan'),
          backgroundColor: Colores.azul,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: (){
              Modal.porDefecto(
                context, 
                child: const Text('¿Seguro que quieres cerrar?'), 
                onAceptar: (){
                  Get.back();
                  Get.back();
                }
              );
            }, icon: Icon(BootstrapIcons.x))
          ],
        ),
        floatingActionButton: Wrap(
          direction: Axis.horizontal, 
            children: [
              Container(child: Boton(
                accion: ()=>Get.back(),
                child: Text('Cancelar'),color: Colores.gris,)
              ),
              SizedBox(width: 10,),
              Container(child: Boton(
                accion: ()=>Get.back(result: comboPlan),
                child: Text('Guardar'),color: Colores.verde,)),
            ],
        ),
        body: Obx(
          () {
            cambia.value;
            return ListView(
            padding: EdgeInsets.all(20),
            children: [
              Inputs(controller: TextInputController().init(comboPlan.nombre), titulo: 'Nombre',onChanged: (str){comboPlan.nombre = str!;},),
              Inputs(controller: TextInputController().init(comboPlan.descripcion), maxLines: 3, titulo: 'Detalle',onChanged: (str){comboPlan.descripcion = str!;},),
              DropdownPersonalizado(
                items: [
                  DropdownValue(texto: 'Tipo Plan',value: 'tipo')
                ], onChange: (a){}, value: 'tipo'
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Imagenes'),
                  BotonTexto(
                    accion: ()async{
                      FilePickerResult? result = await Files.obtenerImagen();
                      if (result != null) {
                        dynamic foto = MemoryImage(result.files.first.bytes!);
                        comboPlan.agregarImagen(foto);
                        cambia.value = !cambia.value;
                      } 
                    },
                    texto: 'Agregar Imagen',
                    color: Colores.verde,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Wrap(
                children: List.generate(
                  comboPlan.getImagenes.length, 
                  (index) => Container(
                    width: 140,
                    height: 140,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colores.gris,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: comboPlan.getImagenes[index],
                        fit: BoxFit.cover
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Boton(
                          accion: (){
                            comboPlan.imagenes!.removeAt(index);
                            cambia.value = !cambia.value;
                          },
                          color: Colores.rojo,
                          child: Icon(BootstrapIcons.trash, color: Colores.blanco,),
                        ),
                      ],
                    ),
                  )
                ),
              ),
              SizedBox(height: comboPlan.getImagenes.length==0 ? 0 : 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Fecha y hora'),
                  BotonTexto(
                    accion: (){
                      comboPlan.agregarFechaHora(FechaHora(valor: 0));
                      cambia.value = !cambia.value;
                    },
                    texto: 'Agregar fecha y hora',
                    color: Colores.verde,
                  ),
                ],
              ),
              Column(
                children: List.generate(
                  comboPlan.getFechaHora.length,
                  (index) => itemFechaHora(comboPlan.getFechaHora[index], index)
                )
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Detalles'),
                  BotonTexto(
                    accion: (){
                      comboPlan.agregarDetalle(DetalleComboPlan());
                      cambia.value = !cambia.value;
                    },
                    texto: 'Agregar detalle',
                    color: Colores.verde,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Column(
                children: List.generate(
                  comboPlan.getDetalles.length, (index) => Row(
                    children: [
                      Expanded(
                        child: Inputs(
                          controller: TextInputController().init(comboPlan.getDetalles[index].nombre), 
                          titulo: 'Nombre', 
                          onChanged: (str){
                            comboPlan.getDetalles[index].nombre = str!;
                          }
                        )
                      ),
                      SizedBox(width: 10,),
                      Boton(
                        accion: (){
                          comboPlan.detalles!.removeAt(index);
                          cambia.value = !cambia.value;
                        },
                        child: Icon(BootstrapIcons.trash, color: Colores.blanco,),
                        color: Colores.rojo,
                      )
                    ],
                  )
                ),
              ),
              SizedBox(height: comboPlan.getDetalles.length==0 ? 0 : 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Adiciones'),
                  BotonTexto(
                    accion: (){
                      comboPlan.agregarAdicion(Adicion(valor: 0));
                      cambia.value = !cambia.value;
                    },
                    texto: 'Agregar adición',
                    color: Colores.verde,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Column(
                children: List.generate(
                  comboPlan.getAdiciones.length, (index) => Container(
                    decoration: BoxDecoration(
                      color: Colores.crema,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Inputs(
                                controller: TextInputController().init(comboPlan.getAdiciones[index].nombre), 
                                titulo: 'Nombre', 
                                onChanged: (str){
                                  comboPlan.getAdiciones[index].nombre = str!;
                                }
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Inputs(
                                controller: TextInputController().init(comboPlan.getAdiciones[index].cantidadMaxima), 
                                titulo: 'Cantidad máx stock', 
                                onChanged: (str){
                                  comboPlan.getDetalles[index].cantidadMaxima = str!;
                                }
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Inputs(
                                controller: TextInputController().init('${comboPlan.getAdiciones[index].valor}'), 
                                titulo: 'Valor', 
                                onChanged: (str){
                                  comboPlan.getAdiciones[index].valor = str!;
                                }
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              flex: 6,
                              child:  DropdownPersonalizado(items: List.generate(100, (index) => DropdownValue(value: '$index', texto: 'Descuento de $index%')), onChange: (a){}, value: '0'),
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Boton(
                          accion: (){
                            comboPlan.adiciones!.removeAt(index);
                            cambia.value = !cambia.value;
                          },
                          child: Icon(BootstrapIcons.trash, color: Colores.blanco,),
                          color: Colores.rojo,
                        )
                      ],
                    ),
                  )
                ),
              ),
              SizedBox(height: 100,),
            ],
          );
        }
        )
      ),
    );
  }

  Container itemFechaHora(FechaHora fechaHora, index) {
    return Container(
      decoration: BoxDecoration(
        color: Colores.gris.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5)
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Fecha Inicio: 11/01/2022'),
                  SizedBox(width: 10,),
                  Boton(
                    child: Icon(BootstrapIcons.calendar, color: Colores.blanco,),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hora Inicio: 5:00 p.m'),
                  SizedBox(width: 10,),
                  Boton(
                    child: Icon(BootstrapIcons.clock, color: Colores.blanco,),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(flex: 4,child: Inputs(controller: TextInputController().init('${fechaHora.valor}'), titulo: 'Valor',)),
              SizedBox(width: 10,),
              Expanded(flex: 6,child: DropdownPersonalizado(items: List.generate(100, (index) => DropdownValue(value: '$index', texto: 'Descuento de $index%')), onChange: (a){}, value: '0'))
            ],
          ),
          SizedBox(height: 10,),
          Boton(
            accion: (){
              comboPlan.fechaHora!.removeAt(index);
              cambia.value = !cambia.value;
            },
            color: Colores.rojo,
            child: Icon(BootstrapIcons.trash,color: Colores.blanco,),
          )
        ]
      ),
    );
  }
}
