import 'package:bloc_project/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPasswordPage extends StatelessWidget {
  const RegisterPasswordPage({Key? key,}) : super(key: key);

  static Page<dynamic> page() =>
      const MaterialPage(child: RegisterPasswordPage());

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: (){
          bloc.complete();
        },
      ),
      appBar: AppBar(),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 16.0),
        child: Center(
          child: TextField(
            onChanged:(password) => bloc.updateRegister(password: password),
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(hintText: 'Senha'),
          ),
        ),
      ),

    );
  }
}
