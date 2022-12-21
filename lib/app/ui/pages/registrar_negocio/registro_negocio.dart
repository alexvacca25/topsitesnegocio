import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/routes/app_pages.dart';
import 'package:topsitesnegocio/app/ui/theme/colores.dart';
import 'package:topsitesnegocio/app/ui/widgets/boton.dart';
import 'package:topsitesnegocio/app/ui/widgets/dropdown.dart';
import 'package:topsitesnegocio/app/ui/widgets/input.dart';
import 'package:topsitesnegocio/app/ui/widgets/row_column.dart';

import '../../theme/imagenes.dart';
import '../../widgets/error_pantalla.dart';
import '../../../controllers/negocio_registro_controller.dart';
import '../../widgets/titulo.dart';

class RegistroNegocioPage extends GetView {
  const RegistroNegocioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment
                    .topLeft, // 10% of the width, so there are ten blinds.
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colores.rosa,
                  Colores.azul,
                ],
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
              image: DecorationImage(
                  image: AssetImage(
                    Imagenes.fondoLogin,
                  ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  opacity: 0.1),
            ),
        child: Responsive())
    );
  }
}
// ignore: must_be_immutable
class Responsive extends GetResponsiveView {
  Responsive({super.key});

  RegistroNegocioController negocioController = Get.find();

  @override
  Widget builder() {
    if (screen.isWatch || Get.height < 400) {
      return const Scaffold(body: ErrorPantalla());
    }
    return ListView(
      padding: EdgeInsets.all(!screen.isDesktop ? 0: 10),
      children: [
        Center(
          child: Container(
            width: screen.isDesktop ? 700 : Get.width,
            height: screen.isDesktop ? null : Get.height,
            clipBehavior: Clip.none,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screen.isDesktop ? 5 : 0),
              color: Colores.blanco,
              boxShadow: [
                BoxShadow(
                  color: Colores.negro.withOpacity(0.5),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TituloWidget(),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Envíanos un mensaje'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'Escríbenos y uno de nuestros ejecutivos te estará contactando para asesorarte más acerca de nuestros servicios si te interesa sumar tu comercio a nuestra red de beneficios.'),
                  ),
                  RowColumnResponsive(
                    condicion: screen.isDesktop,
                    children: <Widget>[
                      Obx(() => DropdownPersonalizado(
                              items: [
                                DropdownValue(
                                    texto: 'Tipo de persona',
                                    value: 'Tipo de persona'),
                                DropdownValue(
                                    texto: 'Natural', value: 'Natural'),
                                DropdownValue(
                                    texto: 'Juridica', value: 'Juridica'),
                              ],
                              onChange: (e) {
                                negocioController
                                    .tipoPersonaSeleccionado.value = e!;
                              },
                              value: negocioController
                                  .tipoPersonaSeleccionado.value)),
                      Inputs(
                        icon: BootstrapIcons.number_123,
                        titulo: 'Identificación',
                        controller: negocioController.txtNumeroIdentificacion,
                        tipoTeclado: TextInputType.number,
                      )
                    ],
                  ),
                  RowColumnResponsive(
                    condicion: screen.isDesktop,
                    children: <Widget>[
                      Inputs(
                        icon: BootstrapIcons.type,
                        titulo: 'Nombre del negocio',
                        controller: negocioController.txtNombreNegocio,
                      ),
                      Inputs(
                        icon: BootstrapIcons.type,
                        titulo: 'Nombre de contacto',
                        controller: negocioController.txtNombreContacto,
                      ),
                    ],
                  ),
                  RowColumnResponsive(
                    condicion: screen.isDesktop,
                    children: <Widget>[
                      Obx(() => DropdownPersonalizado(
                              items: negocioController.paises.value
                                  .map(
                                    (e) => DropdownValue(
                                        texto: e.nombre!,
                                        value: '${e.id!}'),
                                  )
                                  .toList(),
                              onChange: (e) {
                                negocioController.paisSeleccionado.value =
                                    e!;
                              },
                              value: negocioController
                                  .paisSeleccionado.value)),
                          Obx(() => DropdownPersonalizado(
                              items: negocioController.departamentos.value
                                  .map(
                                    (e) => DropdownValue(
                                        texto: e.nombre!,
                                        value: '${e.id!}'),
                                  )
                                  .toList(),
                              onChange: (e) {
                                negocioController
                                    .departamentoSeleccionado.value = e!;
                              },
                              value: negocioController
                                  .departamentoSeleccionado.value)),
                          Obx(() => DropdownPersonalizado(
                              items: negocioController.ciudades.value
                                  .map(
                                    (e) => DropdownValue(
                                        texto: e.nombre!,
                                        value: '${e.id!}'),
                                  )
                                  .toList(),
                              onChange: (e) {
                                negocioController.ciudadSeleccionado.value =
                                    e!;
                              },
                              value: negocioController
                                  .ciudadSeleccionado.value)),
                      
                    ],
                  ),
                  RowColumnResponsive(
                        condicion: screen.isDesktop,
                        children: [
                          Inputs(
                            icon: BootstrapIcons.pin_map,
                            titulo: 'Dirección',
                            controller: negocioController.txtDireccion,
                          ),
                          Inputs(
                            icon: BootstrapIcons.telephone,
                            titulo: 'Teléfono',
                            controller: negocioController.txtNumeroContacto,
                            tipoTeclado: TextInputType.number,
                          ),
                        ],
                      ),
                  RowColumnResponsive(
                    condicion: screen.isDesktop,
                    children: <Widget>[
                      Inputs(
                        icon: BootstrapIcons.envelope,
                        titulo: 'Correo',
                        controller: negocioController.txtCorreo,
                      ),
                      Inputs(
                        icon: BootstrapIcons.envelope,
                        titulo: 'Confirmacoión de correo',
                        controller: negocioController.txtConfirmacionCorreo,
                      ),
                    ],
                  ),
                  RowColumnResponsive(
                    condicion: screen.isDesktop,
                    children: <Widget>[
                      Obx(() => DropdownPersonalizado(
                          items: negocioController.promedioVentaMes.value
                              .map(
                                (e) => DropdownValue(
                                    texto: e.promedioVenta!,
                                    value: '${e.id!}'),
                              )
                              .toList(),
                          onChange: (e) {
                            negocioController.promedioVentasSeleccionado.value = e!;
                          },
                          value: negocioController.promedioVentasSeleccionado.value)),
                      Inputs(
                        icon: BootstrapIcons.instagram,
                        titulo: 'Instagram',
                        controller: negocioController.txtInstagram,
                      )
                    ],
                  ),
                  RowColumnResponsive(
                    condicion: screen.isDesktop,
                    children: [
                      Inputs(
                        controller: negocioController.txtMensaje,
                        titulo: 'Mensaje',
                        maxLines: 3,
                      )
                    ],
                  ),
                  RowColumnResponsive(
                    condicion: screen.isDesktop,
                    children: [
                      Row(
                        mainAxisAlignment: screen.isDesktop
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          BotonTexto(
                            texto: 'Conceptos basicos de TopSites',
                            accion: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  RowColumnResponsive(
                    condicion: screen.isDesktop,
                    children: <Widget>[
                      BotonTexto(
                        texto: 'Ya tengo una cuenta!',
                        accion: () => Get.offAllNamed(Routes.LOGIN),
                      ),
                      const SizedBox(),
                      Boton(
                        accion: () => negocioController.registrarNegocio(),
                        color: Colores.verde,
                        colorHover: Colores.verdeOscuro,
                        child: const Text(
                          'Continuar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Boton(
                        accion: () => Get.back(),
                        color: Colores.grisClaro,
                        colorHover: Colores.gris,
                        child: const Text(
                          'Volver',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
