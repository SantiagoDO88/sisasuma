import 'package:flutter/material.dart';

import 'package:uma/presentation/common/widgets/custom_app_bar.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/widgets/cartera_page_body.dart';

class CarteraPage extends StatelessWidget {
  const CarteraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: CarteraPagebody(),
      ),
    );
  }
}
