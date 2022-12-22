import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String text ;
  final double fontSize ;
  final Color color ;
  final Alignment alignment ;
  final int? max ;
  final double height;
  final FontWeight fontWeight;

  CustomText({
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.max,
    this.height = 0,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text,
        overflow: TextOverflow.ellipsis,
        maxLines: max,
        style: TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
