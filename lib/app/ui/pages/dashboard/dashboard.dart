import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/ui/theme/imagenes.dart';

import '../../../routes/app_pages.dart';
import '../../theme/colores.dart';
import '../../widgets/error_pantalla.dart';
import 'controller/dashboard_controller.dart';
import 'widgets/menu_lateral_movil.dart';

class DashboardPage extends GetView<DashboardController> {

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveInicio(context: context,);
  }
}

// ignore: must_be_immutable
class ResponsiveInicio extends GetResponsiveView {

  ResponsiveInicio({super.key,this.context, });
  final context;

  List opciones = [
    {'titulo':'Perfil','icono':BootstrapIcons.person, 'value': 1},
    {'titulo':'Opciones','icono':BootstrapIcons.sliders, 'value': 2},
    {'titulo':'Cerrar sesion','icono':BootstrapIcons.box_arrow_left, 'value': 3},
  ];
  
  @override
  Widget builder() {
    return GetBuilder<DashboardController>(
      builder: (_){
        if(screen.isWatch){
          return const Scaffold(body: ErrorPantalla());
        }
        if(Get.height < 400){
          return const Scaffold(body: ErrorPantalla());
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colores.crema,
            title: Image.asset(Imagenes.logo1,height: 40,),
            centerTitle: true,
            actions: popUpMenu,
            iconTheme: const IconThemeData(color: Colores.negro),
          ),
          drawer: const MenuLateralMovil(),
          body: Row(
            children: [
              screen.isPhone ? Container() : Container(
                width: 50,
                height: Get.height,
                color: Colores.azulOscuro,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          _.vistas.length, 
                          (index) => Padding(
                            padding: const EdgeInsets.only(top:20, bottom: 20, left: 5),
                            child: IconButton(
                              onPressed: (){
                                _.navegarVistaStr(_.vistas[index]['url']);},
                                icon: Icon(_.vistas[index]['icono'], 
                                color: _.seleccionado == index ? Colores.verde : Colores.blanco,)
                            ),
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Image.asset(Imagenes.logo7, width: 30,)
                    )
                  ],
                )
              ),
              Expanded(child: Obx(()=>Center(child: _.page.value))),
            ],
          )
        );
      }
    );
  }
  
  get popUpMenu => [
    PopupMenuButton(
      tooltip: 'Opciones',
      initialValue: null,
      onSelected: (item) {
        if(item==3){
          Get.offAllNamed(Routes.LOGIN);
        }
      },
      itemBuilder: (
        BuildContext context) => opciones.map(
          (e) => PopupMenuItem(
            value: e['value'], 
            child: ListTile(title: Text(e['titulo']), leading: Icon(e['icono'])
          ),
        )
      ).toList(),
      child: const CircleAvatar(
        backgroundColor: Colores.azulOscuro,
        backgroundImage: NetworkImage('https://i.picsum.photos/id/177/2515/1830.jpg?hmac=G8-2Q3-YPB2TreOK-4ofcmS-z5F6chIA0GHYAe5yzDY'),
      ),
    ),
    const SizedBox(width: 10,)
  ];
}

