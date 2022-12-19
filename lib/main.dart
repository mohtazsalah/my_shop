import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/helper/binding.dart';
import 'package:my_shop/view/auth/loginscreen.dart';
import 'package:my_shop/view/control_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ControlView(),
      ),
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
      ),
    );
  }
}