import 'package:bloc_project/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterEmailPage extends StatelessWidget {
  const RegisterEmailPage({Key? key, required this.email}) : super(key: key);
  final String email;

  static Page<dynamic> page({required String email}) =>
      MaterialPage(child: RegisterEmailPage(email: email));

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_right),
        onPressed: (){
          bloc.nextPage();

        },
      ),
      appBar: AppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.0,vertical: 16.0),
        child: Center(
          child: TextField(
            onChanged: (email) => bloc.updateRegister(email: email) ,
            controller: TextEditingController(text: email),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
        ),
      ),

    );
  }
}
