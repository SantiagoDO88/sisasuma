import 'package:flutter/material.dart';

import 'package:uma/presentation/common/widgets/widgets.dart';
import 'widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const NavigationAppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: const IntrinsicHeight(
                child: HomePageBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar:  HomePageAppBar(),
//         body: HomePageBody(),
//       ),





