import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/cartera_controller.dart';

class DropDownCarteraPage extends StatefulWidget {
  const DropDownCarteraPage({super.key});

  @override
  State<DropDownCarteraPage> createState() => _DropDownCarteraPageState();
}

class _DropDownCarteraPageState extends State<DropDownCarteraPage> {
  String? selectedValue;
  final List<String> items = [
    'Gestion de Cobros 1',
    'Gestion de Cobros 2',
    'Gestion de Cobros 3',
    'Gestion de Cobros 4',
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarteraController>(builder: (carteraController) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height * 0.008),
        child: DropdownButton2(
          isExpanded: true,
          hint: Text(
            'Select Item',
            style: TextStyles.buttonStyle(color: kPrimaryWhite),
            overflow: TextOverflow.ellipsis,
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: kPrimaryRed,
          ),
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: kPrimaryRed,
          ),
          icon: const Icon(
            Icons.arrow_drop_down_rounded,
            color: kPrimaryWhite,
          ),
        ),
      );
    });
  }
}
