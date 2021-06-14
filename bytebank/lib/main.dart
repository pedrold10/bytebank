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
          primaryColor: Colors.pink[400],
          accentColor: Colors.pink[200],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.pink[200],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home:  ListaTransferencias()
      );
  }
}








