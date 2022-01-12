import 'package:equatable/equatable.dart';

class LoginEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class UserLoginEvent extends LoginEvents {
  final Map input;
  UserLoginEvent({ this.input});
   @override
  List<Object> get props => [input];
}
