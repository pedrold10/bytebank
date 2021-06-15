import 'package:bytebank/screens/transferencias/lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.pink[700],
          accentColor: Colors.pink[500],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.pink[500],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home:  ListaTransferencias()
      );
  }
}








