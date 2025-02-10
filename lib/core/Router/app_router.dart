import 'routes.dart';
import '../services/API/consumers/dio_consumer.dart';
import '../../features/authentication/presentation/cubit/auth_cubit.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/update/presentation/cubit/update_profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/authentication/presentation/screens/sign_in_screen.dart';
import '../../features/authentication/presentation/screens/sign_up_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/update/presentation/screens/update_data_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    AuthCubit authCubit = AuthCubit(apiConsumer: DioConsumer(dio: Dio()));
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      HomeCubit(apiConsumer: DioConsumer(dio: Dio())),
                  child: const HomeScreen(),
                ));
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => authCubit,
                  child: const SignInScreen(),
                ));
      case Routes.register:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => authCubit, child: const SignUpScreen()));
      case Routes.updateProfile:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      UpdateProfileCubit(apiConsumer: DioConsumer(dio: Dio())),
                  child: const UpdateDataScreen(),
                ));
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
