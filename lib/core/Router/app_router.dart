import 'package:api_mastering_task/core/Router/routes.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/view/screens/sign_in_screen.dart';
import '../../features/authentication/view/screens/sign_up_screen.dart';
import '../../features/home/view/screens/home_screen.dart';
import '../../features/update/view/screens/update_data_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.updateProfile:
        return MaterialPageRoute(builder: (_) => const UpdateDataScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
