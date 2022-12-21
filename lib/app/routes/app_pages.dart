import 'package:get/get.dart';
import 'package:topsitesnegocio/app/bindings/reestablecer_clave_binding.dart';
import 'package:topsitesnegocio/app/bindings/registro_negocio_binding.dart';
import 'package:topsitesnegocio/app/data/models/sede/combo_plan.dart';
import 'package:topsitesnegocio/app/ui/pages/reestablecer_clave/reestablecer_clave.dart';
import 'package:topsitesnegocio/app/ui/pages/registrar_negocio/registro_negocio.dart';
import '../bindings/dashboar_binding.dart';
import '../ui/pages/dashboard/dashboard.dart';
import '../ui/pages/login/login.dart';
import '../ui/pages/sede/pages/tabs/combo_plan_sede/form_combo_plan.dart';
part './app_routes.dart';

class AppPages {

  static List<GetPage> pages = <GetPage>[
    GetPage(
      name: Routes.LOGIN, 
      page:() => const LoginPage(),
      transition: Transition.rightToLeft
    ),
    GetPage(
      name: Routes.PRINCIPAL, 
      page:() => const DashboardPage(),
      transition: Transition.fadeIn,
      binding: DashboardBinding(),
      preventDuplicates: false
    ),
    GetPage(
      name: Routes.HOME, 
      page:() => const DashboardPage(),
      transition: Transition.fadeIn,
      binding: DashboardBinding(),
      preventDuplicates: false
    ),
    GetPage(
      name: Routes.PRINCIPAL2, 
      page:() => const DashboardPage(),
      transition: Transition.fadeIn,
      binding: DashboardBinding(),
      preventDuplicates: false
    ),
    GetPage(
      name: Routes.REGISTRO, 
      page:() => const RegistroNegocioPage(),
      transition: Transition.downToUp,
      binding: RegistroNegocioBinding(),
      preventDuplicates: false
    ),
    GetPage(
      name: Routes.REESTABLECER, 
      page:() => ReestablecerClavePage(),
      transition: Transition.downToUp,
      binding: ReestablecerClaveBinding(),
      preventDuplicates: false
    ),
  ];
}