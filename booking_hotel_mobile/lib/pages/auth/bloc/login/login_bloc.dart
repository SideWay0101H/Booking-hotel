import 'dart:convert';
import 'dart:developer';

import 'package:booking_hotel_ui/core/global.dart';
import 'package:booking_hotel_ui/core/url.dart';
import 'package:booking_hotel_ui/pages/Home/HomePage.dart';
import 'package:booking_hotel_ui/pages/auth/bloc/login/login_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState());

  Dio dio = Dio();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void onLoginButton(BuildContext context) async {
    final result = await login(emailController.text, passController.text);
    if (result != null) {
      //TODO: di chuyển đến trang home
      debugPrint('thành công');
      Global.sharedServices.setStringValue("token", result.accessToken ?? "");
      Global.sharedServices
          .setStringValue("refresh_token", result.refreshToken ?? "");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => true);
    } else {
      // TODO: trả về lỗi
      debugPrint('lỗi');
    }
  }


    Future<LoginModel?> login(String email, String password) async {
    debugPrint('Username: $email, Password: $password');
    try {
      final response = await dio.post(
        '$baseUrl/v1/auth/login',
        data: {'email': email, 'password': password},
      );

      String jsonResponse = '''
    {
        "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJ1c2VyMDFAZ21haWwuY29tIiwiaWF0IjoxNzAxNDE4MzYwfQ.sz0PF-vXyTrO03p70kTERP54lGaacxFjd0Ia58JNSRE",
        "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJ1c2VyMDFAZ21haWwuY29tIiwiaWF0IjoxNzAxNDE4MzYwLCJleHAiOjE3MDIwMjMxNjB9.mCBjUuzAWsm6Dn0gy2s0DomgR7p-qO8vK4_iWyqHnfs"
    }
  ''';


   //   final jsonMap = json.decode(response.data);
       LoginModel data = LoginModel.fromJson(response.data);

       return data;

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

      

}
