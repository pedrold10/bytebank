import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  //const Progress({Key? key}) : super(key: key);
  final String message;

  Progress({this.message = 'Loading'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            color: Colors.pink[900],
          ),
          Text('\nCarregando')
        ],
      ),
    );
  }
}
