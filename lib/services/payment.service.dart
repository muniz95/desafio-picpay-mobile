import 'dart:convert';

import 'package:desafio_picpay_mobile/models/card.model.dart';
import 'package:desafio_picpay_mobile/models/contact.model.dart';
import 'package:desafio_picpay_mobile/models/transaction.model.dart';
import 'package:dio/dio.dart';

class PaymentService {
  Dio client;

  PaymentService() {
    this.client = Dio();
    client.options.headers = {"content-type": "application/json"};
  }
  
  Future<Transaction> addTransaction(Contact contact, Card card, double total) async {
    final response = await client.post(
      'http://careers.picpay.com/tests/mobdev/transaction',
      data: {  
        "card_number": card.number,
        "cvv": card.cvv,
        "value": total,
        "expiry_date": card.expiration,
        "destination_user_id": contact.id
      }
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      Transaction transaction = Transaction.fromJson(data['transaction']);
      return transaction;
    } else {
      throw Exception;
    }
  }
}