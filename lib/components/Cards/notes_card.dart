import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class NotesCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String date;
  final String details;
  const NotesCard({Key key, this.onTap, this.date, this.details, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              date,
              style: TextStyle(
                  color: kTextLighterColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              title,
              style:
                  TextStyle(color: kNotesTextDark, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            Text(
              details,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: kNotesTextDark, fontWeight: FontWeight.bold),
            ),
          ]),
        ));
  }
}
