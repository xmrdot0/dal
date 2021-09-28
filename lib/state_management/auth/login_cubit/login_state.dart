part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  String errorText;
  LoginFailureState(this.errorText);
}

class LoginLoadingState extends LoginState {}

class LoginPasswordVisibilityState extends LoginState {}
