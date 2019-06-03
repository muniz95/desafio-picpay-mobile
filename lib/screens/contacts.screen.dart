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
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();

  @override
  void initState() {
    super.initState();
    _bloc = ContactsBloc()..getAllContacts();
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _bloc.filterContacts,
              controller: editingController,
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0))
                )
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          StreamBuilder<List<Contact>>(
            stream: _bloc.filteredContacts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
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