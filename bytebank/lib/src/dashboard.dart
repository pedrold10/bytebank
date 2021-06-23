import 'package:bytebank/src/transactions_list.dart';
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
              Container(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _FeatureItem(
                      'Transferir',
                      Icons.monetization_on,
                      onClick: () {
                        _showContactsList(context);
                      },
                    ),
                    _FeatureItem(
                      'Histórico de transações',
                      Icons.description,
                      onClick: () {
                        _showTransactionsList(context);
                      },
                    ),
                   /* _FeatureItem(
                      'Contatos',
                      Icons.account_circle_rounded,
                      onClick: () {
                        print('transactios');
                      },
                    ),*/
                  ],
                ),
              ),
            ]
        )
    );
  }


}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  _FeatureItem(this.name, this.icon, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.pink[900],
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
              padding: EdgeInsets.all(8.0),
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

void _showContactsList(BuildContext context){
    Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ContactsList(),
    ),
  );
}

void _showTransactionsList(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => TransactionsList(),
    ),
  );
}