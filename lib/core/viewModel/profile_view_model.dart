import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_shop/helper/local_storage_data.dart';
import 'package:my_shop/model/user_model.dart';
import 'package:my_shop/view/auth/loginscreen.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  UserModel? get userModel => _userModel;
  UserModel? _userModel ;

  void getCurrentUser() async{
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value;
    });
    _loading.value = false;
    update();
  }

  Future<void> signOut () async {
    _loading.value = true;
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
    _loading.value = false;
    Get.offAll(LoginScreen());
  }

}