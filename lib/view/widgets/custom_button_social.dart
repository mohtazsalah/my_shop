import 'package:flutter/material.dart';
import 'package:my_shop/view/widgets/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial({
    Key? key,
    required this.image,
    required this.text,
    required this.color,
    required this.onPress,
    this.width = 200,
    this.alignment = Alignment.topLeft
  }) : super(key: key);

  final String text;
  final String image;
  final Color color;
  final Function() onPress;
  final double width;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
          color: Colors.grey,
          width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(6),
          child: MaterialButton(
            onPressed: onPress,
            minWidth: width,
            height: 40,
            child: Row(
              children: [
                Image.asset(image),
                SizedBox(width: 80,),
                CustomText(
                  text: text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
