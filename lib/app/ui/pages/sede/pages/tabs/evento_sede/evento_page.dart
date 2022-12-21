
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/ui/pages/sede/pages/tabs/evento_sede/form_evento.dart';
import 'package:topsitesnegocio/app/ui/widgets/switch.dart';

import '../../../../../../data/models/sede/combo_plan.dart';
import '../../../../../theme/colores.dart';
import '../../../../../widgets/modal.dart';

class EventoListPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Responsive(context: context,);
  }
}

class Responsive extends GetResponsiveView{
  final BuildContext context;
  Responsive({
    required this.context,
  });

  @override
  Widget builder() {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          
        }, 
        label: const Text('Nuevo evento'),
        icon: const Icon(BootstrapIcons.plus),
        backgroundColor: Colores.negro,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
      ),
      body:ListView(
        padding: const EdgeInsets.all(10),
        children: [
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: screen.isDesktop ? 5 : screen.isTablet ? 3 : 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(
              20,
                (index) => itemComboPlan(ComboPlan(), index)
              ),
          ),
          // Column(
          //   children: [
          //     Wrap(
          //       children: List.generate(20, (index) => itemComboPlan(ComboPlan(nombre: 'asdx'), index)),
          //     )
          //   ],
          // ),
          const SizedBox(height: 100)
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
                    child: EventoPage()
                  ).then((value){
                    if(value!=null){
                      // agregarEditarSedeController.combosPlanes.value[index] = value;
                      // agregarEditarSedeController.combosPlanes.refresh();
                    }
                  });
                },
              child: Container(
                decoration: BoxDecoration(
                  color: Colores.gris,
                  borderRadius: BorderRadius.circular(5)
                ),
              padding: EdgeInsets.all(10),
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
                                '${comboPlan.nombre ?? ''}',
                                style:const  TextStyle(color: Colores.blanco),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                '${comboPlan.descripcion ?? ''}',
                                style: const TextStyle(color: Colores.blanco),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SwitchPersonalizado(
                                estado: comboPlan.estado ?? false,
                                texto: comboPlan.estado ?? false ? 'Publicado' : 'Inactivo',
                                onChanged: (value){
                                  // agregarEditarSedeController.combosPlanes.value[index].estado = value;
                                  // agregarEditarSedeController.combosPlanes.refresh();
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