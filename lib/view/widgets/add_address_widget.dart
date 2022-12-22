import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/view/widgets/custom_text.dart';
import 'package:my_shop/view/widgets/text_form.dart';

class AddAddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(height: 40,),
              CustomText(
                text: 'Billing address is the same as delivery address',
                fontSize: 20,
                alignment: Alignment.center,
                max: 2,
              ),
              SizedBox(height: 40,),
              CustomTextForm(
                  hint: '21, Alex Davidson Avenue',
                  onChange: (value){},
                  obscure: false,
                  type: TextInputType.text,
                  text: 'Street 1',
                  fontSize: 18,
              ),
              SizedBox(height: 40,),
              CustomTextForm(
                hint: 'Opposite Omegatron, Vicent Quarters',
                onChange: (value){},
                obscure: false,
                type: TextInputType.text,
                text: 'Street 2',
                fontSize: 18,
              ),
              SizedBox(height: 40,),
              CustomTextForm(
                hint: 'Victoria Island',
                onChange: (value){},
                obscure: false,
                type: TextInputType.text,
                text: 'City',
                fontSize: 18,
              ),
              SizedBox(height: 40,),
              Container(
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CustomTextForm(
                          hint: 'Lagos State',
                          onChange: (value){},
                          obscure: false,
                          type: TextInputType.text,
                          text: 'State',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CustomTextForm(
                          hint: 'Nigeria',
                          onChange: (value){},
                          obscure: false,
                          type: TextInputType.text,
                          text: 'Country',
                          fontSize: 18,
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
    );
  }
}