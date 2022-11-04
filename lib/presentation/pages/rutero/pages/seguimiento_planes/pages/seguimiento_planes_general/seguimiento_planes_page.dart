import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/widgets/seguimiento_planes_page_body.dart';

class SeguimientoPlanesPage extends StatelessWidget {
  const SeguimientoPlanesPage({super.key});

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
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.02, horizontal: Get.width * 0.025),
                child: const SeguimientoPlanesPageBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
