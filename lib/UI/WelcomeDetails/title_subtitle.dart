import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OOYO Health',
              style: TextStyle(
                  fontSize: 30,
                  color: kTextDarkerColor,
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'A healthy lifestyle starts with a healthy diet.',
              style: TextStyle(
                fontSize: 15,
                color: kTextLighterColor,
                fontFamily: 'Product Sans',
              ),
            ),
          ],
        ));
  }
}
