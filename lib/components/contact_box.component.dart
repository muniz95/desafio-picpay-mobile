import 'package:desafio_picpay_mobile/models/contact.model.dart';
import 'package:flutter/material.dart';

class ContactBoxComponent extends StatelessWidget {
  final Contact contact;
  
  ContactBoxComponent(this.contact);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Text(
        "Nome: ${contact.name}",
        style: TextStyle(
          color: Colors.white,
        ),
      )
    );
  }
}