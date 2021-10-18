import 'package:flutter/material.dart';
import 'package:gmeet/components/button.dart';
import 'package:gmeet/constants.dart';

class VisaPayment extends StatefulWidget {
  VisaPayment({Key key}) : super(key: key);

  @override
  _VisaPaymentState createState() => _VisaPaymentState();
}

class _VisaPaymentState extends State<VisaPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          splashRadius: 20,
        ),
        title: Text(
          "Add Credit Card",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Product Sans',
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                // height: _validate ? 50 : 72,
                child: TextField(
                  autofocus: true,
                  textAlignVertical: TextAlignVertical.center,
                  autocorrect: false,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    labelText: "Add Debit or Credit Card",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: kPrimaryColor,
                      width: 1,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: kPrimaryColor,
                      width: 1,
                    )),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.red[800],
                      width: 1,
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        textAlignVertical: TextAlignVertical.center,
                        autocorrect: false,
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                          labelText: "Enter Expiry Date",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: kPrimaryColor,
                            width: 1,
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: kPrimaryColor,
                            width: 1,
                          )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.red[800],
                            width: 1,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        textAlignVertical: TextAlignVertical.center,
                        autocorrect: false,
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                          labelText: "Add Debit or Credit Card",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: kPrimaryColor,
                            width: 1,
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: kPrimaryColor,
                            width: 1,
                          )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.red[800],
                            width: 1,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: MainButton(
                  title: "Add",
                  onPressed: () {},
                  color: kPrimaryColor,
                  textColor: Colors.white,
                  height: 60,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
