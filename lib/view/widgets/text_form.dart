import 'package:flutter/material.dart';
import 'package:my_shop/view/widgets/custom_text.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    required this.hint,
    required this.onChange,
    required this.obscure,
    required this.type,
    required this.text,
    required this.fontSize
  }) : super(key: key);

  final String hint;
  final Function(String value) onChange;
  final bool obscure ;
  final TextInputType type ;
  final String text ;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        TextField(
          keyboardType: type,
          obscureText: obscure,
          onChanged: onChange,
          style: TextStyle(
            fontSize: fontSize,
          ),
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10),
          ),
        ),
      ],
    );
  }
}
