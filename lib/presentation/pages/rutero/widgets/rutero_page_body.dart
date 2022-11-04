import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/config/routes/app_routes.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/detalles_rutero_controller.dart';
import 'package:uma/presentation/pages/rutero/rutero_controller.dart';
import 'package:uma/presentation/pages/rutero/widgets/client_card.dart';
import 'package:uma/presentation/pages/rutero/widgets/custom_drop_down.dart';

class RuteroPageBody extends StatelessWidget {
  RuteroPageBody({super.key});

  final DetallesRuteroController detallesRuteroController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetX<RuteroController>(
      builder: (ruteroController) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: Get.height * 0.02, horizontal: Get.height * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(Get.width * 0.065,
                    Get.height * 0.015, 0, Get.height * 0.030),
                child: Text(
                  "Rutero",
                  style: TextStyles.titleStyle2(color: kGraySubtitle),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomDropDown(
                      isRed: false,
                      items: ruteroController.weekDays.keys.toList(),
                      value: ruteroController.selectedDay.value,
                      onChanged: (value) {
                        ruteroController.searchRuteros(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
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
              SizedBox(
                height: Get.height * 0.030,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      Get.width * 0.065,
                      Get.height * 0.015,
                      Get.width * 0.065,
                      Get.height * 0.015,
                    ),
                    child: Text(
                      "Listado Clientes",
                      style: TextStyles.titleStyle2(color: kGraySubtitle),
                    ),
                  ),
                  Expanded(
                    child: FlutterSwitch(
                      value: ruteroController.isVisited.value,
                      padding: 5,
                      toggleSize: 29,
                      activeText: "Visitados",
                      activeTextColor: kPrimaryWhite,
                      inactiveColor: kPrimaryGrey,
                      inactiveText: "No visitados",
                      inactiveTextColor: kPrimaryWhite,
                      width: Get.width,
                      height: Get.height * 0.06,
                      activeColor: kPrimaryRed,
                      valueFontSize: Get.height * 0.018 / Get.textScaleFactor,
                      showOnOff: true,
                      onToggle: (value) {
                        ruteroController.isVisited.value = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.030,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomSearchTextField(
                        onSearch: (searchText) {
                          ruteroController.searchText.value = searchText;
                          ruteroController.getRuteroList();
                        },
                        hint: "Buscar",
                        suffixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.010,
              ),
              ListView.builder(
                itemCount: ruteroController.listRutero.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ClientCard(
                    rutero: ruteroController.listRutero[index],
                    onTap: () {
                      ruteroController.setRutero(ruteroController.listRutero[index]);
                      detallesRuteroController.setInitials(
                          selectedRutero: ruteroController.listRutero[index]);
                      Get.toNamed(AppRoutes.detallesRutero);
                      // Get.toNamed(AppRoutes.detallesRutero, arguments: ruteroController.listRutero[index]);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
