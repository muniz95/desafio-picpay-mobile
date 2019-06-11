import 'package:desafio_picpay_mobile/bloc/provider.dart';
import 'package:desafio_picpay_mobile/screens/contacts.screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: ContactsScreen(),
      ),
    );
  }
}
