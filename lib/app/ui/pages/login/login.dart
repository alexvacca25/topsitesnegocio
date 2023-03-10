import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/controllers/sesion_controller.dart';
import 'package:topsitesnegocio/app/routes/app_pages.dart';
import 'package:topsitesnegocio/app/ui/theme/imagenes.dart';
import 'package:topsitesnegocio/app/ui/widgets/modal.dart';
import 'package:topsitesnegocio/app/ui/widgets/switch.dart';

import '../../theme/colores.dart';
import '../../widgets/boton.dart';
import '../../widgets/error_pantalla.dart';
import '../../widgets/input.dart';
import '../../widgets/titulo.dart';

class LoginPage extends GetView {

  const LoginPage({super.key});

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
                    Colores.morado,
                    Colores.azul,
                  ],
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
                image: DecorationImage(
                    image: AssetImage(
                      Imagenes.fondo,
                    ),
                    fit: BoxFit.cover,
                    // filterQuality: FilterQuality.high,
                    opacity: 0.1)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ResponsiveLogin(context: context),
            )));
  }
}

// ignore: must_be_immutable
class ResponsiveLogin extends GetResponsiveView {
  final dynamic context;
  ResponsiveLogin({
    super.key,
    this.context,
  });
  double radio = 10;

  TextInputController txtCorreo = TextInputController();
  TextInputController txtClave = TextInputController();
  SesionController sesionController = Get.find();

  @override
  Widget builder() {
    if (screen.isWatch) {
      return const ErrorPantalla();
    }
    return Center(
      child: SingleChildScrollView(
        child: Container(
          // clipBehavior: Clip.hardEdge,
          // padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)
            // boxShadow: [
            //   BoxShadow(
            //     color: Colores.negro.withOpacity(0.5),
            //     blurRadius: 6,
            //     offset: const Offset(0, 3),
            //   )
            // ],
          ),
          child: Row(
            // condicion: screen.isDesktop,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: screen.isPhone ? 0 : 1,child: const SizedBox()),
              !screen.isDesktop
                  ? Container()
                  : Expanded(
                    child: Container(
                        width: 400,
                        height: 500,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(radio), bottomLeft: Radius.circular(radio)) ,
                            color: Colores.blanco,
                            image: const DecorationImage(
                              image: AssetImage(
                                Imagenes.fondo2,
                              ),
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            )),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          color: Colores.azulOscuro.withOpacity(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                Imagenes.logo1,
                                width: 150,
                                filterQuality: FilterQuality.high,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ),
              Expanded(
                flex: screen.isTablet ? 3 : 1,
                child: Container(
                  width: 400,
                  height: 500,
                  // margin: EdgeInsets.all(20),
                  // width: screen.isPhone ? Get.width : 400,
                  // height: screen.isPhone ? Get.height : 500,
                  decoration: BoxDecoration(
                    color: Colores.blanco,
                    borderRadius: screen.isDesktop ? BorderRadius.only(topRight: Radius.circular(radio), bottomRight: Radius.circular(radio)) : BorderRadius.circular(radio)
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -250,
                        right: -250,
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            Imagenes.logo6,
                            width: 500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: screen.isPhone
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [TituloWidget()],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Accede a tu panel de negocio'),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Inputs(
                              titulo: 'Correo',
                              icon: BootstrapIcons.envelope,
                              controller: txtCorreo,
                              onSubmitted: (str)=>sesionController.iniciarSesion(txtCorreo.controlador.text, txtClave.controlador.text),
                            ),
                            Inputs(
                              titulo: 'Contrase??a',
                              icon: BootstrapIcons.lock,
                              esClave: true,
                              controller: txtClave,
                              onSubmitted: (str)=>sesionController.iniciarSesion(txtCorreo.controlador.text, txtClave.controlador.text),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                BotonTexto(
                                  texto: 'Olvide mi contrase??a',
                                  accion: () {
                                    TextInputController txtReestablecerCorreo =
                                        TextInputController();
                                    final mensaje = ''.obs;
                                    Modal.porDefecto(context,
                                        titulo: 'Recuperar contrase??a',
                                        centrarTitulo: true,
                                        textoAceptar: 'Reestablecer',
                                        onAceptar: () async {
                                      Map? response = await sesionController
                                          .claveOlvidada(txtReestablecerCorreo
                                              .controlador.text);
                                      mensaje.value = response!['encontrado'] ? 'Se le ha enviado un correo electr??nico para restablecer la contrase??a.' : 'No estas registrado';
                                    },
                                        onCancelar: () {},
                                        child: Column(
                                          children: [
                                            Inputs(
                                              icon: BootstrapIcons.envelope,
                                              titulo: 'Correo electr??nico',
                                              controller: txtReestablecerCorreo,
                                            ),
                                            Obx(() => Text(mensaje.value))
                                          ],
                                        ));
                                  },
                                  color: Colores.rojo,
                                  colorHover: Colores.gris,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SwitchPersonalizado(
                                texto: 'Mantener sesion iniciada',
                                estado: true,
                                onChanged: (v) {}),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Boton(
                                      color: Colores.morado,
                                  accion: () async {
                                    if (txtCorreo.controlador.text.isEmpty) {
                                      txtCorreo.error.value =
                                          'Debe ingresar el correo';
                                      return;
                                    }
                                    if (!txtCorreo.controlador.text.isEmail) {
                                      txtCorreo.error.value =
                                          'Debe ingresar un correo valido';
                                      return;
                                    }
                                    if (txtClave.controlador.text.isEmpty) {
                                      txtClave.error.value =
                                          'Debe ingresar la contrase??a';
                                      return;
                                    }
                                    Map? response =
                                        await sesionController.iniciarSesion(
                                            txtCorreo.controlador.text,
                                            txtClave.controlador.text);
                                    if (response != null) {
                                      txtCorreo.error.value =
                                          'Usuario y/o contrase??a incorrectos';
                                    }
                                  },
                                  child: const Text(
                                    'Iniciar Sesion',
                                    style: TextStyle(color: Colores.blanco),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('??No tienes cuenta?  '),
                                BotonTexto(
                                  texto: 'Registrate aqui',
                                  accion: () {
                                    Get.toNamed(Routes.REGISTRO);
                                  },
                                  color: Colores.verde,
                                  colorHover: Colores.gris,
                                )
                              ],
                            ),
                            SizedBox(height: screen.isDesktop ? 0 : 20,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: screen.isPhone ? 0 : 1,child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
