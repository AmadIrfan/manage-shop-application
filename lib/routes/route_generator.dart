import 'package:flutter/material.dart';
import '../Routes/route_name.dart';
import '../pages/home.dart';
import '../pages/login.dart';

class GenerateRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name)  {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No Route Found'),
            ),
          ),
        );
    }
  }
}
