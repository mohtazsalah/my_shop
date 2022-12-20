import 'package:flutter/material.dart';
import 'package:my_shop/helper/extenstion.dart';

class ProductModel {

  String? title , hint , image , price , size ,productId;
  Color? color;
  ProductModel({this.title, this.hint, this.image, this.price, this.size, this.color , this.productId});

  ProductModel.fromJson(Map<dynamic , dynamic> map){
    if(map == null){
      return;
    }
    title = map['title'];
    image = map['image'];
    hint = map['hint'];
    price = map['price'];
    size = map['size'];
    productId = map['productId'];
    color = HexColor.fromHex(map['color']);
  }

  toJson(){
    return {
      'title' : title,
      'hint' : hint,
      'price' : price,
      'image' : image,
      'size' : size,
      'productId' : productId ,
      'color' : color,
    };
  }
}