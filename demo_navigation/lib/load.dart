import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Container(
          color: Colors.cyan,
          child: Center(
              child: Column(
                children: [
                  Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                    child: Container(
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100), 
                        color: Colors.white,
                          ),
                          child: Icon(Icons.drafts_rounded, color: Colors.cyan, size: 100,),
                        ),
                      ),
                  const Text('SignIn',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  ),
                  const Text('Speak, friend, end enter', style: TextStyle(color: Colors.black),),
                  // Container(
                  //   padding: EdgeInsets.only(top: 200),
                  //   child: Icon(Icons.wc, color: Colors.white, size: 50,),
                  //),
              ]
            ),
          ),
        ),
      ),
    );
  }
}