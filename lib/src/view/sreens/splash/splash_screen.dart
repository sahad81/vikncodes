import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vikn_codes_machin_test/helper/rount_helper.dart';
import 'package:vikn_codes_machin_test/src/controlls/authcontroller.dart';

import 'package:vikn_codes_machin_test/util/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
if (Get.find<AuthController>().isLoggedIn() ) {
  
Get.offAllNamed(RoutHelper.home);


}
else{
  Get.offAllNamed(RoutHelper.login);

}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'VIKS CODES',
        style: poppinsBold.copyWith(
            color: Theme.of(context).primaryColor, fontSize: 30),
      ),
    ));
  }
}
