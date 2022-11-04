import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/config/routes/app_routes.dart';
import 'package:uma/presentation/common/style/style.dart';

class ContactoCliente extends StatelessWidget {
  ContactoCliente({super.key});

  final List<Choice> choices = [
    Choice(
      image: const AssetImage('assets/icons/historico_ventas_red_icon.png'),
      route: AppRoutes.historicoVentas,
      name: "Histórico Ventas",
    ),
    Choice(
      image:
          const AssetImage('assets/icons/evaluacion_punto_venta_red_icon.png'),
      name: "Evalucación PDV",
    ),
    Choice(
      image:
          const AssetImage('assets/icons/requerimientos_cliente_red_icon.png'),
      name: "Requerimientos Cliente",
    ),
    Choice(
      image: const AssetImage('assets/icons/gestion_inventario_red_icon.png'),
      route: AppRoutes.gestionInventario,
      name: "Gestión Inventario",
    ),
    Choice(
      image: const AssetImage('assets/icons/seguimiento_planes_red_icon.png'),
      route: AppRoutes.seguimientoPlanes,
      name: "Seguimiento Planes",
    ),
    Choice(
      image: const AssetImage('assets/icons/medicion_precios_red_icon.png'),
      route: AppRoutes.medicionPrecios,
      name: "Medición Precios",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      crossAxisSpacing: Get.width * 0.01,
      mainAxisSpacing: Get.height * 0.02,
      children: List.generate(
        choices.length,
        (index) {
          return _SelectCard(choice: choices[index]);
        },
      ),
    );
  }
}

class _SelectCard extends StatelessWidget {
  const _SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(choice.route!),
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: choice.image,
            ),
          ),
          SizedBox(height: Get.height * 0.01),
          Expanded(
            child: Text(
              choice.name,
              textAlign: TextAlign.center,
              style: TextStyles.bodyStyle(color: kGraySubtitle, isBold: true)
                  .copyWith(
                fontSize: Get.height * 0.015 / Get.textScaleFactor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Choice {
  Choice({required this.image, this.route, required this.name});
  final String? route;
  String name;
  final ImageProvider<Object> image;
}
