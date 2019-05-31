import 'package:desafio_picpay_mobile/models/contact.model.dart';
import 'package:desafio_picpay_mobile/services/contacts.service.dart';
import 'package:rxdart/rxdart.dart';

class ContactsBloc {
  final ContactsService _service = ContactsService();

  BehaviorSubject<List<Contact>> _contacts = BehaviorSubject<List<Contact>>();

  Stream<List<Contact>> get contacts => _contacts.stream;

  Future getAllContacts() async {
    _contacts.add(await _service.getAllContacts());
  }

  void dispose() {
    _contacts.close();
  }
}