import 'dart:convert';

import 'package:dio/dio.dart';

class PaymentService {
  Dio client;

  PaymentService() {
    this.client = Dio();
    client.options.headers = {"content-type": "application/json"};
  }
  
  // Future<Map<String, dynamic>> addTransaction() async {
  //   final response = await client.post(
  //     'http://careers.picpay.com/tests/mobdev/transaction',
  //     data: {  
  //       "card_number":"1111111111111111",
  //       "cvv":789,
  //       "value":79.9,
  //       "expiry_date":"01/18",
  //       "destination_user_id":1002
  //     }
  //   );
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.data);
  //     List<Contact> contacts = data
  //       .cast<Map<String, dynamic>>()
  //       .map(Contact.fromJsonStatic)
  //       .toList()
  //       .cast<Contact>();
  //     return contacts;
  //   } else {
  //     throw Exception;
  //   }
  // }
}