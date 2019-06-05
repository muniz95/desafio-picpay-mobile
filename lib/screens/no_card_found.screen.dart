import 'package:desafio_picpay_mobile/components/credit_card.component.dart';
import 'package:desafio_picpay_mobile/screens/add_new_card.screen.dart';
import 'package:flutter/material.dart';

class NoCardFoundScreen extends StatefulWidget {
  @override
  _NoCardFoundScreenState createState() => _NoCardFoundScreenState();
}

class _NoCardFoundScreenState extends State<NoCardFoundScreen> {
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
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  alignment: Alignment.bottomCenter,
                  child: ButtonTheme(
                    height: 50,
                    minWidth: double.infinity,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => AddNewCardScreen()
                          ),
                        );
                      },
                      color: Colors.green,
                      child: Text("Adicionar um cartão"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}