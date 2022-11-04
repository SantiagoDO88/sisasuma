import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/widgets/custom_search_text_field.dart';

import 'package:uma/presentation/pages/rutero/pages/historico_ventas/historico_ventas_controller.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoricoVentasController>(
      builder: (historicoVentasController) {
        return Row(
          children: [
            Expanded(
              child: CustomSearchTextField(
                onSearch: (searchText) {
                  historicoVentasController.searchText.value = searchText;
                },
                hint: "Buscar",
                suffixIcon: const Icon(Icons.search),
              ),
              //     // CustomTextField(
              //     //   textEditingController: historicoVentasController.filterText,
              //     //   hint: "Buscar",
              //     //   suffixIcon: const Icon(Icons.search),
              //     //   filled: true,
              //     //   contentPadding: 14,
              //     // ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () {},
                child: SizedBox(
                  height: Get.height * 0.11,
                  child: Padding(
                    padding: EdgeInsets.all(Get.height * 0.005),
                    child: const Image(
                      image: AssetImage('assets/icons/moto_mix.png'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
