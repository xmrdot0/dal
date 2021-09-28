import 'package:bloc/bloc.dart';
import 'package:dal/models/auth/i_auth/i_auth_facade.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.iAuthFacade) : super(LoginInitial());
  IAuthFacade iAuthFacade;
  bool? isVisible = false;
  static get(context) {
    return BlocProvider.of<LoginCubit>(context);
  }

  void signInPressed(
      {@required String? email, @required String? password}) async {
    emit(LoginLoadingState());
    try {
      await iAuthFacade.signInWithEmailAndPassword(email, password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailureState(e.code));
    } catch (e) {
      emit(LoginFailureState("UnKnown Error"));
    }
  }

  void changeVisibiltyPressed() {
    isVisible = !isVisible!;

    emit(LoginPasswordVisibilityState());
  }
}
