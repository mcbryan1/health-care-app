import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class JoinButton extends StatefulWidget {
  JoinButton({Key key}) : super(key: key);

  @override
  _JoinButtonState createState() => _JoinButtonState();
}

class _JoinButtonState extends State<JoinButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColor,
      ),
      // margin: EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              minimumSize: MaterialStateProperty.all(Size.zero),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              )),
          child: Text(
            "Ask to join",
            style: TextStyle(
              fontFamily: 'Product Sans',
              letterSpacing: 1,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
