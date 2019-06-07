import 'package:desafio_picpay_mobile/models/card.model.dart';
import 'package:desafio_picpay_mobile/models/contact.model.dart';
import 'package:desafio_picpay_mobile/models/transaction.model.dart';
import 'package:rxdart/rxdart.dart';

class PaymentBloc {
  BehaviorSubject<double> _payment = BehaviorSubject<double>.seeded(0);
  Stream<double> get payment => _payment.stream;
  Function(double) get setPayment => _payment.sink.add;
  
  BehaviorSubject<Transaction> _transaction = BehaviorSubject<Transaction>();
  Transaction get transaction => _transaction.stream.value;

  void createTransaction(Contact contact, Card card, double total) {
    _transaction.add(
      Transaction(
        id: 1000,
        card: card,
        contact: contact,
        doneAt: DateTime.now(),
        total: total,
      )
    );
  }

  void dispose() {
    _payment.close();
    _transaction.close();
  }
}