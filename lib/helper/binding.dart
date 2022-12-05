import 'package:get/get.dart';
import 'package:my_shop/core/viewModel/auth_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
  }
}