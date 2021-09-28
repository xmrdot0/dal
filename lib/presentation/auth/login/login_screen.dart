import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          children: [
            Text(
              'Sign in Now',
              style: TextStyle(fontSize: width * 0.12),
            ),
            Text(
              'Please enter your information below in order to login to your account',
              style: TextStyle(fontSize: width * 0.05),
            ),
            TextFormField(),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(suffixIcon: Icon(Icons.visibility)),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Sign in"))
          ],
        ),
      ),
    );
  }
}
