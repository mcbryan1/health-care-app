import 'package:flutter/material.dart';
import 'package:gmeet/UI/Payments/components/add_new_payment.dart';
import 'package:gmeet/UI/Payments/components/payment_list.dart';
import 'package:gmeet/constants.dart';

class PaymentsBody extends StatelessWidget {
  const PaymentsBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: kTextDarkerColor),
        title: Text('Payments methods',
            style:
                TextStyle(color: kTextDarkerColor, fontFamily: 'Product Sans')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [PaymentList(), SizedBox(height: 10), AddNewPayment()],
        ),
      ),
    );
  }
}
