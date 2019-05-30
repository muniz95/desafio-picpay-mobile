import 'package:desafio_picpay_mobile/bloc/contacts.bloc.dart';
import 'package:desafio_picpay_mobile/components/contact_box.component.dart';
import 'package:desafio_picpay_mobile/models/contact.model.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  ContactsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ContactsBloc()..getAllContacts();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          StreamBuilder<List<Contact>>(
            stream: _bloc.contacts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int i) => ContactBoxComponent(snapshot.data[i]),
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