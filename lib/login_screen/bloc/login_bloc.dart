import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/login_screen/bloc/login_event.dart';
import 'package:hrms/login_screen/bloc/login_state.dart';
import 'package:hrms/login_screen/model/login_response.dart';
import 'package:hrms/main.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates>{
  LoginBloc() : super(LoginInitinalState());
  @override
  Stream<LoginStates> mapEventToState(LoginEvents event) async* {
    if(event is UserLoginEvent){
      yield LoginLoadingsState();
      yield* userLogin(event);
    }
   
  }

 Stream<LoginStates> userLogin(UserLoginEvent event) async* {
   LoginResponse response = await repository.login(event.input);
   yield LoginSuccessState(response: response);
 }
}