import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/modelos/contact.dart';
import 'package:flutter/material.dart';

import 'contact_form.dart';

class ContactsList extends StatelessWidget {
  //const ContactsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //contacts.add(Contact(0, 'Pedro', 1000));
    //contacts.add(Contact(0, 'Pedro', 1000));
    //contacts.add(Contact(0, 'Pedro', 1000));
    //contacts.add(Contact(0, 'Pedro', 1000));
    //contacts.add(Contact(0, 'Pedro', 1000));

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 0)).then((value)=>findAll()),
        builder: (context, snapshot) {
          final List<Contact> contacts = snapshot.data as List<Contact>;
          if(snapshot!=null){
            return ListView.builder(
              itemBuilder: (context, index) {
                final Contact contact = contacts[index];
                return _ContactItem(contact);
              },
              itemCount: contacts.length,
            );
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then(
                (newContact) => debugPrint(newContact.toString()),
              );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink[900],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(
        contact.name,
        style: TextStyle(fontSize: 16.0),
      ),
      subtitle: Text(contact.accountNumber.toString()),
    ));
  }
}
