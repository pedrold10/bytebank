import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  //const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Pedro Gabriel', style: TextStyle(fontSize: 16.0),),
              subtitle: Text('1000'),
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.pink[900],
      ),
    );
  }
}
