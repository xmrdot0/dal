import 'package:bloc/bloc.dart';
import 'package:dal/models/auth/i_auth/i_auth_facade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.iAuthFacade) : super(LoginInitial());
  IAuthFacade iAuthFacade;
  static LoginCubit get(context){
    return BlocProvider.of(context);
  }

  void signInPressed(
      {@required String? email, @required String? password}) async {
    emit(LoginLoadingState());
    try {
      await iAuthFacade.signInWithEmailAndPassword(email, password);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState());
    }
  }
}
