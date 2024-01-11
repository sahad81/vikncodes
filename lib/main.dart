import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vikn_codes_machin_test/helper/rount_helper.dart';
import 'package:vikn_codes_machin_test/helper/get_di.dart' as di;
import 'package:vikn_codes_machin_test/src/view/sreens/splash/splash_screen.dart';
void main() {
   WidgetsFlutterBinding.ensureInitialized();
  di.init();
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        
      ),
   
    getPages: RoutHelper.routes,
    home:  const ScreenUtilInit(
        
              designSize: Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          child: SplashScreen(),
    ));
  }
}
