import 'package:bytebank/components/progress.dart';
import 'package:bytebank/flutter-webapi-centered-message/centered_message.dart';
import 'package:bytebank/http/client.dart';
import 'package:bytebank/modelos/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body:
        FutureBuilder<List<Transaction>>(
          future: Future.delayed(Duration(seconds: 1)).then((value)=>findAll()),
          builder: (context, snapshot) {
            switch(snapshot.connectionState){
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                return Progress();
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:
                if(snapshot.hasData){
                  final List<Transaction> transactions = snapshot.data as List<Transaction>;
                  if(transactions.isNotEmpty){
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final Transaction transaction = transactions[index];
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.monetization_on),
                            title: Text(
                              transaction.value.toString(),
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              transaction.contact.accountNumber.toString(),
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: transactions.length,
                    );
                  }
                  return CenteredMessage(
                      'No transactions found',
                      icon: Icons.warning);
                }
            }
            return CenteredMessage(
                'Unknown Error',
                  icon: Icons.warning
            );
          }
        ),

    );
  }
}

