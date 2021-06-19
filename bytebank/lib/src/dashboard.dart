import 'package:flutter/material.dart';
import 'contacts_list.dart';

class Dashboard extends StatelessWidget {
  //const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          backgroundColor: Colors.pink[900],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/bytebank_logo.png'),
              ),
              Row(
                children: [
                  _FeatureItem('Transferir', Icons.monetization_on),
                  //_FeatureItem('Contatos', Icons.account_box),
                  _FeatureItem('Histórico de transações', Icons.description)
                ],
              ),
            ]));
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;

  _FeatureItem(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.pink[900],
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ContactsList()));
          },
          child: Container(
              padding: EdgeInsets.all(8.0),
              height: 100,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: Colors.white, size: 32.0),
                  Text(name,
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                ],
              )),
        ),
      ),
    );
  }
}
