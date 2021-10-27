import 'package:flutter/material.dart';
import 'package:gmeet/components/Appbar/note_editor_appbar.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NoteEditor extends StatefulWidget {
  NoteEditor({Key key}) : super(key: key);

  @override
  _NoteEditorState createState() => _NoteEditorState();
}

QuillController _controller = QuillController.basic();

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
        child: Column(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: QuillEditor.basic(
                      controller: _controller, readOnly: false)),
            ),
            QuillToolbar.basic(
              controller: _controller,
              showIndent: false,
              showLink: false,
            )
          ],
        ),
      ),
    );
  }
}
