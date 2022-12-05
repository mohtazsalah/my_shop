import 'package:flutter/material.dart';
import 'package:my_shop/view/widgets/custom_text.dart';

class CustomTextFormFeild extends StatelessWidget {

  final String? text ;
  final String? hint ;
  final Function(String? value) onChange;

  CustomTextFormFeild({
    this.text,
    this.hint,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text!,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onChange,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
