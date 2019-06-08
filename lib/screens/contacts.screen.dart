import 'package:desafio_picpay_mobile/bloc/contacts.bloc.dart';
import 'package:desafio_picpay_mobile/bloc/payment.bloc.dart';
import 'package:desafio_picpay_mobile/bloc/provider.dart';
import 'package:desafio_picpay_mobile/components/contact_box.component.dart';
import 'package:desafio_picpay_mobile/models/contact.model.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  ContactsBloc _contactsBloc;
  PaymentBloc _paymentBloc;
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();

  @override
  void didChangeDependencies() {
    _contactsBloc ??= Provider.of(context).contactsBloc..getAllContacts();
    _paymentBloc ??= Provider.of(context).paymentBloc;
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1E20),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            height: 100,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text("Contatos", style: TextStyle(fontSize: 18, color: Colors.white),),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[800],
              ),
              child: Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  onChanged: _contactsBloc.filterContacts,
                  controller: editingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    prefixStyle: TextStyle(
                      color: Colors.grey[50],
                      decorationColor: Colors.red,
                    ),
                    labelText: "A quem você deseja pagar?",
                    labelStyle: TextStyle(
                      color: Colors.grey[50],
                    ),
                  ),
                  cursorRadius: Radius.circular(15),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
              ),
            ),
          ),
          StreamBuilder<List<Contact>>(
            stream: _contactsBloc.filteredContacts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int i) => ContactBoxComponent(snapshot.data[i], _contactsBloc),
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            }
          ),
        ],
      ),
    );
  }
}