import 'package:desafio_picpay_mobile/models/transaction.model.dart';
import 'package:flutter/material.dart';

class PaymentBottomSheet extends StatelessWidget {
  final Transaction transaction;

  const PaymentBottomSheet({Key key, this.transaction}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      alignment: Alignment.center,
      color: const Color(0xFF1D1E20),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "-",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(
              "Recibo",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                transaction.contact.img
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10),
            child: Text(
              transaction.contact.username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10),
            child: Text(
              transaction.date,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "Transação: ${transaction.id}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          Divider(
            color: Colors.white,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Cartão ${transaction.card.flagship} ${transaction.card.finalDigits}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${transaction.total.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total pago",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${transaction.total.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}