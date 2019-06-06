import 'package:desafio_picpay_mobile/bloc/card.bloc.dart';
import 'package:desafio_picpay_mobile/bloc/contacts.bloc.dart';
import 'package:desafio_picpay_mobile/bloc/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  CardBloc _cardBloc;
  ContactsBloc _contactsBloc;

  @override
  void didChangeDependencies() {
    _cardBloc ??= Provider.of(context).cardBloc;
    _contactsBloc ??= Provider.of(context).contactsBloc;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1E20),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.green
        ),
      ),
      backgroundColor: const Color(0xFF1D1E20),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                _contactsBloc.selectedContact.img
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10),
            child: Text(
              _contactsBloc.selectedContact.username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: TextStyle(
                fontSize: 42,
                color: Colors.grey,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _cardBloc.card.number.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  child: Text(
                    " . ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Editar"),
                  color: Colors.red,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
              alignment: Alignment.bottomCenter,
              child: ButtonTheme(
                height: 50,
                minWidth: double.infinity,
                child: FlatButton(
                  onPressed: () {
                    print("aehOOOOOOOO");
                  },
                  color: Colors.green,
                  child: Text("Pagar"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}