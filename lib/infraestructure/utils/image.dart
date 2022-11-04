import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<ImageSource?> showImageSource(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Column(
      children: [
        ListTile(
          leading: Icon(Icons.camera_alt),
          title: Text("Cámara"),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          leading: Icon(Icons.image_outlined),
          title: Text("Galería"),
          onTap: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}
