import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/firmar_planes/dialog/firmar_planes_dialog.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/widgets/carta_editable.dart';

class FirmarPlanesPage extends StatelessWidget {
  const FirmarPlanesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguimientoPlanesController>(
      builder: (seguimientoPlanesController) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: CustomAppBar(),
            body: LayoutBuilder(
              builder: (context, constraints) => ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
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
                          "Firmar planes de seguimiento",
                          style: TextStyles.titleStyle2(color: kGraySubtitle),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                            itemCount: seguimientoPlanesController
                                .listSeguimientoPlanes.length,
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return CartaEditable(
                                seguimientoPlan: seguimientoPlanesController
                                    .listSeguimientoPlanes[index],
                              );
                            },
                          ),
                        ),

                        // ListView.builder(
                        //   shrinkWrap: true,
                        //   children: [
                        //     cartaEditable()

                        //   ],
                        // ),
                      ),
                      SizedBox(
                        height: Get.height * 0.025,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: CustomButton(
                          placeHolder: "Firmar planes",
                          onPressed: () {
                            firmarPlanesDialog(context);
                          },
                        ),
                      )
                    ],
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
