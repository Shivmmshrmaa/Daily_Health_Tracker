import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/homepage.dart';
import '../views/loginpage.dart';
import '../views/splashscreen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: home,
      page: () => Homepage(),
    ),
  ];
}
