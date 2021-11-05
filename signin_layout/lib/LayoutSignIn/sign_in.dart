import 'package:flutter/material.dart';

class sign_in extends StatefulWidget {
  const sign_in({Key? key}) : super(key: key);

  @override
  _sign_inState createState() => _sign_inState();
}
class _sign_inState extends State<sign_in> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
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
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 100, 30, 10),
                      child: TextField(
                        controller: email,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          suffixIcon: Icon(
                            Icons.crop_portrait_sharp,
                            color: Colors.grey,
                          ),
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
                        controller: password,
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
                            child: OutlinedButton(
                              onPressed: () {
                                if(email.text==""||password.text==""){
                                  String mess;
                                  if(email.text==""){
                                    mess ='Vui lòng nhập email!!!';
                                  } else {
                                    mess ='Vui lòng nhập pasword!!!';
                                  }
                                  
                                  showDialog(context: context, builder: (BuildContext builder)
                                    {
                                      return AlertDialog(content: Text(mess),
                                        title: Text('Thông báo'),
                                        actions: [
                                          TextButton(onPressed: (){
                                            Navigator.pop(context);
                                          }, child: Text('Tắt'))
                                        ],
                                        shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(2.0))));
                                    }
                                  );
                                }
                                else if(email.text==password.text){
                                  Navigator.pushNamed(context, '/load');
                                }
                                else if(email.text!=password.text){
                                  Navigator.pushNamed(context, '/sign_in_failed');
                                }
                               
                              },
                              child: Text('SIGN IN'),
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
