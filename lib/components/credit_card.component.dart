import 'package:flutter/material.dart';

class CreditCardComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      alignment: Alignment.center,
      child: Container(
        width: 120,
        height: 90,
        decoration: BoxDecoration(
          color: Color(0XFF048BBB),
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.1, 0.9],
            colors: [
              Color(0XFF3ACBFF),
              Color(0XFF048BBB),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 25,
              height: 20,
              margin: EdgeInsets.only(right: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.green,
                  ),
                  VerticalDivider(
                    color: Colors.red,
                  ),
                  IntrinsicWidth(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(color: Colors.red,)
                        ),
                        Expanded(
                          child: Container(color: Colors.red,)
                        ),
                        Expanded(
                          child: Container(color: Colors.red,)
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 15),
              child: Text(
                "__ __ __ __ ___",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  height: 0.5
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}