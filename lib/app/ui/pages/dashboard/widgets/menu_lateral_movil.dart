
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/ui/widgets/titulo.dart';

import '../../../theme/colores.dart';
import '../controller/dashboard_controller.dart';

class MenuLateralMovil extends StatelessWidget {
  const MenuLateralMovil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_){
        return Stack(
          children: [
            Container(
              width: 300,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                color: Colores.azulOscuro,
              ),
              height: Get.height,
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://i.picsum.photos/id/177/2515/1830.jpg?hmac=G8-2Q3-YPB2TreOK-4ofcmS-z5F6chIA0GHYAe5yzDY'),
                                fit: BoxFit.cover
                              ),
                              color: Colores.blanco,
                            ),
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Container(
                                  color: Colores.azul,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Text('Nombre Negocio', style: TextStyle(color: Colores.blanco),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(
                        _.vistas.length, 
                        (index) => ListTile(
                          selected: _.seleccionado == index,
                          selectedColor: Colores.verde,
                          textColor: Colores.blanco,
                          iconColor: Colores.blanco,
                          leading: Icon(_.vistas[index]['icono']),
                          title: Text(_.vistas[index]['nombre']),
                          onTap: (){
                            _.navegarVista(index);
                          },
                        )
                      )
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              // child: TituloWidget()
              child: Image.asset('assets/02.png',height: 40,)
            ),
          ],
        );
      }
    );
  }
}