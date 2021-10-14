import 'package:bloc_project/register/flow/register_flow.dart';
import 'package:bloc_project/register/models/register.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  var _register = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
           Expanded(
            child: Center(child: Text(_register))
          ),
          Padding(
              padding:
                   EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 48.0,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Entrar'),
                    ),
                  ),
                   SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 48.0,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () async {
                       var register = await Navigator.pushNamed(context, RegisterFlow.route);
                       if(register is Register){
                         setState(() {
                           _register = register.toString();
                         });
                       }

                      },
                      child:  Text('Registrar'),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
