import 'package:test_app/screens/home_screen/home_screen.dart';
import 'package:test_app/screens/select_language_screen.dart';
import 'package:test_app/screens/spalsh_screen.dart';

var routes = {
  RouteConfig.home: (context) => HomeScreen(),
  RouteConfig.defaultRoute: (context) => SplashScreen(),
  RouteConfig.selectlanguage: (context) => SelectLanguageScreen(),
};

class RouteConfig {
  static final defaultRoute = "/";
  static final home = "home";
  static final selectlanguage = "selectlanguage";
}
