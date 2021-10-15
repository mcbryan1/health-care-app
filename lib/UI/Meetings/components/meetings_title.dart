import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class MeetingTitle extends StatelessWidget {
  const MeetingTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text('UPCOMING MEETINGS',
          style: TextStyle(
              // fontFamily: 'Poppins-Regular',
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: kTextLighterColor)),
    );
  }
}
