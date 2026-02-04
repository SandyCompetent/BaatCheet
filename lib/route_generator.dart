import 'package:baatcheet/main.dart';
import 'package:flutter/material.dart';

import 'src/screen/conversation_screen.dart';
import 'src/screen/login_screen.dart';
import 'src/screen/splash_screen.dart';

const String splashRoute = '/Splash';
const String loginRoute = '/Login';
const String homeRoute = '/Home';
const String converRoute = '/Conversation';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case converRoute:
        return MaterialPageRoute(builder: (_) => ConversationScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(body: SizedBox(height: 0)));
    }
  }
}
