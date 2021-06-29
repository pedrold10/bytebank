import 'dart:convert';
import 'package:bytebank/modelos/contact.dart';
import 'package:bytebank/modelos/transaction.dart';
import 'package:http/http.dart';

import '../client.dart';

class TransactionWebClient{
  Future<List<Transaction>> findAll() async {
    final Response response = await client
        .get(baseUrl)
        .timeout(Duration(seconds: 5));
    List<Transaction> transactions = _toTransactions(response);
    return transactions;
  }

  List<Transaction> _toTransactions(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = [];
    for (Map<String, dynamic> transactionJson in decodedJson) {
      transactions.add(Transaction.fromJson(transactionJson));
    }
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(baseUrl, headers: {
      'Content-type': 'application/json',
      'password': '1000'
    }, body: transactionJson);
    Map<String, dynamic> json = jsonDecode(response.body);
    return _toTransaction(json);
  }

  Transaction _toTransaction(Map<String, dynamic> json) {
    final Map<String, dynamic> contactJson = json['contact'];
    return Transaction.fromJson(json);
  }
}