import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_shop/core/services/firestore_user.dart';
import 'package:my_shop/model/user_model.dart';
import 'package:my_shop/view/home/home_screen.dart';

class AuthViewModel extends GetxController {

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

  late String email;
  late String password;
  String? name;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication authentication = await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );
    try{
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
    });
    Get.offAll(() => HomeScreen());
  }on FirebaseException catch(e) {
  print(e.message!);
  Get.snackbar('Error with Login', e.message! , colorText: Colors.black ,
  snackPosition: SnackPosition.BOTTOM , duration: Duration(seconds: 5));
  }

}

  void faceBookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(customPermissions: ['email']);
      final accessToken = result.accessToken!.token;
    if(result.status == FacebookLoginStatus.success){
      final faceCredential = FacebookAuthProvider.credential(accessToken);
      try{
      await _auth.signInWithCredential(faceCredential).then((user) async{
        saveUser(user);
      });
      Get.offAll(HomeScreen());
    }on FirebaseException catch(e) {
    print(e.message!);
    Get.snackbar('Error with Login', e.message! , colorText: Colors.black ,
    snackPosition: SnackPosition.BOTTOM , duration: Duration(seconds: 5));
    }

  }


    // final res = await _facebookLogin.logIn(permissions: [
    //   FacebookPermission.publicProfile,
    //   FacebookPermission.email,
    // ]);
    // switch (res.status) {
    //   case FacebookLoginStatus.success:
    //   // Logged in
    //     final faceCredential = FacebookAuthProvider.credential(res.accessToken!.token);
    //     UserCredential userCredential = await _auth.signInWithCredential(faceCredential);
    //     print(userCredential);
    //   // Send access token to server for validation and auth
    //     final FacebookAccessToken? accessToken = res.accessToken;
    //     print('Access token: ${accessToken!.token}');
    //
    //     // Get profile data
    //     final profile = await _facebookLogin.getUserProfile();
    //     print('Hello, ${profile!.name}! You ID: ${profile.userId}');
    //
    //     // Get user profile image url
    //     final imageUrl = await _facebookLogin.getProfileImageUrl(width: 100);
    //     print('Your profile image: $imageUrl');
    //
    //     // Get email (since we request email permission)
    //     final email = await _facebookLogin.getUserEmail();
    //     // But user can decline permission
    //     if (email != null)
    //       print('And your email is $email');
    //
    //     break;
    //   case FacebookLoginStatus.cancel:
    //   // User cancel log in
    //     break;
    //   case FacebookLoginStatus.error:
    //   // Log in failed
    //     print('Error while log in: ${res.error}');
    //     break;
    // }
    // FacebookLoginResult result = await _facebookLogin.logIn(permissions: [FacebookPermission.email]);
    // final accessToken = result.accessToken!.token;
    // if(result.status == FacebookLoginStatus.success){
    //   final faceCredential = FacebookAuthProvider.credential(accessToken);
    //   UserCredential userCredential = await _auth.signInWithCredential(faceCredential);
    //   print(userCredential);
    // }
  }

  void signInWithEmailAndPassword() async {
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) => {
          print(value)
        });
      }on FirebaseException catch(e) {
        Get.snackbar('Error with Login', e.message! , colorText: Colors.black ,
        snackPosition: SnackPosition.BOTTOM , duration: Duration(seconds: 5));
      }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) async{
        saveUser(user);
      });

      Get.offAll(HomeScreen());
    }on FirebaseException catch(e) {
      print(e.message!);
      Get.snackbar('Error with Login', e.message! , colorText: Colors.black ,
          snackPosition: SnackPosition.BOTTOM , duration: Duration(seconds: 5));
    }
  }


  void saveUser(UserCredential user) async{
    await FireStoreUser().addToFireStore(UserModel(
      userEmail: user.user!.email,
      userId: user.user!.uid,
      userName: name ?? user.user!.displayName,
      userPic: '',
    ));
  }
}