import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt _selectedMenuOption = 0.obs;

  int get selectedMenuOption {
    return _selectedMenuOption.value;
  }

  set selectedMenuOption(int index) {
    _selectedMenuOption.value = index;
  }
}
