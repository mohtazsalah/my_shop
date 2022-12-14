import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/core/viewModel/auth_view_model.dart';
import 'package:my_shop/core/viewModel/control_view_model.dart';
import 'package:my_shop/view/auth/loginscreen.dart';

class ControlView extends GetWidget<AuthViewModel> {
  
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
      ?LoginScreen()
      :GetBuilder<ControlViewModel>(
        init: Get.put(ControlViewModel()),
        builder: (controller)=> Scaffold(
            body: controller.currentScreen,
          bottomNavigationBar: bottomNavigationBar(),
        ),
      );
    }
    );
  }
  Widget bottomNavigationBar(){
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text('Explore'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset(
                  'assets/images/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text('Cart'),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Image.asset(
                'assets/images/Icon_Cart.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text('Account'),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Image.asset(
                'assets/images/Icon_User.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) => controller.changeSelectedValue(index),
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
