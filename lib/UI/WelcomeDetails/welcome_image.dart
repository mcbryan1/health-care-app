import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.43,
      // width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(500),
      ),
    );
  }
}
