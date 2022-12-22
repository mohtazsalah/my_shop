import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_shop/constance.dart';
import 'package:my_shop/core/viewModel/cart_view_model.dart';
import 'package:my_shop/view/check_out/check_out_view.dart';
import 'package:my_shop/view/widgets/custom_button.dart';
import 'package:my_shop/view/widgets/custom_text.dart';

class CardView extends StatelessWidget {
   CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: GetBuilder<CartViewModel>(
            init: Get.put(CartViewModel()),
            builder:(controller)=> Scaffold(
              body: controller.cartProductList.isEmpty
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/empty_cart.svg' , width: 200, height: 200,),
                  SizedBox(height: 30,),
                  CustomText(
                    text: 'Cart Empty',
                    fontSize: 30,
                    alignment: Alignment.center,
                  ),
                ],
              )
                  :Column(
                children: [
                  Expanded(
                    child: Container(
                        child: ListView.separated(
                              itemBuilder: (context , index){
                                return Container(
                                  padding: EdgeInsets.only(left: 30 , right: 30),
                                  height: 140,
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 140,
                                          child: Image.network(
                                              controller.cartProductList[index].image!,
                                            fit: BoxFit.fill,
                                          ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 30.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: controller.cartProductList[index].name!,
                                                fontSize: 22,
                                                max: 2,
                                              ),
                                              const SizedBox(height: 10,),
                                              CustomText(
                                                text: '\$ ${controller.cartProductList[index].price}',
                                                color: primaryColor,
                                              ),
                                              const SizedBox(height: 10,),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.grey.shade200,
                                                ),
                                                width: 140,
                                                height: 40,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.black,
                                                      ),
                                                      onTap: (){
                                                        controller.increaseQuantity(index);
                                                      },
                                                    ),
                                                    const SizedBox(width: 20,),
                                                    CustomText(
                                                      alignment: Alignment.center,
                                                      text: controller.cartProductList[index].quantity.toString(),
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                    ),
                                                    const SizedBox(width: 20,),
                                                    GestureDetector(
                                                      onTap: (){
                                                        controller.decreaseQuantity(index);
                                                      },
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(bottom: 20.0),
                                                        child: const Icon(
                                                            Icons.minimize,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            itemCount: controller.cartProductList.length,
                            separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(height: 15,);
                            },
                          ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0 ,top: 10, bottom: 10, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: 'TOTAL',
                              fontSize: 22,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10,),
                            GetBuilder<CartViewModel>(
                              init: CartViewModel(),
                              builder:(controller)=> CustomText(
                                text: '\$ ${controller.totalPrice}',
                                color: primaryColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        CustomButton(
                            text: 'CHECKOUT',
                            color: primaryColor,
                            onPress: (){
                              Get.to(CheckOutView());
                            },
                          width: 150,
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
