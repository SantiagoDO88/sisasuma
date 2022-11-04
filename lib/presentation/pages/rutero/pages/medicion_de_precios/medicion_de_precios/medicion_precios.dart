import 'package:flutter/material.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios/widgets/medicion_precios_body.dart';

class MedicionPrecios extends StatelessWidget {
  const MedicionPrecios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) => ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: const IntrinsicHeight(
              child: MedicionPreciosBody(),
            ),
          ),
        ),
      ),
    );
  }
}
