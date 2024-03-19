import 'dart:developer';

import 'package:booking_hotel_ui/core/global.dart';
import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:booking_hotel_ui/pages/ForgotandReset/ForgotPage.dart';
import 'package:booking_hotel_ui/pages/Home/HomePage.dart';
import 'package:booking_hotel_ui/pages/auth/RegisterPage.dart';
import 'package:booking_hotel_ui/pages/auth/bloc/login/login_bloc.dart';
import 'package:booking_hotel_ui/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _rememberMe = false;

  bool _isHovered = false;

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email không được để trống';
    }

    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9.-_]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Định dạng email không đúng';
    }
    return null;
  }

  String? _validatorPassword(String value) {
    if (value.isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 kí tự';
    }
    return null;
  }

  void _submitForm() {
    // if (_formkey.currentState!.validate()) {
    String username = "";
    String password = "";

    // You can add your authentication logic here

    // For now, just print the username and password
    debugPrint('Username: $username, Password: $password');
    if (username == 'abc') {
      String token = Global.sharedServices.getStringValue("token");
      debugPrint('$token');
    }
    if (username == 'zzzzzin841@gmail.com') {
      //     "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZW1haWwiOiJ1c2VyMDJAZ21haWwuY29tIiwiaWF0IjoxNzAwNDg4NDU3fQ.zR4wtNNyCOzuZE2fvqf9oUw4y9NBPdAxiYqAVqmt10Y",
      // "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZW1haWwiOiJ1c2VyMDJAZ21haWwuY29tIiwiaWF0IjoxNzAwNDg4NDU3LCJleHAiOjE3MDEwOTMyNTd9.AC2YZKO8H-UGKrI0pwYNw0HgMy8p7aMcz6pR6S0Ormo"
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZW1haWwiOiJ1c2VyMDJAZ21haWwuY29tIiwiaWF0IjoxNzAwNDg4NDU3fQ.zR4wtNNyCOzuZE2fvqf9oUw4y9NBPdAxiYqAVqmt10Y";
      String refreshToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZW1haWwiOiJ1c2VyMDJAZ21haWwuY29tIiwiaWF0IjoxNzAwNDg4NDU3LCJleHAiOjE3MDEwOTMyNTd9.AC2YZKO8H-UGKrI0pwYNw0HgMy8p7aMcz6pR6S0Ormo";
      Global.sharedServices.setStringValue("token", token);
      Global.sharedServices.setStringValue("refresh_token", refreshToken);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => true);
    }
    // }
  }

  Widget _buildEmailTF() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Email',
              style: TextStyle(
                  fontFamily: FontFamily.roboto,
                  fontSize: 15,
                  color: Colors.white),
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0x0FF28384),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5)
                    ],
                  ),
                  border: Border.all(width: 0.2),
                  borderRadius: BorderRadius.circular(9)),
              height: 60.0,
              child: TextFormField(
                validator: (value) {
                  _validateEmail(value!);
                },
                controller: context.read<LoginBloc>().emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color: Colors.white, fontFamily: FontFamily.roboto),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: 'Nhập email của bạn',
                    hintStyle: TextStyle(
                        fontSize: 13,
                        fontFamily: FontFamily.roboto,
                        color: Colors.white)),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildPasswordTF() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mật khẩu',
              style: TextStyle(
                  fontFamily: FontFamily.roboto,
                  fontSize: 15,
                  color: Colors.white),
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0x0ff3aef5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                  ),
                  border: Border.all(width: 0.2),
                  borderRadius: BorderRadius.circular(9)),
              height: 60.0,
              child: TextFormField(
                validator: (value) {
                  _validatorPassword(value!);
                },
                controller: context.read<LoginBloc>().passController,
                obscureText: true,
                style: const TextStyle(
                    color: Colors.white, fontFamily: FontFamily.roboto),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintText: 'Nhập email của bạn',
                    hintStyle: TextStyle(
                        fontSize: 13,
                        fontFamily: FontFamily.roboto,
                        color: Colors.white)),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _btnForgotpasswordbtn() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 0.0),
      child: TextButton(
        onPressed: ()  {
          Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ForgotPage()),
          (route) => true);
        },
        child: const Text(
          'Quên mật khẩu?',
          style: TextStyle(color: Colors.white, fontFamily: FontFamily.roboto),
        ),
      ),
    );
  }

  Widget _buildRememberCheckBox() {
    return Container(
      height: 20.0,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          const Text(
            'Ghi nhớ',
            style: TextStyle(
                color: Colors.white,
                fontFamily: FontFamily.roboto,
                fontSize: 13),
          )
        ],
      ),
    );
  }

  Widget _buildSigninwithText() {
    return Column(
      children: [
        const Text(
          '---OR---',
          style: TextStyle(
              fontFamily: FontFamily.roboto, fontSize: 15, color: Colors.white),
        ),
        const SizedBox(height: 20),
        InkWell(
          onHover: (hovered) {
            setState(() {
              _isHovered = hovered;
            });
          },
          onTap: () => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
                (route) => true)
          },
          child: Container(
            decoration: BoxDecoration(
                color: _isHovered ? Colors.redAccent : Colors.transparent,
                borderRadius: BorderRadius.circular(5.0)),
            padding: const EdgeInsets.all(10.0),
            child: Text('Đăng ký tài khoản tại đây',
                style: TextStyle(
                    color: _isHovered ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.roboto)),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Sign in with',
          style: TextStyle(
              fontFamily: FontFamily.roboto, fontSize: 15, color: Colors.white),
        ),
      ],
    );
  }

  Widget _btnLogin() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          width: double.infinity,
          child: GestureDetector(
            onTap: () => context.read<LoginBloc>().onLoginButton(context),
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: const Center(
                child: Text(
                  'Đăng nhập',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.roboto,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Color(0x0ff3aef5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5)
                    ],
                        stops: [
                      0.1,
                      0.4,
                      0.7,
                      0.9
                    ])),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 120.0),
                  child: Column(
                    children: [
                      const Text(
                        'Đăng nhập',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontFamily.roboto,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Form(
                        child: Column(children: [
                          const SizedBox(height: 30),
                          _buildEmailTF(),
                          const SizedBox(height: 30),
                          _buildPasswordTF(),
                        ]),
                      ),
                      _btnForgotpasswordbtn(),
                      _buildRememberCheckBox(),
                      _btnLogin(),
                      _buildSigninwithText(),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          _buttonLoginFaceBook(),
                          const SizedBox(width: 20),
                          _buttonLoginGithub(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }

  Widget _buttonLoginFaceBook() {
    return Expanded(
      child: Container(
        height: 50,
        // margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.blue,
        ),
        child: const Center(
          child: Text(
            'Facebook',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buttonLoginGithub() {
    return Expanded(
      child: Container(
        height: 50,
        // margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
            border: Border.all(width: 0.5)),
        child: const Center(
          child: Text(
            'Github',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
