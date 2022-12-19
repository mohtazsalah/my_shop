import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_shop/core/services/home_services.dart';
import 'package:my_shop/model/category_model.dart';
import 'package:my_shop/model/product_model.dart';

class HomeViewModel extends GetxController{

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CategoryModel> get categoryList => _categoryList;
  List<CategoryModel> _categoryList = [];

  List<ProductModel> _productsList = [];
  List<ProductModel> get productsList => _productsList;

  HomeViewModel(){
    getCategory();
    getProduct();
  }

  getCategory() async {
    _loading.value = true ;
    HomeService().getCategory().then((value){
      for(int i = 0 ; i < value.length ; i++){
        _categoryList.add(CategoryModel.fromJson(value[i].data()as Map<dynamic , dynamic>));
      }
      print(_categoryList.length);
      update();
      _loading.value = false ;
    });
  }

  getProduct() async {
    _loading.value = true ;
    HomeService().getProducts().then((value){
      for(int i = 0 ; i < value.length ; i++){
        _productsList.add(ProductModel.fromJson(value[i].data()as Map));
      }
      print(_productsList.length);
      update();
      _loading.value = false ;
    });
  }

}
