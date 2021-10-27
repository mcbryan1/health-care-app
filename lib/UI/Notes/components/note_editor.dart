import 'package:flutter/material.dart';
import 'package:gmeet/components/Appbar/note_editor_appbar.dart';

class NoteEditor extends StatefulWidget {
  NoteEditor({Key key}) : super(key: key);

  @override
  _NoteEditorState createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteEditorAppbar(
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        child: Text('Note Editor'),
      ),
    );
  }
}
