import 'package:flutter/material.dart';
import 'package:my_shop/constance.dart';
import 'package:my_shop/helper/enum.dart';
import 'package:my_shop/view/widgets/custom_text.dart';

class DeliveryTimeWidget extends StatelessWidget {
  Delivery delivery = Delivery.StandardDelivery;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          RadioListTile(
            title: CustomText(
              text: 'Standard Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: 'Order will be delivered between 3 - 5 business days',
              fontSize: 18,
              max: 2,
            ),
            activeColor: primaryColor,
            value: Delivery.StandardDelivery,
            groupValue: delivery,
            onChanged: (value){
              delivery = Delivery.StandardDelivery;
            },
          ),
          SizedBox(height: 20,),
          RadioListTile(
            title: CustomText(
              text: 'Next Day Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: 'Place your order before 6pm and your items will be delivered the next day',
              fontSize: 18,
              max: 2,
            ),
            activeColor: primaryColor,
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (value){
              delivery = Delivery.NextDayDelivery;
            },
          ),
          SizedBox(height: 20,),
          RadioListTile(
            title: CustomText(
              text: 'Nominated Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: 'Pick a particular date from the calendar and order will be delivered on selected date',
              fontSize: 18,
              max: 2,
            ),
            activeColor: primaryColor,
            value: Delivery.NominatedDelivery,
            groupValue: delivery,
            onChanged: (value){
              delivery = Delivery.NominatedDelivery;
            },
          ),
        ],
      ),
    );
  }
}