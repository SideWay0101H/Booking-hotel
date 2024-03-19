import 'package:booking_hotel_ui/pages/auth/LoginPage.dart';
import 'package:booking_hotel_ui/pages/auth/RegisterPage.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RouterFluro {
  static FluroRouter fluroRouter = FluroRouter();

  static var screenLoginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const LoginPage();
  });
  static var screenRegisterHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const RegisterPage();
  });
  static var screenHomePage = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const LoginPage();
  });

  static initRoutes() {
    fluroRouter.define("/login",handler: screenLoginHandler,transitionType: TransitionType.inFromLeft);
    fluroRouter.define("/register",handler: screenLoginHandler,transitionType: TransitionType.inFromRight);
  }
}
