import 'package:desafio_picpay_mobile/models/card.model.dart';
import 'package:desafio_picpay_mobile/models/contact.model.dart';
import 'package:desafio_picpay_mobile/models/transaction.model.dart';
import 'package:desafio_picpay_mobile/services/payment.service.dart';
import 'package:rxdart/rxdart.dart';

class PaymentBloc {
  final PaymentService _service = PaymentService();

  BehaviorSubject<double> _payment = BehaviorSubject<double>.seeded(0);
  Stream<double> get payment => _payment.stream;
  Function(double) get setPayment => _payment.sink.add;
  
  BehaviorSubject<Transaction> _transaction = BehaviorSubject<Transaction>();
  Transaction get transaction => _transaction.stream.value;

  void createTransaction(Contact contact, Card card, double total) {
    _service
      .addTransaction(contact, card, total)
      .then((Transaction result) {
        Transaction t = Transaction(
          card: card,
          contact: contact,
          doneAt: result.doneAt,
          id: result.id,
          total: result.total
        );
        _transaction.add(t);
      });
  }

  void clearTransaction() => _transaction.add(null);

  void dispose() {
    _payment.close();
    _transaction.close();
  }
}