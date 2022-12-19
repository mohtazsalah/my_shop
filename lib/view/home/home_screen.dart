import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/constance.dart';
import 'package:my_shop/core/viewModel/home_view_model.dart';
import 'package:my_shop/view/details/details_screen.dart';
import 'package:my_shop/view/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.put(HomeViewModel()),
      builder:(controller) => controller.loading.value ?
      Center(child: CircularProgressIndicator(color: Colors.blue,))
          :Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0 , left: 20 , right: 20),
              child: Column(
                children: [
                  _searchTextFormField(),
                  const SizedBox(height: 30,),
                  CustomText(text: 'Category',),
                  const SizedBox(height: 30,),
                  _listViewCategory(),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Best Selling',
                        fontSize: 18,
                      ),
                      CustomText(
                        text: 'See all',
                        fontSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  _listViewProduct(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search , color: Colors.black,),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder:(controller)=> Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryList[index].image!),
                  ),
                ),
                const SizedBox(height: 10,),
                CustomText(
                  text: controller.categoryList[index].name!,
                ),
              ],
            );
          }, separatorBuilder: (context, index) => const SizedBox(width: 20,),
        ),
      ),
    );
  }

  Widget _listViewProduct() {
    return GetBuilder<HomeViewModel>(
      builder:(controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
            return GestureDetector(
              onTap: (){
                Get.to(() => DetailsScreen(productModel: controller.productsList[index],));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100
                      ),
                      child: Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image.network(
                            controller.productsList[index].image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    CustomText(
                      text: controller.productsList[index].title!,
                      max: 2,
                      alignment: Alignment.bottomLeft,
                    ),
                    const SizedBox(height: 10,),
                    CustomText(
                      text: controller.productsList[index].hint!,
                      max: 2,
                      alignment: Alignment.bottomLeft,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10,),
                    CustomText(
                      text: controller.productsList[index].price!,
                      max: 1,
                      alignment: Alignment.bottomLeft,
                      color: primaryColor,
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            );
          }, separatorBuilder: (context, index) => const SizedBox(width: 20,),
        ),
      ),
    );
  }
}