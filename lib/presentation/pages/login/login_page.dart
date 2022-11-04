import 'package:flutter/material.dart';

import 'package:uma/presentation/pages/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/trazado.png'),
                fit: BoxFit.cover
              )
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: constraints.maxHeight * 1),
                  child: const IntrinsicHeight(
                    child: LoginForm(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}









// GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: SafeArea(
//         child: Scaffold(
//           body: Stack(
//             children: [
//               SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(40),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
                      
//                       children: [
                        
//                         Image(
//                           image: const AssetImage('assets/icons/logo.png'),
//                           width: Get.width,
//                         ),
//                         SizedBox(height: size.height * 0.07),
//                         CustomTextField(
//                           textEditingController: userController,
//                           hint: "Usuario",
//                           maxLenght: 20,
//                           prefixIcon: const Icon(
//                             Icons.person,
//                           ),
//                         ),
//                         SizedBox(height: size.height * 0.02),
//                         CustomPasswordTextField(
//                           passwordController: passwordController,
//                         ),
//                         SizedBox(height: size.height * 0.001),
//                         CustomButton(
//                           placeHolder: 'Iniciar Sesión',
//                           onPressed: (() =>
//                               Get.offAndToNamed(AppRoutes.splash)),
//                         ),
//                         SizedBox(height: size.height * 0.02),
//                         // FutureBuilder(
//                         //   builder: (context, AsyncSnapshot<String> snapshot) {
//                         //     if (snapshot.hasData) {
//                         //       return Center(
//                         //         child:
//                         //             //'Versión
//                         //             Text(Messages.appText.appVersion +
//                         //                 ' ${snapshot.data.toString()}'),
//                         //       );
//                         //     } else {
//                         //       return Container();
//                         //     }
//                         //   },
//                         //   future: Util.device.getAppVersion(),
//                         // ),
//                         // Obx(
//                         //   () => Center(
//                         //     child:
//                         //         //ErrorText(text: loginViewModel.errorText.value),
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               // Obx(
//               //   () => Visibility(
//               //     child: const CircularProgressWidget(),
//               //     visible: loginViewModel.load.value,
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );