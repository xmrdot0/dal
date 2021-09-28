import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dal/infrastructure/auth/firebase_auth_facade/firebase_auth_facade.dart';
import 'package:dal/state_management/auth/login_cubit/login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(
        FireBaseAuthFacade(FirebaseAuth.instance),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginFailureState) {
          FlushbarHelper.createError(message: state.errorText).show(context);
        }else if(state is LoginSuccessState ){
      Navigator.push(context,MaterialPageRoute(builder: (context) { return }));
        }
      }, builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Sign in Now',
                    style: TextStyle(fontSize: width * 0.12),
                  ),
                  Text(
                    'Please enter your information below in order to login to your account',
                    style: TextStyle(fontSize: width * 0.05),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty please shokran";
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      obscureText: loginCubit.isVisible!,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                loginCubit.changeVisibiltyPressed();
                              },
                              icon: Icon(Icons.visibility))),
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Email cannot be empty please shokran";
                        }
                      }),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginCubit.signInPressed(
                              email: 'yahia@ahmed.com', password: '123456');
                        }
                      },
                      child: Text("Sign in")),
                  state is LoginLoadingState
                      ? CircularProgressIndicator()
                      : SizedBox(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
