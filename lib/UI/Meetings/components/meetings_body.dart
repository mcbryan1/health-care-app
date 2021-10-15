import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gmeet/UI/Meetings/components/meetings_buttons.dart';
import 'package:gmeet/UI/Meetings/components/meetings_list.dart';
import 'package:gmeet/UI/Meetings/components/meetings_title.dart';
import 'package:gmeet/constants.dart';
import 'package:gmeet/routes/meet_drawer.dart';

class MeetingsBody extends StatefulWidget {
  MeetingsBody({Key key}) : super(key: key);

  @override
  _MeetingsBodyState createState() => _MeetingsBodyState();
}

class _MeetingsBodyState extends State<MeetingsBody> {
  User _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MeetDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: kTextDarkerColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Meet', style: TextStyle(color: kTextDarkerColor)),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 18),
            icon: Container(
              // margin: EdgeInsets.only(right: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: _user != null
                      ? Image.network(_user.photoURL)
                      : CircularProgressIndicator(
                          color: kPrimaryColor,
                          strokeWidth: 2,
                        )),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          MeetingsButtons(),
          SizedBox(height: 20),
          MeetingTitle(),
          SizedBox(height: 20),
          MeetingList(),
        ],
      ),
    );
  }
}
