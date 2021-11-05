import 'package:flutter/material.dart';

class list_email extends StatefulWidget {
  const list_email({Key? key}) : super(key: key);

  @override
  _list_emailState createState() => _list_emailState();
}

class CheckBoxState {
  final String title;
  final IconData icon;
  final int num;
  bool value;
  CheckBoxState({
    required this.title,
    required this.icon,
    required this.num,
    this.value = false,
  });
}

int countMail = 1;
int countsf = 1;
int countCheck = 0;
class _list_emailState extends State<list_email> {
  final checkBoxMail = [
    CheckBoxState(
        title: 'All Inboxes', icon: Icons.all_inbox, num: countMail++),
    CheckBoxState(title: 'Icloud', icon: Icons.cloud, num: countMail++),
    CheckBoxState(title: 'Gmail', icon: Icons.mail, num: countMail++),
    CheckBoxState(
        title: 'Hotmail', icon: Icons.mark_email_unread, num: countMail++),
    CheckBoxState(
        title: 'Vip', icon: Icons.mark_email_read_sharp, num: countMail++),
  ];
  final specialFolders = [
    CheckBoxState(
        title: 'Secure', icon: Icons.security_rounded, num: countsf++),
    CheckBoxState(
        title: 'Notifications',
        icon: Icons.notification_important,
        num: countsf++),
  ];
  @override
  Widget build(BuildContext context) {
    Widget checkbox(CheckBoxState cbm) {
      return Row(
        children: [
          Checkbox(
              value: cbm.value,
              onChanged: (value) {
                if(value==true){
                  countCheck++;
                }
                else{
                  countCheck--;
                }
                setState(() {
                cbm.value = value!;
              });}),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      cbm.icon,
                      color: Colors.blue,
                    ),
                    title: Text(cbm.title),
                    trailing: Text(cbm.num.toString()),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Mailboxes'),
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.black,
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Done',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ))
        ],
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          titleSession('Mailboxes'),
          Column(
            children: [...checkBoxMail.map(checkbox).toList()],
          ),
          titleSession('Special folders'),
          Column(
            children: [...specialFolders.map(checkbox).toList()],
          ),   

          
        ],     
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
                children:[
                  Expanded(
                    child: OutlinedButton(onPressed: (){}, child: Row(
                      children: [
                        Expanded(child: Text('Delete',style: TextStyle(color: Colors.black),textAlign: TextAlign.center,)),
                        Text(countCheck.toString(),style: TextStyle(color: Colors.black))
                      ],
                    ),style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),)),
                    
                ]
              ),
      ),
    );
  }

  Row titleSession(String text) => Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.only(top: 26, left: 16),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ),
        ],
      );
}
