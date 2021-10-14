import 'package:bloc_project/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterNamePage extends StatelessWidget {
  const RegisterNamePage({Key? key, required this.name}) : super(key: key);
  final String name;

  static Page<dynamic> page({required String name}) =>
      MaterialPage(child: RegisterNamePage(name: name));

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chevron_right),
        onPressed: (){
          bloc.nextPage();
        },
      ),
      appBar: AppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.0,vertical: 16.0),
        child: Center(
          child: TextField(
            onChanged: (name) => bloc.updateRegister(name: name),
            controller: TextEditingController(text: name),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(hintText: 'Nome'),
          ),
        ),
      ),

    );
  }
}
