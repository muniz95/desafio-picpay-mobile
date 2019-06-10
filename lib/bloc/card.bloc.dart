import 'package:desafio_picpay_mobile/models/card.model.dart';
import 'package:rxdart/rxdart.dart';

class CardBloc {
  BehaviorSubject<Card> _card = BehaviorSubject<Card>();
  Card get card => _card.stream.value;
  
  BehaviorSubject<String> _cardNumber = BehaviorSubject<String>.seeded("");
  String get number => _cardNumber.stream.value;
  Function(String) get setNumber => _cardNumber.sink.add;
  
  BehaviorSubject<String> _titular = BehaviorSubject<String>.seeded("");
  String get titular => _titular.stream.value;
  Function(String) get setTitular => _titular.sink.add;
  
  BehaviorSubject<String> _expiration = BehaviorSubject<String>();
  String get expiration => _expiration.stream.value;
  Function(String) get setExpiration => _expiration.sink.add;
  
  BehaviorSubject<String> _cvv = BehaviorSubject<String>();
  String get cvv => _cvv.stream.value;
  Function(String) get setCvv => _cvv.sink.add;

  void addCard() {
    _card.add(
      Card(
        cvv: int.parse(_cvv.value),
        expiration: _expiration.value,
        flagship: _getFlagship(_cardNumber.value),
        number: int.parse(_cardNumber.value.split(" ").join()),
        titular: _titular.value,
      )
    );
  }

  void selectCard() {
    _cvv.add(_card.value.cvv.toString());
    _expiration.add(_card.value.expiration);
    _cardNumber.add(_parseCardNumber(_card.value.number));
    _titular.add(_card.value.titular);
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

  String _parseCardNumber(int cardNumber) {
    return
      "$cardNumber".substring(0, 4) + " " +
      "$cardNumber".substring(4, 8) + " " +
      "$cardNumber".substring(8, 12) + " " +
      "$cardNumber".substring(12);
  }

  void dispose() {
    _card.close();
    _cardNumber.close();
    _titular.close();
    _expiration.close();
    _cvv.close();
  }
}