import 'package:get/get.dart';
import 'package:my_shop/core/viewModel/auth_view_model.dart';
import 'package:my_shop/core/viewModel/cart_view_model.dart';
import 'package:my_shop/core/viewModel/checkout_view_model.dart';
import 'package:my_shop/core/viewModel/control_view_model.dart';
import 'package:my_shop/core/viewModel/home_view_model.dart';
import 'package:my_shop/core/viewModel/profile_view_model.dart';
import 'package:my_shop/helper/local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => CheckOutViewModel());
  }
}