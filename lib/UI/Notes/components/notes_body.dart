import 'package:flutter/material.dart';
import 'package:gmeet/UI/Meetings/meetings.dart';
import 'package:gmeet/UI/Notes/components/note_editor.dart';
import 'package:gmeet/components/Appbar/notes_appbar.dart';
import 'package:gmeet/components/Cards/notes_card.dart';
import 'package:gmeet/constants.dart';

class NotesBody extends StatefulWidget {
  NotesBody({Key key}) : super(key: key);

  @override
  _NotesBodyState createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NoteEditor()),
            );
          },
          child: Container(
              height: 15,
              width: 15,
              child: Image.asset('assets/images/edit.png')),
          backgroundColor: kPrimaryColor,
        ),
        backgroundColor: kNotesBackground,
        appBar: NotesAppbar(
          onBackPressed: () {
            Navigator.pop(context);
            // MaterialPageRoute(builder: (context) => Meetings());
          },
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              NotesCard(
                  date: '3 Sep 2021',
                  title: 'A dime or not',
                  details:
                      "Now I'm going to keep this simple, it's either a dime or not. And I'm talking not talking about money but about the educational system. See the system is not only the lhjdfjhdfhdfjdf"),
              NotesCard(
                  date: '31 Aug 2021',
                  title: 'Reasons to not change profile photo..',
                  details:
                      "Prompt user using push notification \nOr show an indicator in the app that reminds users to upload their profile photo..."),
            ],
          ),
        ));
  }
}
