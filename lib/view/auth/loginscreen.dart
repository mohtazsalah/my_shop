import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/constance.dart';
import 'package:my_shop/core/viewModel/auth_view_model.dart';
import 'package:my_shop/view/auth/register_view.dart';
import 'package:my_shop/view/widgets/custom_button.dart';
import 'package:my_shop/view/widgets/custom_button_social.dart';
import 'package:my_shop/view/widgets/custom_text.dart';
import 'package:my_shop/view/widgets/text_form.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Welcome ,' ,
                            fontSize: 30,
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(RegisterScreen());
                            },
                            child: CustomText(
                              text: 'Sign Up',
                              color: primaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: 'Sign in to Continue',
                      fontSize: 14,
                      color: Colors.grey,
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
                      height: 20,
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
                    const SizedBox(height: 20,),
                    CustomText(
                      text: 'Forgot Password?',
                      fontSize: 14,
                      alignment: Alignment.topRight,
                    ),
                    const SizedBox(height: 20,),
                    CustomButton(
                      text: 'SIGN IN',
                      color: primaryColor,
                      onPress: (){
                          controller.signInWithEmailAndPassword();
                      },
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                text: '-OR-',
                alignment: Alignment.center,
              ),
              const SizedBox(height: 40,),
              CustomButtonSocial(
                  image: 'assets/images/facebook.png',
                  text: 'Sign In with FaceBook',
                  color: Colors.white,
                  onPress: (){
                    controller.faceBookSignInMethod();
                  },
              ),
              CustomButtonSocial(
                image: 'assets/images/google.png',
                text: 'Sign In with Google',
                color: Colors.white,
                onPress: (){
                  controller.googleSignInMethod();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
