import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:uma/config/routes/app_routes.dart';
import 'package:uma/presentation/common/widgets/custom_app_bar.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/widgets/medicion_precios_agregar_body.dart';

class MedicionPreciosAgregar extends StatelessWidget {
  const MedicionPreciosAgregar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: const IntrinsicHeight(
            child: MedicionPreciosAgregarBody(),
          ),
        ),
      ),
    );
  }
}
