import 'package:flutter/material.dart';
import 'package:flutter_nduthi/Signup_page.dart';
import 'login_page.dart';
import 'Signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: SignupPage(),
    );
  }
}
