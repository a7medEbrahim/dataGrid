import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/ui/screens/home_screen.dart';

class Routes {
  static const String Home = '/';
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.Home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => Text('Not Found'));
    }
  }
}
