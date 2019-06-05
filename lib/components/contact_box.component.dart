import 'package:desafio_picpay_mobile/models/contact.model.dart';
import 'package:desafio_picpay_mobile/screens/no_card_found.screen.dart';
import 'package:flutter/material.dart';

class ContactBoxComponent extends StatelessWidget {
  final Contact contact;
  
  ContactBoxComponent(this.contact);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => NoCardFoundScreen(),
          )
        );
      },
      child: Container(
        height: 100,
        padding: EdgeInsets.only(left: 5, right: 5),
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: Center(
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    contact.img
                  ),
                ),
              ),
              VerticalDivider(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    contact.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Divider(
                    height: 5,
                  ),
                  Text(
                    contact.name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}