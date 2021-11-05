import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class sign_in_load extends StatefulWidget {
  const sign_in_load({Key? key}) : super(key: key);

  @override
  _sign_in_loadState createState() => _sign_in_loadState();
}

class _sign_in_loadState extends State<sign_in_load> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/list-email');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.cyan,
      child: Center(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
            child: Container(
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Icon(
                Icons.drafts_rounded,
                color: Colors.cyan,
                size: 100,
              ),
            ),
          ),
          const Text(
            'SignIn',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w100,
              color: Colors.white,
            ),
          ),
          const Text(
            'Speak, friend, end enter',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(top:150),
            child: SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
          )
        ]),
      ),
    ));
  }
}
