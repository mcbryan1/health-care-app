import 'package:flutter/material.dart';

class NotesBody extends StatefulWidget {
  NotesBody({Key key}) : super(key: key);

  @override
  _NotesBodyState createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Center(
        child: Text('Notes'),
      ),
    );
  }
}
