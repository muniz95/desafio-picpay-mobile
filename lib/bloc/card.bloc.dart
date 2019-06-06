import 'package:desafio_picpay_mobile/models/card.model.dart';
import 'package:rxdart/rxdart.dart';

class CardBloc {
  BehaviorSubject<Card> _card = BehaviorSubject<Card>();
  Card get card => _card.stream.value;
  
  BehaviorSubject<int> _number = BehaviorSubject<int>();
  Function(int) get setNumber => _number.sink.add;
  
  BehaviorSubject<String> _titular = BehaviorSubject<String>();
  Function(String) get setTitular => _titular.sink.add;
  
  BehaviorSubject<String> _expiration = BehaviorSubject<String>();
  Stream<String> get expiration => _expiration.stream;
  Function(String) get setExpiration => _expiration.sink.add;
  
  BehaviorSubject<int> _cvv = BehaviorSubject<int>();
  Function(int) get setCvv => _cvv.sink.add;

  void addCard() {
    _card.add(
      Card(
        cvv: _cvv.value,
        expiration: _expiration.value,
        number: _number.value,
        titular: _titular.value,
      )
    );
  }

  void dispose() {
    _card.close();
    _number.close();
    _titular.close();
    _expiration.close();
    _cvv.close();
  }
}