
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_codes_machin_test/src/controlls/authcontroller.dart';
import 'package:vikn_codes_machin_test/src/controlls/home_controller.dart';

Future init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
 Get.lazyPut(() => AuthController(preferences: sharedPreferences)); 

 Get.lazyPut(() => HomeController(preferences: sharedPreferences)); 


}