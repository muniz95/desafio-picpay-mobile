import 'dart:convert';

import 'package:desafio_picpay_mobile/models/contact.model.dart';
import 'package:dio/dio.dart';

class ContactsService {
  Dio client;

  ContactsService() {
    this.client = Dio();
    client.options.headers = {"content-type": "application/json"};
  }
  
  Future<List<Contact>> getAllContacts() async {
    final response = await client.get('http://careers.picpay.com/tests/mobdev/users');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      List<Contact> contacts = data
        .cast<Map<String, dynamic>>()
        .map(Contact.fromJsonStatic)
        .toList()
        .cast<Contact>();
      return contacts;
    } else {
      throw Exception;
    }
  }
}