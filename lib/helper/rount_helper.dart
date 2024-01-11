
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vikn_codes_machin_test/src/view/sreens/home/home_screen.dart';
import 'package:vikn_codes_machin_test/src/view/sreens/login/login_screen.dart';
import 'package:vikn_codes_machin_test/src/view/sreens/splash/splash_screen.dart';

class RoutHelper{

  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static List<GetPage> routes = [

        GetPage(
        name: splash,
        page: () => SplashScreen(
          )),
            GetPage(
        name: home,
        page: () => HomeScreen(
          )),
               GetPage(
        name: login,
        page: () => LoginScreen(
          )),
   
  ];
}