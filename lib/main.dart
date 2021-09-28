import 'package:dal/presentation/core/my_app.dart';
import 'package:dal/state_management/auth/login_cubit/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
