// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

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
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 100, 30, 10),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            suffixIcon: Icon(Icons.crop_portrait_sharp, color: Colors.grey,),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      //Icon(Icons.crop_portrait_sharp),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                          child: 
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('SIGN IN'),
                            style: OutlinedButton.styleFrom(backgroundColor: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            
          ),
        ),
      ),
    );
  }
}