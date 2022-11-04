import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';

import 'package:uma/presentation/common/widgets/custom_card.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/agregar_plan/widgets/agregar_plan_page_form.dart';

import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/widgets/custom_app_bar_clear_controllers.dart';

class AgregarPlanPage extends StatelessWidget {
  const AgregarPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguimientoPlanesController>(
      builder: (seguimientoPlanesController) {
        return WillPopScope(
          onWillPop: () async => false,
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: CustomAppBarClearControllers(
                onPressed: () {
                  seguimientoPlanesController.borrarControladores();
                },
              ),

              // seguimientoPlanesController.isEdit.value
              // ? const NavigationAppBar() as PreferredSizeWidget
              // : const CustomAppBar(),
              body: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Get.height * 0.02,
                            horizontal: Get.width * 0.025),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(Get.width * 0.065,
                                  Get.height * 0.015, 0, Get.height * 0.015),
                              child: Text(
                                "Agregar plan de seguimiento",
                                style: TextStyles.titleStyle2(
                                    color: kGraySubtitle),
                              ),
                            ),
                            Expanded(
                              child: CustomCard(
                                body: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 16),
                                  child: AgregarPlanPageForm(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
