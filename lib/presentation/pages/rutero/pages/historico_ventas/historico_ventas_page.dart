import 'package:flutter/material.dart';

import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/widgets/historico_ventas_body.dart';

class HistoricoVentasPage extends StatelessWidget {
  const HistoricoVentasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) => ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: const IntrinsicHeight(
              child: HistoricoVentasBody(),
            ),
          ),
        ),
      ),
    );
  }
}
