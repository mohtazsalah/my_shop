import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/constance.dart';
import 'package:my_shop/core/viewModel/auth_view_model.dart';
import 'package:my_shop/view/auth/loginscreen.dart';
import 'package:my_shop/view/widgets/custom_button.dart';
import 'package:my_shop/view/widgets/custom_text.dart';
import 'package:my_shop/view/widgets/text_form.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.off(LoginScreen());
          },
          child: const Icon(
            Icons.arrow_back ,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50.0 ,
          right: 20.0,
          left: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Sign Up,' ,
                        fontSize: 30,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextForm(
                        hint: 'David Spade',
                        onChange: (value) {
                          controller.name = value ;
                        },
                        obscure: false,
                        type: TextInputType.name,
                        text: 'Name',
                        fontSize: 18,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextForm(
                        hint: 'iamdavid@gmail.com',
                        onChange: (value) {
                          controller.email = value ;
                        },
                        obscure: false,
                        type: TextInputType.emailAddress,
                        text: 'Email',
                        fontSize: 16,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextForm(
                        hint: '************',
                        onChange: (value) {
                          controller.password = value ;
                        },
                        obscure: true,
                        type: TextInputType.text,
                        text: 'Password',
                        fontSize: 18,
                      ),
                      const SizedBox(height: 40,),
                      CustomButton(
                        text: 'SIGN UP',
                        color: primaryColor,
                        onPress: (){
                          controller.signUpWithEmailAndPassword();
                        },
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
