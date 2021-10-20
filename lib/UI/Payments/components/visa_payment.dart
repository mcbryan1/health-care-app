import 'package:flutter/material.dart';
import 'package:gmeet/UI/Meetings/meetings.dart';
import 'package:gmeet/components/button.dart';
import 'package:gmeet/constants.dart';

class VisaPayment extends StatefulWidget {
  VisaPayment({Key key}) : super(key: key);

  @override
  _VisaPaymentState createState() => _VisaPaymentState();
}

class _VisaPaymentState extends State<VisaPayment> {
  var _ifCardNumberEntered = false;
  var _ifCardHolderNameEntered = false;

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
            MaterialPageRoute(builder: (context) => Meetings());
          },
          splashRadius: 20,
        ),
        title: Text(
          "Add credit or debit card",
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
                child: TextField(
                  maxLength: 16,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textAlignVertical: TextAlignVertical.center,
                  autocorrect: false,
                  cursorColor: kPrimaryColor,
                  onChanged: (val) {
                    setState(() {
                      if (val.length == 16)
                        _ifCardNumberEntered = true;
                      else
                        _ifCardNumberEntered = false;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Add debit or credit Card",
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
              _ifCardNumberEntered
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              autofocus: true,
                              textAlignVertical: TextAlignVertical.center,
                              autocorrect: false,
                              cursorColor: kPrimaryColor,
                              decoration: InputDecoration(
                                hintText: "MM/YY",
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
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              textAlignVertical: TextAlignVertical.center,
                              autocorrect: false,
                              cursorColor: kPrimaryColor,
                              decoration: InputDecoration(
                                hintText: "CVV",
                                labelText: "CVV",
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
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              _ifCardNumberEntered
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      // height: _validate ? 50 : 72,
                      child: TextField(
                        autofocus: true,
                        textAlignVertical: TextAlignVertical.center,
                        autocorrect: false,
                        cursorColor: kPrimaryColor,
                        onChanged: (val) {
                          setState(() {
                            if (val.isNotEmpty)
                              _ifCardHolderNameEntered = true;
                            else
                              _ifCardHolderNameEntered = false;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Card Holder Name",
                          labelText: "Card holder name",
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
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              _ifCardHolderNameEntered
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: MainButton(
                        title: "Add",
                        onPressed: () {},
                        color: kPrimaryColor,
                        textColor: Colors.white,
                        height: 60,
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
