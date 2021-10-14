import 'package:bloc_project/features/onboarding/onboarding_page.dart';
import 'package:bloc_project/register/bloc/register_bloc.dart';
import 'package:bloc_project/register/flow/register_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    var newRoute;
    switch (settings.name) {
      case OnBoardingPage.route:
        newRoute = MaterialPageRoute(
          builder: (context) => const OnBoardingPage(),
        );
        break;
      case RegisterFlow.route:
        newRoute = MaterialPageRoute(
          builder: (context) => BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(),
            child: const RegisterFlow(),
          ),
        );
        break;
    }
    return newRoute;
  }
}
