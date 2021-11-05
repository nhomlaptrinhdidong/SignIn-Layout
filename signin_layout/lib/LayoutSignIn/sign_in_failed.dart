import 'package:flutter/material.dart';

class sign_in_failed extends StatefulWidget {
  const sign_in_failed({Key? key}) : super(key: key);

  @override
  _sign_in_failedState createState() => _sign_in_failedState();
}

class _sign_in_failedState extends State<sign_in_failed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                  child: Container(
                    padding: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.cyan,
                    ),
                    child: Icon(
                      Icons.no_accounts_sharp,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
                const Text(
                  'UPS...couldn`t Sign In',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Your UserName and password don`t match',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                const Text(
                  'Please try again',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                    color: Colors.black,
                  ),
                ),
                //Icon(Icons.crop_portrait_sharp),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('TRY AGAIN'),
                  style:
                      OutlinedButton.styleFrom(backgroundColor: Colors.black),
                ),
              ),
            ),
          ],
        ));
  }
}
