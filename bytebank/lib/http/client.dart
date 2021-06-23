import 'dart:convert';

import 'package:bytebank/modelos/contact.dart';
import 'package:bytebank/modelos/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request');
    print('url: ${data.url}');
    print("headers: ${data.headers}");
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print("headers: ${data.headers}");
    print('body: ${data.body}');
    return data;
  }
}

void findAll() async {
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response =
      await client.get(Uri.http('192.168.0.122:8080', 'transactions'));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    Transaction(
        transactionJson['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['contact']['accountNumber'],
        )

    );
    transactions.add(transaction);
  }
  print('decoded json = $decodedJson');
}