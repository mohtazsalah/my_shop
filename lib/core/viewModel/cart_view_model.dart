import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/core/services/database/cart_database_helper.dart';
import 'package:my_shop/model/cart_product_model.dart';

class CartViewModel extends GetxController{
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading ;

  List<CartProductModel> _cartProductList = [];
  double get totalPrice => _totalPrice ;
  double _totalPrice = 0.0 ;

  CartViewModel(){
    getAllProducts();
  }

  addProduct(CartProductModel cartProductModel) async {
    var dbHelper = CartDatabaseHelper.db;
      for (int i = 0; i < _cartProductList.length; i++) {
        if (_cartProductList[i].productId == cartProductModel.productId) {
          return;
        }
    }
    await dbHelper.insert(cartProductModel);
    getAllProducts();
    update();
  }

  getAllProducts () async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductList = await dbHelper.getAllProducts();
    _loading.value = false ;
    getTotalPrice();
    update();
  }

  getTotalPrice(){
    for(int i = 0 ; i < _cartProductList.length ; i++){
      double price = double.parse('${_cartProductList[i].price!}') ;
      _totalPrice += ( price * _cartProductList[i].quantity!);
      print('total is : $_totalPrice');
      update();
    }
  }

  increaseQuantity(int index) async {
    var dbHelper = CartDatabaseHelper.db;
    var qun = _cartProductList[index].quantity!;
    qun++;
    _cartProductList[index].quantity = qun;
    await dbHelper.updateProduct(_cartProductList[index]);
    getTotalPrice();
    update();
  }

  decreaseQuantity(int index) async{
    var dbHelper = CartDatabaseHelper.db;
    var qun = _cartProductList[index].quantity!;
    qun--;
    _cartProductList[index].quantity = qun;
    await dbHelper.updateProduct(_cartProductList[index]);
    getTotalPrice();
    update();
  }

  List<CartProductModel> get cartProductList => _cartProductList;

}