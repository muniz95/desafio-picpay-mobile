import 'package:flutter/material.dart';

class PaymentBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      alignment: Alignment.center,
      color: const Color(0xFF1D1E20),
      child: Text(
        "Dados",
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}