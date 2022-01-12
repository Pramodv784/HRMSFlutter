import 'package:equatable/equatable.dart';
import 'package:hrms/login_screen/model/login_response.dart';

class LoginStates extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitinalState extends LoginStates {}

class LoginLoadingsState extends LoginStates {}

class LoginSuccessState extends LoginStates {
final  LoginResponse response;
LoginSuccessState({ this.response});
 @override
  List<Object> get props => [response];

}

class LoginFailureState extends LoginStates {
  final  String message;
LoginFailureState({ this.message});
 @override
  List<Object> get props => [message];
}
