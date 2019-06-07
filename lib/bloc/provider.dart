import 'package:desafio_picpay_mobile/bloc/card.bloc.dart';
import 'package:desafio_picpay_mobile/bloc/contacts.bloc.dart';
import 'package:desafio_picpay_mobile/bloc/payment.bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final Widget child;
  final CardBloc cardBloc = CardBloc();
  final ContactsBloc contactsBloc = ContactsBloc();
  final PaymentBloc paymentBloc = PaymentBloc();

  Provider({this.child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(Provider);
  }
}