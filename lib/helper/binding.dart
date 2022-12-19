import 'package:get/get.dart';
import 'package:my_shop/core/viewModel/auth_view_model.dart';
import 'package:my_shop/core/viewModel/control_view_model.dart';
import 'package:my_shop/core/viewModel/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
  }
}