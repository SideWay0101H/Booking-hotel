import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ConfirmPasswordController =
      TextEditingController();

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
            controller: _emailController,
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

  Widget _buildFullnameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Họ và tên',
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
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
                color: Colors.white, fontFamily: FontFamily.roboto),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.account_box,
                  color: Colors.white,
                ),
                hintText: 'Nhập họ và tên của bạn',
                hintStyle: TextStyle(
                    fontSize: 13,
                    fontFamily: FontFamily.roboto,
                    color: Colors.white)),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mật khẩu',
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
                  Color(0x0ff3aef5),
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
              _validatorPassword(value!);
            },
            controller: _passwordController,
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
  }

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mật khẩu',
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
                  Color(0x0ff3aef5),
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
              _validatorPassword(value!);
            },
            controller: _passwordController,
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
                hintText: 'Nhập mật khẩu xác nhận của bạn',
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

  Widget _btnRegister() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: const Center(
            child: Text(
              'Đăng Ký',
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
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
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildBackbutton(),
                    const Spacer(),
                    const Text(
                      'Đăng ký tài khoản',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontFamily.roboto,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer()
                  ],
                ),
                Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildFullnameTF(),
                      const SizedBox(height: 20),
                      _buildEmailTF(),
                      const SizedBox(height: 20),
                      _buildPasswordTF(),
                      const SizedBox(height: 20),
                      _buildConfirmPasswordTF(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                _btnRegister(),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
