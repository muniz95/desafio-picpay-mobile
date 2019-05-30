import 'package:desafio_picpay_mobile/models/contact.model.dart';
import 'package:rxdart/rxdart.dart';

class ContactsBloc {
  BehaviorSubject<List<Contact>> _contacts = BehaviorSubject<List<Contact>>();

  Stream<List<Contact>> get contacts => _contacts.stream;

  Future getAllContacts() async {
    await Future.delayed(Duration(seconds: 3));
    _contacts.add(<Contact>[
      Contact(id: 1001, name: "Eduardo Santos", img:"https://randomuser.me/api/portraits/men/9.jpg", username:"@eduardo.santos"),
      Contact(id: 1002, name: "Marina Coelho", img:"https://randomuser.me/api/portraits/women/37.jpg", username:"@marina.coelho"),
      Contact(id: 1003, name: "Márcia da Silva", img:"https://randomuser.me/api/portraits/women/57.jpg", username:"@marcia.silva"),
      Contact(id: 1004, name: "Fabrício Val", img:"https://randomuser.me/api/portraits/men/98.jpg", username:"@fabricio.val"),
      Contact(id: 1005, name: "Júlia Magalhães", img:"https://randomuser.me/api/portraits/women/44.jpg", username:"@julia.magalhaes"),
      Contact(id: 1006, name: "Luma Pereira", img:"https://randomuser.me/api/portraits/women/13.jpg", username:"@luma.pereira"),
      Contact(id: 1007, name: "Danilo Gonçalves", img:"https://randomuser.me/api/portraits/men/55.jpg", username:"@danilo.goncalves"),
      Contact(id: 1008, name: "Amanda Souza", img:"https://randomuser.me/api/portraits/women/59.jpg", username:"@amanda.souza"),
      Contact(id: 1009, name: "Suely Abreu", img:"https://randomuser.me/api/portraits/women/80.jpg", username:"@suely.abreu"),
      Contact(id: 1010, name: "Elizângela Moraes", img:"https://randomuser.me/api/portraits/women/10.jpg", username:"@elizangela.moraes")
    ]);
  }

  void dispose() {
    _contacts.close();
  }
}