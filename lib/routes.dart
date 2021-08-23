import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/screens/spalsh_screen.dart';

var routes = {
  RouteConfig.home: (context) => HomeScreen(),
  RouteConfig.defaultRoute: (context) => SplashScreen(),
};

class RouteConfig {
  static final defaultRoute = "/";
  static final home = "home";
}
