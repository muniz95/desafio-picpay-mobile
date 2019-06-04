import 'package:desafio_picpay_mobile/components/credit_card.component.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
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
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              CreditCardComponent(),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "Cadastre um cartão de crédito",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "Para fazer pagamentos para outras pessoas você precisa cadastrar um cartão de crédito pessoal.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}