part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginPasswordVisibilityONState extends LoginState {}

class LoginPasswordVisibilityOFFState extends LoginState {}
