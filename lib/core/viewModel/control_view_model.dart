import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/view/card_view.dart';
import 'package:my_shop/view/home/home_screen.dart';
import 'package:my_shop/view/profile_view.dart';

class ControlViewModel extends GetxController{
  Widget _currentScreen = HomeScreen();
  get currentScreen => _currentScreen;

  int _navigatorValue = 0 ;

  get navigatorValu => _navigatorValue;

  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch(selectedValue){
      case 0:
        _currentScreen = HomeScreen();
        break;
      case 1:
        _currentScreen = CardView();
        break;
      case 2:
        _currentScreen = ProfileView();
        break;
    }
    update();
  }
}