import 'package:desafio_picpay_mobile/models/card.model.dart';
import 'package:rxdart/rxdart.dart';

class CardBloc {
  BehaviorSubject<Card> _card = BehaviorSubject<Card>();
  Card get card => _card.stream.value;
  
  BehaviorSubject<String> _cardNumber = BehaviorSubject<String>();
  Function(String) get setNumber => _cardNumber.sink.add;
  
  BehaviorSubject<String> _titular = BehaviorSubject<String>();
  Function(String) get setTitular => _titular.sink.add;
  
  BehaviorSubject<DateTime> _expiration = BehaviorSubject<DateTime>();
  Stream<DateTime> get expiration => _expiration.stream;
  Function(DateTime) get setExpiration => _expiration.sink.add;
  
  BehaviorSubject<int> _cvv = BehaviorSubject<int>();
  Function(int) get setCvv => _cvv.sink.add;

  void addCard() {
    _card.add(
      Card(
        cvv: _cvv.value,
        expiration: _expiration.value,
        flagship: _getFlagship(_cardNumber.value),
        number: int.parse(_cardNumber.value.split(" ").join()),
        titular: _titular.value,
      )
    );
  }

  String _getFlagship(String cardNumber) {
    String firstDigit = cardNumber.substring(0, 1);
    switch (firstDigit) {
      case "2":
        return "Mastercard";
        break;
      case "3":
        return "American Express";
        break;
      case "4":
        return "Visa";
        break;
      case "5":
        return "Elo";
        break;
      case "6":
        return "Discover";
        break;
      default:
        return "N/A";
        break;
    }
  }

  void dispose() {
    _card.close();
    _cardNumber.close();
    _titular.close();
    _expiration.close();
    _cvv.close();
  }
}