import 'package:flutter/material.dart';
import 'package:my_shop/constance.dart';
import 'package:my_shop/view/widgets/custom_button.dart';
import 'package:my_shop/view/widgets/custom_text_form_field.dart';

import 'custom_text.dart';

class LoginCard extends StatelessWidget {
   LoginCard({
     Key? key ,
     required this.email,
     required this.password,
     required this.onPress,
  }) : super(key: key);

  String email , password ;
  final VoidCallback onPress ;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                CustomText(
                  text: 'Sign Up',
                  color: primaryColor,
                  fontSize: 18,
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
            CustomTextFormFeild(
              onChange: (value) {
                email = value! ;
              },
              text: 'Email',
              hint: 'iamdavid@gmail.com',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormFeild(
              onChange: (value) {
                password = value!;
              },
              text: 'Password',
              hint: '************',
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
              onPress: onPress,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
