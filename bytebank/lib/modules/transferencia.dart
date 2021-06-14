class Transferencia {
  final double valor;
  final int numero_conta;

  Transferencia(
      this.valor,
      this.numero_conta
      );

  @override
  String toString() {
    return 'Transferencia\n Valor: £$valor\n Numero da conta: $numero_conta';
  }
}