import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/core/viewModel/profile_view_model.dart';
import 'package:my_shop/view/widgets/custom_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: Get.put(ProfileViewModel()),
      builder:(controller)=> Scaffold(
        body: Container(
          child: Center(
            child: CustomButton(
                text: 'SignOut',
                onPress: (){
                  controller.signOut();
                },
            ),
          ),
        ),
      ),
    );
  }
}
