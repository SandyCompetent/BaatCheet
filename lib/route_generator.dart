import 'package:flutter/material.dart';
import 'package:flutter_master_template/main.dart';
import 'package:flutter_master_template/src/screen/conversation_screen.dart';
import 'package:flutter_master_template/src/screen/login_screen.dart';
import 'package:flutter_master_template/src/screen/splash_screen.dart';

const String splashRoute = '/Splash';
const String loginRoute = '/Login';
const String preRoute = '/Preference';
const String converRoute = '/Conversation';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case preRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case converRoute:
        return MaterialPageRoute(builder: (_) => ChatWindow());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(body: SizedBox(height: 0)));
    }
  }
}
