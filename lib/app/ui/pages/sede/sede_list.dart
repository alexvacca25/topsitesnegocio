
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/routes/app_pages.dart';
import 'package:topsitesnegocio/app/ui/pages/sede/controller/sede_controller.dart';
import 'package:topsitesnegocio/app/ui/theme/colores.dart';
import 'package:topsitesnegocio/app/ui/widgets/boton.dart';
import 'package:topsitesnegocio/app/ui/widgets/input.dart';

import '../../../data/models/sede/horario_sede.dart';
import '../../../data/models/sede/sede.dart';
import '../../widgets/modal.dart';


class SedeListPage extends GetView{

  @override
  Widget build(BuildContext context) {
    return Responsive(context: context,);
  }
}

// ignore: must_be_immutable
class Responsive extends GetResponsiveWidget {

  SedeController sedeController = Get.find();
  final context;

  Responsive( {super.key, required this.context,});

  @override
  Widget builder() {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            agregarNuevaSede(context);
          },
          label: const Text('Agregar sede'),
          icon: const Icon(BootstrapIcons.plus),
          backgroundColor: Colores.azulOscuro,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(
              height: 10,
            ),
            Obx(
              () {
                return GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: screen.isDesktop
                      ? 5
                      : screen.isTablet
                          ? 3
                          : 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(
                      sedeController.sedeRepository.sedes.value.length,
                      (index) => Boton(
                            accion: () => Get.offAllNamed(Routes.SEDE,
                            parameters: {'id': sedeController.sedeRepository.sedes.value[index].id.toString()},
                                arguments: sedeController
                                    .sedeRepository.sedes.value[index]),
                            padding: 0,
                            child: Container(
                                decoration: BoxDecoration(
                                  image: sedeController.sedeRepository.sedes.value[index].imagenes == null || sedeController.sedeRepository.sedes.value[index].imagenes!.fotoPrincipal == null ? null : DecorationImage(
                                      image: sedeController.sedeRepository.sedes.value[index].imagenes!.fotoPrincipal,
                                      fit: BoxFit.cover),
                                  color: Colores.crema,
                                ),
                                child: Container(
                                  color: Colores.negro.withOpacity(0.5),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        PopupMenuButton(
                                          padding: EdgeInsets.all(0),
                                          tooltip: 'Opciones',
                                          icon: Icon(
                                            Icons.more_vert,
                                            color: Colores.blanco,
                                          ),
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry>[
                                            PopupMenuItem(
                                              padding: EdgeInsets.all(0),
                                              child: ListTile(
                                                onTap: () {
                                                  Get.back();
                                                  agregarNuevaSede(
                                                      context,
                                                      sede:sedeController
                                                          .sedeRepository
                                                          .sedes
                                                          .value[index]);
                                                },
                                                leading:
                                                    Icon(BootstrapIcons.files),
                                                title: Text('Duplicar'),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              padding: EdgeInsets.all(0),
                                              child: ListTile(
                                                onTap: (){},
                                                leading:
                                                    Icon(BootstrapIcons.flag),
                                                title: Text('Publicar'),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              padding: EdgeInsets.all(0),
                                              child: ListTile(
                                                onTap: (){},
                                                leading:
                                                    Icon(BootstrapIcons.trash),
                                                title: Text('Eliminar'),
                                              ),
                                            ),
                                          ],
                                        ),
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
                                                CircleAvatar(
                                                  radius: 35,
                                                  backgroundImage: sedeController.sedeRepository.sedes.value[index].imagenes == null ||
                                                  sedeController.sedeRepository.sedes.value[index].imagenes!.fotoLogo == null ?
                                                  null : sedeController.sedeRepository.sedes.value[index].imagenes!.fotoLogo,
                                                ),
                                                const SizedBox(height: 10,),
                                                RatingBarIndicator(
                                                  rating: 4.3,
                                                  itemBuilder: (context, index) => const Icon(
                                                  Icons.star,
                                                    color: Colores.amarillo,
                                                    size: 8,
                                                  ),
                                                  itemCount: 5,
                                                  itemSize: 15,
                                                  unratedColor: Colores.amarillo.withOpacity(0.5),
                                                ),
                                                const SizedBox(height: 10,),
                                                Text(
                                                  '${sedeController.sedeRepository.sedes.value[index].nombre}',
                                                  style:const  TextStyle(color: Colores.blanco),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 10,),
                                                Text(
                                                  sedeController.sedeRepository.sedes.value[index].direccion ?? '',
                                                  style: const TextStyle(color: Colores.blanco),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                      ]),
                                )),
                          )
                        ),
                );
              },
            )
          ],
        )));
  }

  agregarNuevaSede(context, { Sede? sede }) {
    TextInputController txtNombreSede = TextInputController();
    final informacionGeneral = true.obs;
    final imagenes = false.obs;
    final horarios = false.obs;
    final combos = false.obs;
    final tickets = false.obs;
    final terminos = false.obs;
    final pagos = false.obs;
    Modal.porDefecto(
      context,
      titulo: sede==null ? 'Agregar' : 'Duplicar',
      barrierDismissible: false,
      onAceptar: () {
        Sede nuevaSede = Sede();

        if(sede==null){
          nuevaSede.nombre = txtNombreSede.controlador.text;
          sedeController.agregarNuevaSede(nuevaSede);
          Get.back();
          return;
        }

        if(txtNombreSede.controlador.text.trim().isEmpty){
          txtNombreSede.error.value = 'debe ingresar el nombre de la sede';
          return;
        }
        if(informacionGeneral.value){
          nuevaSede.telefono = sede.telefono;
          nuevaSede.celular = sede.celular;
          nuevaSede.direccion = sede.direccion;
          nuevaSede.correo = sede.correo;
          nuevaSede.descripcion = sede.descripcion;
        }
        if(imagenes.value){
          nuevaSede.imagenes = sede.imagenes;
        }
        if(horarios.value){
          nuevaSede.horario = sede.horario ?? Horario();
        }
        nuevaSede.nombre = txtNombreSede.controlador.text;
        sedeController.agregarNuevaSede(nuevaSede);
        Get.back();
      },
      onCancelar: () {
        Get.back();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Inputs(titulo: 'Nombre de la sede', controller: txtNombreSede),
          const SizedBox(
            height: 10,
          ),
          sede==null? Container() : const Text('¿Qué información desea duplicar?'),
          const SizedBox(
            height: 10,
          ),
          sede == null ? Container() :  Wrap(spacing: 6.0, runSpacing: 6.0, children: [
            itemDuplicar(informacionGeneral,'Información general'),
            itemDuplicar(imagenes,'Imágenes del negocio'),
            itemDuplicar(horarios,'Horarios de atención'),
            itemDuplicar(combos,'Combos y planes'),
            itemDuplicar(tickets,'Tickets'),
            itemDuplicar(terminos,'Términos y condiciones'),
            itemDuplicar(pagos,'Pagos / Cobros'),
          ])
        ],
      ),
    );
  }

  Obx itemDuplicar(RxBool estado, texto) {
    return Obx(
      () => ChoiceChip(
        padding: const EdgeInsets.all(5),
        label: Text(texto),
        avatar: estado.value ? Icon(BootstrapIcons.check, color: Colores.blanco,) : null,
        labelStyle: TextStyle(
          color: estado.value ? Colores.blanco : Colores.negro
        ),
        elevation: estado.value ? 5 : 0,
        selected: estado.value,
        selectedColor: Colores.verde,
        backgroundColor: Colores.grisClaro,
        onSelected: (val) {
          estado.value = !estado.value;
        },
      )
    );
  }
}
