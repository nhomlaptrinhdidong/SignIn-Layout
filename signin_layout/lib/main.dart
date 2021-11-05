import 'package:flutter/material.dart';
import 'package:signin_layout/LayoutSignIn/sign_in.dart';
import 'package:signin_layout/LayoutSignIn/load.dart';
import 'package:signin_layout/LayoutSignIn/sign_in_failed.dart';
import 'LayoutSignIn/list_email.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => const sign_in(),
        '/load': (context) => const sign_in_load(),
        '/list-email': (context) => const list_email(),
        '/sign_in_failed': (context) => const sign_in_failed(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}



