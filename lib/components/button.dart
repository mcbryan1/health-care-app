import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final double height;
  const MainButton(
      {Key key,
      this.title,
      this.onPressed,
      this.color,
      this.textColor,
      this.borderColor,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: height ?? 45,
        child: MaterialButton(
          animationDuration: Duration(milliseconds: 5000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: borderColor ?? kPrimaryColor,
              width: .5,
            ),
          ),
          color: color,
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontFamily: 'Poppins-Regular',
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
