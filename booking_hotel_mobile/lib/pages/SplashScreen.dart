import 'package:flutter/material.dart';

class SplashSrceen extends StatefulWidget {
  const SplashSrceen({super.key});

  @override
  State<SplashSrceen> createState() => _SplashSrceenState();
}

class _SplashSrceenState extends State<SplashSrceen> {
  @override
  void initState() {
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome() async {
    // await Future.delayed(const Duration(milliseconds: 1500), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            height: 100,width: 100,color: Colors.blue,
          ),
          const Text(
            'Splash Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ],
        ),
      ),
    );
  }
}
