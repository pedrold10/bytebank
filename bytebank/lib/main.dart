import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: ListaTransferencias(),
      appBar: AppBar(title: Text('Transferências'), backgroundColor: Colors.deepPurple,),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        child: Icon(Icons.add, ), backgroundColor: Colors.deepPurple,
      ),
    ),
  )
);


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTransferencia(Transferencia(300, 1003)),
        ItemTransferencia(Transferencia(200, 2000)),
        ItemTransferencia(Transferencia(100, 3000)),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget{

  final Transferencia _transferencia;
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(_transferencia.valor.toString()),
            subtitle: Text(_transferencia.numero_conta.toString())
        )
    );
  }
}

class Transferencia {
  final double valor;
  final int numero_conta;

  Transferencia(this.valor, this.numero_conta);
}