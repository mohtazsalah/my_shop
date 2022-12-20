import 'package:flutter/material.dart';
import 'package:my_shop/constance.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.color = primaryColor,
    required this.onPress,
    this.width = 200,
    this.radius = 10,
    this.height = 40,
  }) : super(key: key);

  final String text;
  final Color color;
  final Function() onPress;
  final double width;
  final double radius;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(radius),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: width,
          height: height,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
