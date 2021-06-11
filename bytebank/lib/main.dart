import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: Scaffold(
            body: ListaTransferencias()
        ),
      );
  }
}
class FormularioTransferencia extends StatelessWidget{

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferencia'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo:'Número da Conta',
              dica: '0000'
          ),
          Editor(
              controlador: _controladorCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on
          ),
          ElevatedButton(
            onPressed: () => _criaTransferencia(context),
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {

    //debugPrint('Clicou em confirmar');
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if(numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Criando transferência');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(300, 1003)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(100, 3000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add), backgroundColor: Colors.pink,
          onPressed: () {
            final Future future = Navigator.push(context, MaterialPageRoute(builder: (context){
              return FormularioTransferencia();
            }));
            future.then((transferenciaRecebida){
              debugPrint('$transferenciaRecebida');
              debugPrint('Chegou no then do future');
            });
          },
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

class Editor extends StatelessWidget {

  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador,  this.rotulo,  this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
            fontSize: 24
        ),
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}



class Transferencia {
  final double valor;
  final int numero_conta;

  Transferencia(this.valor, this.numero_conta);

  @override
  String toString() {
    return 'Transferencia\n Valor: £$valor\n Numero da conta: $numero_conta';
  }
}