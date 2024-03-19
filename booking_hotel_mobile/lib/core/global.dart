import '../services/shared_preferences.dart';

class Global {
  static String session = "";
  static late SharedServices sharedServices;
  static Future init() async {
    sharedServices = await SharedServices().init();
  }
}
