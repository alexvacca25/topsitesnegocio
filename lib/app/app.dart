import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topsitesnegocio/app/bindings/sesion_binding.dart';

import 'constantes.dart';
import 'routes/app_pages.dart';
import 'ui/theme/fonts.dart';

class App extends StatelessWidget {

  

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: titulo,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      // home: AgregarEditarSedePage(),
      theme: ThemeData(
        fontFamily: Fuentes.ztgrafton
      ),
      defaultTransition: Transition.downToUp,
      translations: AppTranslations(),
      locale: const Locale('en','EN'),
      fallbackLocale: const Locale('es', 'ES'),
      initialBinding: SesionBinding(),
      getPages: AppPages.pages,
    );
  }
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_EN': {
      'iniciar_esion': 'Sing in',
    },
    'es_ES': {
      'iniciar_esion': 'Iniciar Sesion',
    }
  };
}