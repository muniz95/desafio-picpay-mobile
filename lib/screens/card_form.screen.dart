import 'package:desafio_picpay_mobile/bloc/card.bloc.dart';
import 'package:desafio_picpay_mobile/bloc/provider.dart';
import 'package:desafio_picpay_mobile/screens/payment.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardFormScreen extends StatefulWidget {
  @override
  _CardFormScreenState createState() => _CardFormScreenState();
}

class _CardFormScreenState extends State<CardFormScreen> {
  var _formKey = GlobalKey<FormState>();
  CardBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc ??= Provider.of(context).cardBloc;
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
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Cadastrar cartão",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                
              ),
              textAlign: TextAlign.start,
            ),
            Form(
              key: _formKey,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: TextFormField(
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          hintText: "Número do cartão",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green
                            )
                          )
                        ),
                        onSaved: (String val) {
                          _bloc.setNumber(int.parse(val));
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: TextFormField(
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          hintText: "Nome do titular",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green
                            )
                          )
                        ),
                        onSaved: (String val) {
                          _bloc.setTitular(val);
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Vencimento",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.green
                                  )
                                )
                              ),
                              onSaved: (String val) {
                                _bloc.setExpiration(DateTime.now());
                              },
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "CVV",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.green
                                  )
                                )
                              ),
                              onSaved: (String val) {
                                _bloc.setCvv(int.parse(val));
                              },
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
              alignment: Alignment.bottomCenter,
              child: ButtonTheme(
                height: 50,
                minWidth: double.infinity,
                child: FlatButton(
                  onPressed: () {
                    var formState = _formKey.currentState;
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    if (formState.validate()) {
                      formState.save();
                      _bloc.addCard();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => PaymentScreen()
                        ),
                      );
                    }
                  },
                  color: Colors.green,
                  child: Text("Salvar"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}