import 'package:bloc_project/register/bloc/register_bloc.dart';
import 'package:bloc_project/register/models/register.dart';
import 'package:bloc_project/register/pages/register_email_page.dart';
import 'package:bloc_project/register/pages/register_name_page.dart';
import 'package:bloc_project/register/pages/register_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterFlow extends StatelessWidget {
  const RegisterFlow({Key? key}) : super(key: key);

  static const String route = '/register';

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<RegisterBloc>(context);
    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterCompletedFlowState) {
            Navigator.pop(context, bloc.register);
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          bloc: bloc,
          builder: (context, state) {
            return Navigator(
              pages: pages(bloc, state),
              onPopPage: (route, result) {
                bloc.previousPage();
                return route.didPop(result);
              },
            );
          },
        ));
  }
}

List<Page<dynamic>> pages(RegisterBloc bloc, RegisterState state) {
  final List<Page<dynamic>> list = [];
  final namePage = RegisterNamePage.page(name: bloc.register.name ?? '');
  final emailPage = RegisterEmailPage.page(email: bloc.register.email ?? '');
  final passwordPage = RegisterPasswordPage.page();

  if (state is RegisterNamePageState) {
    list.add(namePage);
  }

  if (state is RegisterEmailPageState) {
    list.addAll([namePage, emailPage]);
  }

  if (state is RegisterPasswordPageState) {
    list.addAll([namePage, emailPage, passwordPage]);
  }

  return list;
}
