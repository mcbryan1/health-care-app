import 'package:flutter/material.dart';
import 'package:gmeet/components/meeting_view.dart';

// import 'package:health_care_app/screens/Video/video_call.dart';

class MeetingList extends StatefulWidget {
  MeetingList({Key key}) : super(key: key);

  @override
  _MeetingListState createState() => _MeetingListState();
}

class _MeetingListState extends State<MeetingList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SingleMeetSchedule(
              timeFrom: '09:00',
              day: 'Tue',
              timeTo: '10:00',
              trailing: 'Join',
              onMeetTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => VideoCall(),
                //   ),
                // );
              },
            ),
            SizedBox(height: 20),
            SingleMeetSchedule(
              timeFrom: '09:00',
              day: 'Tue',
              timeTo: '10:00',
              color: Colors.transparent,
            ),
          ],
        ));
  }
}
