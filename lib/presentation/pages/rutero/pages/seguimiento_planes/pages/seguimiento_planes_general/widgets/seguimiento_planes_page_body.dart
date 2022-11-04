import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/config/routes/app_routes.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/agregar_plan/widgets/date_picker.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';
import 'package:uma/presentation/pages/rutero/widgets/custom_drop_down.dart';

class SeguimientoPlanesPageBody extends StatelessWidget {
  const SeguimientoPlanesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguimientoPlanesController>(
      builder: (seguimientoPlanesController) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(Get.width * 0.065,
                    Get.height * 0.015, 0, Get.height * 0.030),
                child: Text(
                  "Seguimiento planes",
                  style: TextStyles.titleStyle2(color: kGraySubtitle),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomSearchTextField(
                        onSearch: (searchText) {
                          seguimientoPlanesController.searchText.value =
                              searchText;
                        },
                        hint: "Buscar",
                        suffixIcon: const Icon(Icons.search),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onTap: () {},
                        child: SizedBox(
                          height: Get.height * 0.065,
                          child: Padding(
                            padding: EdgeInsets.all(Get.height * 0.01),
                            child: const Image(
                              image: AssetImage('assets/icons/filtro_btn.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Row(
                children: [
                  // Expanded(
                  //   child: Padding(
                  //     padding: EdgeInsets.only(right: Get.width * 0.1),
                  //     child: CustomDropDown(
                  //       isRed: false,
                  //       items: seguimientoPlanesController.editions,
                  //       value:
                  //           seguimientoPlanesController.selectedEdition.value,
                  //       onChanged: (value) {
                  //         seguimientoPlanesController.dropDown(value);
                  //         //seguimientoPlanesController.selectedEdition.value;
                  //         //ruteroController.searchRuteros(value);
                  //       },
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: Get.width * 0.4,
                  ),
                  Expanded(
                    child: CustomButton(
                      placeHolder: "Agregar plan",
                      onPressed: () => Get.toNamed(AppRoutes.agregarPlan),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onTap: () => Get.toNamed(AppRoutes.agregarPlan),
                      child: Image.asset(
                        'assets/icons/mas_info.png',
                        height: Get.height * 0.15,
                        color: kPrimaryGrey,
                      ),
                    ),
                  ),
                  Text(
                    "Aún no hay ningún plan de seguimiento\nAgrégalos presionando el botón",
                    textAlign: TextAlign.center,
                    style:
                        TextStyles.bodyStyle(color: kGrayHints, isBold: false)
                            .copyWith(
                      fontSize: 14 / Get.textScaleFactor,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
