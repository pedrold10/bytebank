import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/src/contact_form.dart';
import 'package:bytebank/src/contacts_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'modelos/contact.dart';
import 'src/dashboard.dart';

void main() {
  runApp(MyApp());
  save(Contact(0, 'Pedro', 1000)).then((id){
    findAll().then((contacts)=> debugPrint(contacts.toString()));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard()
    );
  }
}


