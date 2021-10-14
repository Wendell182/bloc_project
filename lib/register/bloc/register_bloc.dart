import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/register/models/register.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterNamePageState(name: ''));

 Register _register = Register.empty();

  Register get register => _register;



  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterNextPage) {
     yield _nextPage()                ;
    }

    if (event is RegisterPreviousPage) {
      yield _previousPage();
    }

    if (event is RegisterUpdate) {
       _updateRegister(event);
    }

    if (event is RegisterCompleteFlow) {
     yield _completeFlow();
    }
  }

  void complete(){
    add(RegisterCompleteFlow());
  }

  RegisterState  _completeFlow() {
      return RegisterCompletedFlowState();
  }

  void updateRegister({
     String? name,
     String? email,
     String? password,
  })  {
    add(RegisterUpdate(name: name ?? '', email: email ?? '', password: password ?? ''));
  }

  _updateRegister(RegisterUpdate event){
    _register = _register.copyWith(
      email: event.email,
      name: event.name,
      password: event.password
    );
  }

  void nextPage() {
    add(RegisterNextPage());
  }


  RegisterState _nextPage() {
    var nextState;
    switch (state.runtimeType) {
      case RegisterNamePageState:
        nextState = RegisterEmailPageState(email: _register.email!);
        break;
      case RegisterEmailPageState:
        nextState = RegisterPasswordPageState();
        break;
    }
    return nextState;
  }

  void previousPage() {
    add(RegisterPreviousPage());
  }

  RegisterState _previousPage() {
    var previousState;
    switch (state.runtimeType) {
      case RegisterPasswordPageState:
        previousState =RegisterEmailPageState(email: _register.email!);
        break;
      case RegisterEmailPageState:
        previousState = RegisterNamePageState(name: _register.name!);
        break;
    }
    return previousState;
  }

}
