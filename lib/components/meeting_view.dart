import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class SingleMeetSchedule extends StatelessWidget {
  final String title;
  final String timeFrom;
  final String timeTo;
  final String day;
  final String trailing;
  final VoidCallback onRejoinTap;
  final Color color;
  final VoidCallback onMeetTap;
  const SingleMeetSchedule(
      {Key key,
      this.title,
      this.trailing,
      this.onRejoinTap,
      this.color,
      this.onMeetTap,
      this.timeFrom,
      this.timeTo,
      this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onMeetTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: kPrimaryLightColor),
                child: Icon(
                  Icons.calendar_today,
                  size: 18,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'meetings',
                    style: TextStyle(
                        fontSize: 15,
                        // fontFamily: 'Poppins-Regular',
                        color: kTextDarkerColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2),
                  Text(
                    day + ',' + ' ' + timeFrom + ' - ' + timeTo,
                    style: TextStyle(
                        fontSize: 14,
                        color: kTextLighterColor,
                        // fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: color ?? kPrimaryLightColor),
              child: GestureDetector(
                onTap: onRejoinTap,
                child: Text(trailing ?? '',
                    style: TextStyle(
                      fontSize: 14,
                    )),
              ))
        ],
      ),
    );
  }
}
