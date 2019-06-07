import 'package:desafio_picpay_mobile/models/card.model.dart';
import 'package:desafio_picpay_mobile/models/contact.model.dart';

class Transaction {
  final int id;
  final Contact contact;
  final Card card;
  final DateTime doneAt;
  final double total;

  Transaction({this.id, this.contact, this.card, this.doneAt, this.total});
}