import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class PaymentList extends StatefulWidget {
  PaymentList({Key key}) : super(key: key);

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.payment,
              size: 20,
              color: kTextDarkerColor,
            ),
            title: Text('Visa-7157',
                style: TextStyle(fontSize: 16, fontFamily: 'Product Sans')),
          ),
          ListTile(
            leading:
                Icon(Icons.phone_android, size: 20, color: kTextDarkerColor),
            title: Text('MTN-MOMO',
                style: TextStyle(fontSize: 16, fontFamily: 'Product Sans')),
            subtitle: Text('+2338012345678',
                style: TextStyle(fontSize: 14, fontFamily: 'Product Sans')),
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
