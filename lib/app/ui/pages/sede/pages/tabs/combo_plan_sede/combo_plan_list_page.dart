import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/data/models/sede/combo_plan.dart';
import 'package:topsitesnegocio/app/ui/widgets/modal.dart';
import 'package:topsitesnegocio/app/ui/widgets/switch.dart';

import '../../../../../theme/colores.dart';
import '../../controller/agregar_editar_sede_controller.dart';
import 'form_combo_plan.dart';

class ComboPlanListPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Responsive(context);
  }
}

class Responsive extends GetResponsiveView {

  final context;

  AgregarEditarSedeController agregarEditarSedeController = Get.find();

  Responsive(this.context);

  @override
  Widget builder() {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()async{
          await Modal.child(
            context,
            barrierDismissible: false,
            child: Container(child: FormComboPlanPage(comboPlan: ComboPlan(estado: false),)),
          ).then((value){
            if(value!=null){
              agregarEditarSedeController.combosPlanes.value.add(value)    ;
              agregarEditarSedeController.combosPlanes.refresh();
            }
          }
          );
        }, 
        label: const Text('Nuevo combo / plan'),
        icon: const Icon(BootstrapIcons.plus),
        backgroundColor: Colores.negro,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Obx(
           () => GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: screen.isDesktop ? 5 : screen.isTablet ? 3 : 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(
                agregarEditarSedeController.combosPlanes.value.length,
                  (index) => itemComboPlan(agregarEditarSedeController.combosPlanes.value[index], index)
                ),
            )
          ),
          const SizedBox(height: 100,)
        ],
      )
    );
  }

  GestureDetector itemComboPlan(ComboPlan comboPlan, index) {
    return GestureDetector(
                onTap: (){
                  Modal.child(
                    context,
                    barrierDismissible: false,
                    child: FormComboPlanPage(comboPlan: comboPlan,)
                  ).then((value){
                    if(value!=null){
                      agregarEditarSedeController.combosPlanes.value[index] = value;
                      agregarEditarSedeController.combosPlanes.refresh();
                    }
                  });
                },
              child: Container(
                decoration: BoxDecoration(
                  color: Colores.gris,
                  borderRadius: BorderRadius.circular(5)
                ),
              padding: EdgeInsets.all(10),
                // color: Colores.negro.withOpacity(0.5),
                child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            crossAxisAlignment:
                                CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:40),
                                    child: CircleAvatar(backgroundColor: Colores.verde,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:20),
                                    child: CircleAvatar(backgroundColor: Colores.rojo,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:0),
                                    child: CircleAvatar(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                '${comboPlan.nombre}',
                                style:const  TextStyle(color: Colores.blanco),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                '${comboPlan.descripcion}',
                                style: const TextStyle(color: Colores.blanco),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SwitchPersonalizado(
                                estado: comboPlan.estado!,
                                texto: comboPlan.estado! ? 'Publicado' : 'Inactivo',
                                onChanged: (value){
                                  agregarEditarSedeController.combosPlanes.value[index].estado = value;
                                  agregarEditarSedeController.combosPlanes.refresh();
                                }
                              )
                            ],
                          ),
                        ),
                      )),
                    ]),
              ),
        );
  }
}
