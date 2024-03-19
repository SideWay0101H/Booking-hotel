import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:booking_hotel_ui/pages/ForgotandReset/ResetPage.dart';
import 'package:booking_hotel_ui/pages/auth/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
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

  Widget _btnForgotpassword() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const ResetPage()),
                  (route) => true);
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: const Center(
                child: Text(
                  'Gửi',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.roboto,
                      fontSize: 18),
                ),
              ),
            )));
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
              fontFamily: FontFamily.roboto, fontSize: 15, color: Colors.white),
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
  }

  Widget _buildBackbutton() {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildBackbutton(),
                      SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Quên mật khẩu',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontFamily.roboto,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 100),
                      _buildEmailTF(),
                    ],
                  ),
                  _btnForgotpassword()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
