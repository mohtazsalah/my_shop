import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/constance.dart';
import 'package:my_shop/core/viewModel/cart_view_model.dart';
import 'package:my_shop/helper/extenstion.dart';
import 'package:my_shop/model/cart_product_model.dart';
import 'package:my_shop/model/product_model.dart';
import 'package:my_shop/view/widgets/custom_button.dart';
import 'package:my_shop/view/widgets/custom_text.dart';

class DetailsScreen extends StatelessWidget {

  ProductModel? productModel;
  DetailsScreen({this.productModel , super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 290,
              child: Image.network(
                  productModel!.image!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: productModel!.title!,
                        fontSize: 26,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .43,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CustomText(
                                    text: 'Size',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CustomText(
                                    text: productModel!.size!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .43,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CustomText(
                                    text: 'Color',
                                  ),
                                ),
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                    color: productModel!.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      CustomText(
                        text: 'Details',
                        fontSize: 26,
                      ),
                      SizedBox(height: 15,),
                      CustomText(
                        text: '${productModel!.hint!}+${productModel!.hint!}',
                        height: 2.5,
                        max: productModel!.hint!.length,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GetBuilder<CartViewModel>(
              init: Get.put(CartViewModel()),
              builder:(controller)=> Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 20 , bottom: 20 , right: 40 , left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: 'PRICE',
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        CustomText(
                          text: productModel!.price!,
                          color: primaryColor,
                          fontSize: 18,
                        )
                      ],
                    ),
                    CustomButton(
                      text: 'ADD',
                      color: HexColor.fromHex('#00C569'),
                      width: 150,
                      radius: 5,
                      onPress: (){
                        controller.addProduct(
                          CartProductModel(
                            name: productModel!.title!,
                            image: productModel!.image!,
                            price: productModel!.price!,
                            quantity: 1,
                            productId: productModel!.productId!,
                          )
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
