import 'package:flutter/material.dart';
import 'package:gmeet/components/button.dart';
import 'package:gmeet/constants.dart';

class MobileMoney extends StatefulWidget {
  MobileMoney({Key key}) : super(key: key);

  @override
  _MobileMoneyState createState() => _MobileMoneyState();
}

class _MobileMoneyState extends State<MobileMoney> {
  var _ifMobileNumberEntered = false;
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
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              maxLength: 10,
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
              autocorrect: false,
              cursorColor: kPrimaryColor,
              onChanged: (val) {
                setState(() {
                  if (val.length == 10)
                    _ifMobileNumberEntered = true;
                  else
                    _ifMobileNumberEntered = false;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your mobile number',
                labelText: "Enter Mobile Money Number",
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
          _ifMobileNumberEntered
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
    );
  }
}
