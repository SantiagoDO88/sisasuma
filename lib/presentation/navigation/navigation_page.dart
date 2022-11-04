import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/navigation/navigation_controller.dart';
import 'package:uma/presentation/navigation/widgets/custom_bottom_navigation_bar.dart';
import 'package:uma/presentation/pages/estadisticas/estadisticas_page.dart';
import 'package:uma/presentation/pages/herramientas/herramientas_page.dart';
import 'package:uma/presentation/pages/home/home_page.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/detalles_rutero_page.dart';
import 'package:uma/presentation/pages/rutero/rutero_page.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<NavigationController>(
      builder: (navigationController) => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: navigationController.selectedMenuOption,
            children: const [
              HomePage(),
              RuteroPage(),
              EstadisticasPage(),
              HerramientasPage()
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
