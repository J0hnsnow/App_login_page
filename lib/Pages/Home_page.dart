// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_nduthi/Pages/Signup_page.dart';
import 'package:flutter_nduthi/Pages/auth_page.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_nduthi/Pages/Main_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainPage();
            } else {
              return MainPage();
            }
          }),
    );
  }
}
