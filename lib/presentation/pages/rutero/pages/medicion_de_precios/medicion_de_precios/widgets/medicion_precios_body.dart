import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/config/routes/app_routes.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios/medicion_precios_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios/widgets/card_info.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios/widgets/excel_medicion_precios.dart';

class MedicionPreciosBody extends StatelessWidget {
  const MedicionPreciosBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicionPreciosController>(
        builder: (medicionPreciosController) {
      return Padding(
          padding: EdgeInsets.symmetric(
              vertical: Get.height * 0.02, horizontal: Get.height * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardInfo(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomSearchTextField(
                        onSearch: (searchText) {
                          medicionPreciosController.searchText.value =
                              searchText;
                        },
                        hint: "Buscar",
                        suffixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: Get.height * 0.030,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  CustomButton(
                    placeHolder: 'Agregar Medicion',
                    onPressed: () => {
                      Get.toNamed(AppRoutes.medicionPreciosAgregar)
                    },
                  ),
                ],
              ),

              SizedBox(
                height: Get.height * 0.030,
              ),

              ExcelMedicionPrecios()

              // FloatingActionButton(
              //   child: const Icon(Icons.arrow_forward_ios_sharp),
              //   onPressed: () => Get.toNamed(AppRoutes.medicionPrecios),
              // ),
            ],
          ));
    });
  }
}
