import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:booking_hotel_ui/core/global.dart';
import 'package:booking_hotel_ui/pages/auth/LoginPage.dart';
import 'package:booking_hotel_ui/pages/Home/HomePage.dart';
import 'package:booking_hotel_ui/routers/routes.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();
  await FlutterConfig.loadEnvVariables();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: RouterFluro.fluroRouter.generator,
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Icons.hotel,
          duration: 3000,
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: Colors.blue,
          nextScreen: const HomePage(),
        ));
  }
}
