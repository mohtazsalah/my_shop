import 'package:flutter/material.dart';
import 'package:my_shop/view/widgets/custom_text.dart';

class ProfileItem extends StatelessWidget {

  final String leftIcon;
  final String rightIcon;
  final String itemText;
  final Function() onTap;

  ProfileItem({
    this.leftIcon = '',
    this.rightIcon = '',
    required this.itemText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: CustomText(
          text: itemText,
        ),
        leading: Image.asset(
          'assets/images/$leftIcon',
        ),
        trailing: rightIcon.isEmpty ?
        Container(width: 5,
        height: 5,) : Image.asset(
            'assets/images/$rightIcon'
        ),
      ),
    );
  }
}
