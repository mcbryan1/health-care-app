import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class MeetingHeader extends StatefulWidget {
  MeetingHeader({Key key}) : super(key: key);

  @override
  _MeetingHeaderState createState() => _MeetingHeaderState();
}

class _MeetingHeaderState extends State<MeetingHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Center(
                child: Text(
              'meetings',
              style: TextStyle(
                  fontSize: 20,
                  // fontFamily: 'Poppins-Regular',
                  color: kTextDarkerColor,
                  fontWeight: FontWeight.w600),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              'Tue' + ',' + ' ' + '12 Oct' + ' · ' + '09:00' + ' - ' + '10:00',
              style: TextStyle(
                  fontSize: 17,
                  // fontFamily: 'Poppins-Regular',
                  color: kTextLighterColor,
                  fontWeight: FontWeight.w600),
            )),
          ],
        ));
  }
}
