import 'package:dal/presentation/landing/landing_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'dal',
      home: LandingScreen(),
  
    );
  }
}