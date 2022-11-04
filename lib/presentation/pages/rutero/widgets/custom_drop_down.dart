import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.color,
    this.elementsColor,
    this.dropDownColor,
    required this.isRed,
  }) : super(key: key);

  final List<String> items;
  final Object value;
  final Function(Object) onChanged;
  Color? color;
  Color? elementsColor = kGraySubtitle;
  Color? dropDownColor = kPrimaryWhite;
  Color? textColor = kGrayTitle;
  bool isRed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: color,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05,
          vertical: Get.height * 0.004,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            elevation: 3,
            iconDisabledColor: elementsColor,
            iconEnabledColor: elementsColor,
            icon: Icon(Icons.arrow_drop_down_rounded),
            dropdownColor: dropDownColor,
            borderRadius: BorderRadius.circular(20),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: TextStyles.bodyStyle(color: isRed? kPrimaryWhite :kGrayTitle, isBold: true),
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              onChanged(newValue ?? "");
            },
            value: value,
          ),
        ),
      ),
    );
  }
}


// class CustomDropDown extends StatelessWidget {
//   const CustomDropDown({
//     Key? key,
//     required this.items,
//     required this.value,
//     required this.onChanged,
//   }) : super(key: key);

//   final List<String> items;
//   final Object value;
//   final Function(Object) onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 2,
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         width: Get.width,
//         padding: EdgeInsets.symmetric(
//             horizontal: Get.width * 0.05, vertical: Get.height * 0.004),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton(
//             elevation: 3,
//             iconDisabledColor: kGraySubtitle,
//             iconEnabledColor: kGraySubtitle,
//             dropdownColor: kPrimaryWhite,
//             borderRadius: BorderRadius.circular(20),
//             items: items.map((String items) {
//               return DropdownMenuItem(
//                 value: items,
//                 child: Text(
//                   items,
//                   style: TextStyles.bodyStyle(color: kGrayTitle, isBold: true),
//                 ),
//               );
//             }).toList(),
//             onChanged: (newValue) {
//               onChanged(newValue ?? "");
//             },
//             value: value,
//           ),
//         ),
//       ),
//     );
//   }
// }
