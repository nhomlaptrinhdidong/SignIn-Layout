import 'dart:math';

import 'package:flutter/material.dart';

class list_email extends StatefulWidget {
  const list_email({Key? key}) : super(key: key);

  @override
  _list_emailState createState() => _list_emailState();
}

class CheckBoxState {
  final String title;
  final IconData icon;
  int num = 0;
  bool value = false;
  CheckBoxState({
    required this.title,
    required this.icon,
    required this.num,
    this.value = false,
  });
}

int countMail = 1;
int countsf = 1;
var countCheckMail = [];
var countCheckNoti = [];
var rng = new Random();
var numMail = [rng.nextInt(9),rng.nextInt(9),rng.nextInt(9),rng.nextInt(9)];

class _list_emailState extends State<list_email> {

  final checkBoxMail = [
    CheckBoxState(
      title: 'Icloud',
      icon: Icons.cloud,
      num: numMail[0],
    ),
    CheckBoxState(
      title: 'Gmail',
      icon: Icons.mail,
      num: numMail[1],
    ),
    CheckBoxState(
      title: 'Hotmail',
      icon: Icons.mark_email_unread,
      num: numMail[2],
    ),
    CheckBoxState(
      title: 'Vip',
      icon: Icons.mark_email_read_sharp,
      num: numMail[3],
    ),
  ];
  final allCheckMail = CheckBoxState(
    title: 'All Inboxes',
    icon: Icons.all_inbox,
    num: 1,
  );
  final specialFolders = [
    CheckBoxState(
      title: 'Secure',
      icon: Icons.security_rounded,
      num: countsf++,
    ),
    CheckBoxState(
      title: 'Notifications',
      icon: Icons.notification_important,
      num: countsf++,
    ),
  ];
  CheckBoxState? cbm;
  @override
  Widget build(BuildContext context) {
    int numAllMail(){
      int all = 0;
      for(int i =0;i<numMail.length;i++){
        all +=numMail[i];
      }
      return all;
    }
    Widget checkbox(cbm) {
      return Row(
        children: [
          Checkbox(
              value: cbm.value,
              onChanged: (value) {
                cbm.value = value!;
                if (cbm.value == true) {
                  if (checkBoxMail.indexOf(cbm) != -1) {
                    countCheckMail.add(checkBoxMail.indexOf(cbm));
                  }
                  if (specialFolders.indexOf(cbm) != -1) {
                    countCheckNoti.add(specialFolders.indexOf(cbm));
                  }
                } else {
                  countCheckMail.remove(checkBoxMail.indexOf(cbm));
                  countCheckNoti.remove(specialFolders.indexOf(cbm));
                }
                if (countCheckMail.length == checkBoxMail.length) {
                  allCheckMail.value = true;
                } else {
                  allCheckMail.value = false;
                }
                setState(() {});
              }),
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

    Widget allCheckboxMail(CheckBoxState acb) {
      return Row(
        children: [
          Checkbox(value: acb.value, onChanged: checkAllMail),
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
                      acb.icon,
                      color: Colors.blue,
                    ),
                    title: Text(acb.title),
                    trailing: Text(numAllMail().toString()),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget deleteButton() {
      return Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(children: [
          Expanded(
              child: OutlinedButton(
            onPressed: () {
              deleteSingel();

              setState(() {});
            },
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                )),
                Text((countCheckMail.length + countCheckNoti.length).toString(),
                    style: const TextStyle(color: Colors.black))
              ],
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
          )),
        ]),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Mailboxes'),
          backgroundColor: Colors.grey[100],
          foregroundColor: Colors.black,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Done',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ))
          ],
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: [
            titleSession('Mailboxes'),
            Column(
              children: [
                allCheckboxMail(allCheckMail),
                ...checkBoxMail.map(checkbox).toList()
              ],
            ),
            titleSession('Special folders'),
            Column(
              children: [...specialFolders.map(checkbox).toList()],
            ),
          ],
        ),
        floatingActionButton: deleteButton());
  }

  void deleteSingel() {
    if (countCheckMail.length > 0) {
      countCheckMail.sort();
      numMail.sort();

      for (int i = 0; i < countCheckMail.length; i++) {
        if (i == 0) {
          numMail.removeAt(countCheckMail[i]);
          checkBoxMail.removeAt(countCheckMail[i]);
        } else {
          numMail.removeAt(countCheckMail[i]-i);
          checkBoxMail.removeAt(countCheckMail[i] - i);
        }
      }
    }
    if (countCheckNoti.length > 0) {
      for (int i = 0; i < countCheckNoti.length; i++) {
        if (i == 0) {
          specialFolders.removeAt(countCheckNoti[i]);
        } else {
          specialFolders.removeAt(countCheckNoti[i] - 1);
        }
      }
    }
    countCheckMail = [];
    countCheckNoti = [];
  }

  void checkAllMail(bool? value) {
    if (value == null) return;
    setState(() {
      allCheckMail.value = value;
      if (allCheckMail.value == true) {
        countCheckMail=[];
        for (int i = 0; i < checkBoxMail.length; i++) {
          countCheckMail.add(i);
        }
      } else {
        for (int i = 0; i < checkBoxMail.length; i++) {
          countCheckMail.remove(i);
        }
      }
      checkBoxMail.forEach((allCheckMail) {
        allCheckMail.value = value;
      });
    });
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
