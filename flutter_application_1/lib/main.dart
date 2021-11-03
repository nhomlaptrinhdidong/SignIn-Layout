import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/sign_in_false.dart';

void main() {
  runApp(MyHomePage());
}

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: const Text('MyHomePage'))
          ],
        ),
      ),
    );
  }
}
