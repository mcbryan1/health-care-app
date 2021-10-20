import 'package:flutter/material.dart';
import 'package:gmeet/UI/Payments/components/visa_payment.dart';
import 'package:gmeet/constants.dart';

class AddNewPayment extends StatefulWidget {
  AddNewPayment({Key key}) : super(key: key);

  @override
  _AddNewPaymentState createState() => _AddNewPaymentState();
}

class _AddNewPaymentState extends State<AddNewPayment> {
  void visaPayment() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VisaPayment()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Add a new payment method to your ooyo account',
            style: TextStyle(fontSize: 16, fontFamily: 'Product Sans'),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: visaPayment,
            leading: Icon(Icons.credit_card, size: 20, color: kTextDarkerColor),
            title: Text('Add credit or debit card',
                style: TextStyle(fontSize: 16, fontFamily: 'Product Sans')),
          ),
          ListTile(
            leading:
                Icon(Icons.phone_android, size: 20, color: kTextDarkerColor),
            title: Text('Add mobile money number',
                style: TextStyle(fontSize: 16, fontFamily: 'Product Sans')),
          ),
        ],
      ),
    );
  }
}
