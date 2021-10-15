import 'package:flutter/material.dart';
import 'package:gmeet/UI/home.dart';
import 'package:gmeet/UI/meeting_code.dart';
import 'package:gmeet/components/button.dart';
import 'package:gmeet/constants.dart';

// import 'package:health_care_app/screens/Video/video_call.dart';

class MeetingsButtons extends StatefulWidget {
  MeetingsButtons({Key key}) : super(key: key);

  @override
  _MeetingsButtonsState createState() => _MeetingsButtonsState();
}

class _MeetingsButtonsState extends State<MeetingsButtons> {
  // Route to meeting code
  void meetingCode() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MeetingCode()),
    );
  }

  // Show Bottom Sheet
  void btm() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15,
              ),
              ListTile(
                dense: true,
                onTap: () {},
                leading: Icon(
                  Icons.link,
                  color: Colors.black54,
                ),
                title: Text(
                  "Get a meeting link to share",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Product Sans'),
                ),
              ),
              ListTile(
                dense: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.video_call_outlined,
                  color: Colors.black54,
                ),
                title: Text(
                  "Start an instant meeting",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Product Sans'),
                ),
              ),
              ListTile(
                dense: true,
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(
                  Icons.close_sharp,
                  color: Colors.black54,
                ),
                title: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Product Sans'),
                ),
              ),
              SizedBox(
                height: 15,
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: MainButton(
            title: 'New meeting',
            onPressed: btm,
            color: kPrimaryColor,
            borderColor: Colors.transparent,
            textColor: Colors.white,
          )),
          VerticalDivider(width: 10.0),
          Expanded(
              child: MainButton(
                  title: 'Join a meeting',
                  onPressed: meetingCode,
                  textColor: kPrimaryColor)),
        ],
      ),
    );
  }
}
