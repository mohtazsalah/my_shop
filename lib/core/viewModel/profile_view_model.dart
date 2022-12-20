import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_shop/helper/local_storage_data.dart';
import 'package:my_shop/view/auth/loginscreen.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  Future<void> signOut () async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
    Get.offAll(LoginScreen());
  }
}