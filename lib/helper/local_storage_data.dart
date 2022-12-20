import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_shop/constance.dart';
import 'package:my_shop/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController{

  Future<UserModel?> get getUser async {
   try{
     UserModel userModel = await _getUserData();
     if(userModel == null){
       return null;
     }
     return userModel ;
   }catch(e){
     print(e.toString());
     return null;
   }
  }

  _getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getString(CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }

  setUser(UserModel userModel) async{
    SharedPreferences preference = await SharedPreferences.getInstance();

    await preference.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  void deleteUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}