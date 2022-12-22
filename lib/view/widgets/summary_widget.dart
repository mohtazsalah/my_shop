import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/constance.dart';
import 'package:my_shop/core/viewModel/cart_view_model.dart';
import 'package:my_shop/view/widgets/custom_text.dart';

class SummaryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Column(
          children: [
              SizedBox(height: 4,),
            Container(
              height: 300,
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index){
                    return Container(
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.shade100
                            ),
                            child: Container(
                              height: 180,
                              width: 150,
                              child: Image.network(
                                controller.cartProductList[index].image!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          CustomText(
                            text: controller.cartProductList[index].name!,
                            max: 1,
                            alignment: Alignment.bottomLeft,
                          ),
                          const SizedBox(height: 10,),
                          CustomText(
                            text: '\$ ${controller.cartProductList[index].price!}',
                            max: 1,
                            alignment: Alignment.bottomLeft,
                            color: primaryColor,
                          ),
                          const SizedBox(height: 10,),
                        ],
                      ),
                    );
                  },
                itemCount: controller.cartProductList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 20,);
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}