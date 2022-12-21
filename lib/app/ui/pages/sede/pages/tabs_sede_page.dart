
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colores.dart';
import 'controller/agregar_editar_sede_controller.dart';
import 'tabs/combo_plan_sede/combo_plan_list_page.dart';
import 'tabs/evento_sede/evento_page.dart';
import 'tabs/horario_sede/horarios_page.dart';
import 'tabs/imagenes_sede/imagenes.dart';
import 'tabs/informacion_general_sede/informacion_general.dart';


class TabsSedePage extends GetView {

  AgregarEditarSedeController agregarEditarSedeController = Get.put(AgregarEditarSedeController());

  @override
  Widget build(BuildContext context) {
    agregarEditarSedeController.cargarDatosSede();
    return Obx(
      (){
        return agregarEditarSedeController.buscando.value ?
        const Scaffold(
          body: Center(
            child: CircularProgressIndicator(color: Colores.rosa,)
          )
        ):
        TabsPage();
      }
    );
  }
}
class TabsPage extends GetView {

  AgregarEditarSedeController agregarEditarSedeController = Get.find();

  final _tabs = const <Tab>[
    Tab(
      icon: Text(
        'Información general',
        overflow: TextOverflow.ellipsis,
      )
    ),
    Tab(
        icon: Text(
      'Imágenes del negocio',
      overflow: TextOverflow.ellipsis,
    )),
    Tab(
        icon: Text(
      'Horarios de atención',
      overflow: TextOverflow.ellipsis,
    )),
    Tab(
        icon: Text(
      'Combos y planes',
      overflow: TextOverflow.ellipsis,
    )),
    Tab(
        icon: Text(
      'Eventos',
      overflow: TextOverflow.ellipsis,
    )),
    Tab(
        icon: Text(
      'Tickets',
      overflow: TextOverflow.ellipsis,
    )),
    Tab(
        icon: Text(
      'Rentas',
      overflow: TextOverflow.ellipsis,
    )),
    Tab(
        icon: Text(
      'Términos y condiciones',
      overflow: TextOverflow.ellipsis,
    )),
    Tab(
        icon: Text(
      'Pagos / Cobros',
      overflow: TextOverflow.ellipsis,
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed('/dashboard/administrar_negocio');
            },
            icon: Icon(BootstrapIcons.arrow_left_short),
          ),
          backgroundColor: Colores.azulMedio,
          title: Row(
            children: [
              Text('Lista de negocios/'),
              Text(agregarEditarSedeController.sede == null ? 'Agregar' : agregarEditarSedeController.sede!.nombre!),
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: _tabs,
            indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
              width: 3,
              color: Colores.blanco,
            )),
          ),
        ),
        body: TabBarView(
          children: [
            InformacionGeneralPage(),
            ImagenesPage(),
            HorariosPage(),
            ComboPlanListPage(),
            EventoListPage(),
            TicketsPage(),
            RentaPage(),
            TerminosCondicionesPage(),
            PagosCobrosPage(),
          ],
        ),
      ),
    );
  }
}


class TicketsPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Text('tickets')));
  }
}


class RentaPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Text('Renta')));
  }
}

class TerminosCondicionesPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Text('Terminos')));
  }
}

class PagosCobrosPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
        ],
      )
    );
  }
}
