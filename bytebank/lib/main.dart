import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: Scaffold(
            body: FormularioTransferencia()
        ),
      );
  }
}
class FormularioTransferencia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferencia'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24
              ),
              decoration: InputDecoration(
                labelText: 'Número da Conta',
                hintText: '0000'
              ),
              keyboardType: TextInputType.number,
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                style: TextStyle(
                    fontSize: 24
                ),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Valor da transferência',
                    hintText: '0.00'
                ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(onPressed: onPressed, child: Text('Confirmar'))
        ],
      ),
    );
  }
}


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(300, 1003)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(100, 3000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        child: Icon(Icons.add, ), backgroundColor: Colors.deepPurple,
      ),
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