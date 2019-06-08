import 'package:desafio_picpay_mobile/models/card.model.dart';
import 'package:desafio_picpay_mobile/models/contact.model.dart';

class Transaction {
  final int id;
  final Contact contact;
  final Card card;
  final DateTime doneAt;
  final double total;

  String get day => doneAt.day > 9 ? "${doneAt.day}" : "0${doneAt.day}";
  String get month => doneAt.month > 9 ? "${doneAt.month}" : "0${doneAt.month}";
  String get year => doneAt.year > 9 ? "${doneAt.year}" : "0${doneAt.year}";
  String get hour => doneAt.hour > 9 ? "${doneAt.hour}" : "0${doneAt.hour}";
  String get minute => doneAt.minute > 9 ? "${doneAt.minute}" : "0${doneAt.minute}";

  String get date {
    return "$day/$month/$year às $hour:$minute";
  }

  Transaction({this.id, this.contact, this.card, this.doneAt, this.total});
}