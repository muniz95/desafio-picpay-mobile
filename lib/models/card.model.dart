class Card {
  final int number;
  final String titular;
  final DateTime expiration;
  final String flagship;
  final int cvv;

  String get finalDigits => number.toString().substring(12, 16);

  Card({this.number, this.titular, this.expiration, this.flagship, this.cvv});
}