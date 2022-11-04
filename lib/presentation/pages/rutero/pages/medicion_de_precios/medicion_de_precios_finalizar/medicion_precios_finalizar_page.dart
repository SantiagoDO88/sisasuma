import 'package:flutter/material.dart';
import 'package:uma/presentation/common/widgets/custom_app_bar.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_finalizar/widgets/medicion_precios_finalizar_body.dart';

class MedicionPreciosFinalizarPage extends StatelessWidget {
  const MedicionPreciosFinalizarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: const IntrinsicHeight(
            child: MedicionPreciosFinalizarBody(),
          ),
        ),
      ),
    );
  }
}
