import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/core/viewModel/profile_view_model.dart';
import 'package:my_shop/view/widgets/custom_button.dart';
import 'package:my_shop/view/widgets/custom_text.dart';
import 'package:my_shop/view/widgets/profile_item.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel() ?? Get.put(ProfileViewModel()),
      builder:(controller)=> controller.loading.value ?
      Center(child: CircularProgressIndicator(color: Colors.blue,))
          :Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 20 , right: 20 , top: 50),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: controller.userModel == null ?
                        Image.asset('assets/images/avatar.png' ,
                          height: 130,
                          width: 130,
                          fit: BoxFit.fill,
                        ) :
                        controller.userModel?.userPic == null ?
                        Image.asset('assets/images/avatar.png',
                          height: 130,
                          width: 130,
                          fit: BoxFit.fill,
                        ) :
                        controller.userModel?.userPic == '' ?
                        Image.asset('assets/images/avatar.png' ,
                          height: 130,
                          width: 130,
                          fit: BoxFit.fill,
                        ) :
                        controller.userModel?.userPic == 'default' ?
                        Image.asset('assets/images/avatar.png' ,
                          height: 130,
                          width: 130,
                          fit: BoxFit.fill,
                        ) :
                        Image.network(controller.userModel!.userPic! ,
                          height: 130,
                          width: 130,
                          fit: BoxFit.fill,
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: controller.userModel!.userName!,
                                color: Colors.black,
                              fontSize: 30,
                              max: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 10,),
                            CustomText(
                              text: controller.userModel!.userEmail!,
                              color: Colors.black,
                              fontSize: 24,
                              max: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100,),
                  ProfileItem(
                    leftIcon: 'icon_edit_profile.png',
                      rightIcon: 'arrow_right.png',
                      itemText: 'Edit Profile',
                      onTap: (){}
                  ),
                  SizedBox(height: 30,),
                  ProfileItem(
                      leftIcon: 'icon_location.png',
                      rightIcon: 'arrow_right.png',
                      itemText: 'Shipping Address',
                      onTap: (){}
                  ),
                  SizedBox(height: 30,),
                  ProfileItem(
                      leftIcon: 'icon_history.png',
                      rightIcon: 'arrow_right.png',
                      itemText: 'Order History',
                      onTap: (){}
                  ),
                  SizedBox(height: 30,),
                  ProfileItem(
                      leftIcon: 'icon_payment.png',
                      rightIcon: 'arrow_right.png',
                      itemText: 'Cards',
                      onTap: (){}
                  ),
                  SizedBox(height: 30,),
                  ProfileItem(
                      leftIcon: 'icon_alert.png',
                      rightIcon: 'arrow_right.png',
                      itemText: 'Notifications',
                      onTap: (){}
                  ),
                  SizedBox(height: 30,),
                  ProfileItem(
                      leftIcon: 'icon_exit.png',
                      itemText: 'Log Out',
                      onTap: (){
                        controller.signOut();
                      }
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}