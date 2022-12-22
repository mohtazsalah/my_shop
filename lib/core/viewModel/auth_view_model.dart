import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_shop/core/services/firestore_user.dart';
import 'package:my_shop/helper/local_storage_data.dart';
import 'package:my_shop/model/user_model.dart';
import 'package:my_shop/view/control_view.dart';

class AuthViewModel extends GetxController {

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

  final LocalStorageData localStorageData = Get.find();
  late String email;
  late String password;
  String? name;


  Rxn<User?> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null){
      getCurrentUserData(_auth.currentUser?.uid);
    }
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
    Get.offAll(ControlView());
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
      Get.offAll(ControlView());
    }on FirebaseException catch(e) {
    print(e.message!);
    Get.snackbar('Error with Login', e.message! , colorText: Colors.black ,
    snackPosition: SnackPosition.BOTTOM , duration: Duration(seconds: 5));
    }

  }
  }

  void signInWithEmailAndPassword() async {
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) async {
          getCurrentUserData(value.user?.uid);
          // await FireStoreUser().getCurrentUser(value.user?.uid).then((value) {
          //   setUser(UserModel.fromJson(value.data()as Map));
          // });
        });
        Get.offAll(ControlView());
      }on FirebaseException catch(e) {
        Get.snackbar('Error with Login', e.message! , colorText: Colors.black ,
        snackPosition: SnackPosition.BOTTOM , duration: Duration(seconds: 5));
      }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((user) async{
        saveUser(user);
      });

      Get.offAll(ControlView());
    }on FirebaseException catch(e) {
      print(e.message!);
      Get.snackbar('Error with Login', e.message! , colorText: Colors.black ,
          snackPosition: SnackPosition.BOTTOM , duration: Duration(seconds: 5));
    }
  }


  void saveUser(UserCredential user) async{
    UserModel userModel = UserModel(
      userEmail: user.user!.email,
      userId: user.user!.uid,
      userName: name ?? user.user!.displayName,
      userPic: '',
    );
    await FireStoreUser().addToFireStore(userModel);
    setUser(userModel);
  }

  void getCurrentUserData(String? uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data()as Map));
    });
  }

  setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}