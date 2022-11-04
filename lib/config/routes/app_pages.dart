import 'package:get/get.dart';
import 'package:uma/config/routes/app_routes.dart';
import 'package:uma/presentation/navigation/navigation_binding.dart';
import 'package:uma/presentation/navigation/navigation_page.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/gestion_inventario_general/gestion_inventario_binding.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/gestion_inventario_general/gestion_inventario_page.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/resultado_inventario_mix/resultado_inventario_mix_page.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios/medicion_precios.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios/medicion_precios_binding.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/medicion_precios_agregar.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/medicion_precios_agregar_binding.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_finalizar/medicion_precios_finalizar_binding.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/cartera_binding.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/cartera_page.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/detalles_rutero_page.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/historico_ventas_page.dart';
import 'package:uma/presentation/pages/home/home_page.dart';
import 'package:uma/presentation/pages/login/login_page.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_finalizar/medicion_precios_finalizar_page.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/agregar_plan/agregar_plan_page.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/editar_plan/editar_plan_page.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/firmar_planes/firmar_planes_page.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_page.dart';
import 'package:uma/presentation/pages/rutero/rutero_page.dart';
import 'package:uma/presentation/pages/splash/splash_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.navigation,
      page: () => const NavigationPage(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.rutero,
      page: () => const RuteroPage(),
    ),
    GetPage(
      name: AppRoutes.detallesRutero,
      page: () => const DetallesRuteroPage(),
    ),
    GetPage(
      name: AppRoutes.seguimientoPlanes,
      page: () => const SeguimientoPlanesPage(),
    ),
    GetPage(
      name: AppRoutes.agregarPlan,
      page: () => const AgregarPlanPage(),
    ),
    GetPage(
      name: AppRoutes.editarPlan,
      page: () => const EditarPlanPage(),
    ),
    GetPage(
      name: AppRoutes.firmarPlanes,
      page: () => const FirmarPlanesPage(),
    ),
    GetPage(
      name: AppRoutes.cartera,
      page: () => const CarteraPage(),
      binding: CarteraBindings(),
    ),
    GetPage(
      name: AppRoutes.historicoVentas,
      page: () => const HistoricoVentasPage(),
    ),
    GetPage(
      name: AppRoutes.medicionPrecios,
      page: () => const MedicionPrecios(),
      binding: MedicionPreciosBindings(),
    ),
    GetPage(
      name: AppRoutes.medicionPreciosAgregar,
      page: () => const MedicionPreciosAgregar(),
      binding: MedicionPreciosAgregarBindings(),
    ),
    GetPage(
      name: AppRoutes.medicionPreciosFinalizar,
      page: () => const MedicionPreciosFinalizarPage(),
      binding: MedicionPreciosFinalizarBindings(),
    ),
    GetPage(
      name: AppRoutes.gestionInventario,
      page: () => const GestionInventarioPage(),
      binding: GestionInventarioBinding(),
    ),
    GetPage(
      name: AppRoutes.resultadoInventarioMix,
      page: () => const ResultadoInventarioMixPage(),
    ),
  ];
}
