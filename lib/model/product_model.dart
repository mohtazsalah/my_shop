import 'package:flutter/material.dart';
import 'package:my_shop/helper/extenstion.dart';

class ProductModel {

  String? title , hint , image , price , size ;
  Color? color;
  ProductModel({this.title, this.hint, this.image, this.price, this.size, this.color});

  ProductModel.fromJson(Map<dynamic , dynamic> map){
    if(map == null){
      return;
    }
    title = map['title'];
    image = map['image'];
    hint = map['hint'];
    price = map['price'];
    size = map['size'];
    color = HexColor.fromHex(map['color']);
  }

  toJson(){
    return {
      'title' : title,
      'hint' : hint,
      'price' : price,
      'image' : image,
      'size' : size,
      'color' : color,
    };
  }
}