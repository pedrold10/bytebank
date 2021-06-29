import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'http/client.dart';
import 'modelos/contact.dart';
import 'modelos/transaction.dart';
import 'src/dashboard.dart';
void main() {
  runApp(BytebankApp());
  save(Transaction(200.0, Contact(0, 'Carlos', 2000))).then((transaction)=>print(transaction));
  //findAll().then((transactions)=>print('new transactions ${transactions}'));
}
class BytebankApp extends StatelessWidget {
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


