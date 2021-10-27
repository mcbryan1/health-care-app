import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class NoteEditorAppbar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onSave;
  final VoidCallback onDelete;
  final VoidCallback onClose;
  final bool isEditing;
  final VoidCallback onAttach;
  final VoidCallback onBackPressed;
  final VoidCallback onReadOnlyPressed;

  NoteEditorAppbar({
    Key key,
    this.onSave,
    this.onDelete,
    this.onClose,
    this.isEditing,
    this.onAttach,
    this.onBackPressed,
    this.onReadOnlyPressed,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  _NoteEditorAppbarState createState() => _NoteEditorAppbarState();
}

class _NoteEditorAppbarState extends State<NoteEditorAppbar> {
  var _ifTitleisEntered = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Row(children: [
            IconButton(
              icon: Icon(Icons.chevron_left, color: kTextDarkerColor, size: 30),
              onPressed: widget.onBackPressed,
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      _ifTitleisEntered = true;
                    } else {
                      _ifTitleisEntered = false;
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(color: kTextLighterColor),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: kTextDarkerColor,
                ),
              ),
            ),
          ]),
        ),
        _ifTitleisEntered
            ? Row(children: [
                GestureDetector(
                  onTap: widget.onReadOnlyPressed,
                  child: Container(
                    // padding: EdgeInsets.all(8),
                    child: Image.asset('assets/images/edit2.png'),
                    height: 17,
                    width: 17,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: widget.onAttach,
                  child: Container(
                    // padding: EdgeInsets.all(8),
                    child: Image.asset('assets/images/search.png'),
                    height: 17,
                    width: 17,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  // onTap: onPdfAddPressed,
                  child: Container(
                    // padding: EdgeInsets.all(8),
                    child: Image.asset('assets/images/more.png'), height: 17,
                    width: 17,
                  ),
                ),
              ])
            : Row(children: [
                GestureDetector(
                  onTap: widget.onReadOnlyPressed,
                  child: Container(
                    // padding: EdgeInsets.all(8),
                    child: Image.asset('assets/images/open-book.png'),
                    height: 17,
                    width: 17,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: widget.onAttach,
                  child: Container(
                    // padding: EdgeInsets.all(8),
                    child: Image.asset('assets/images/attachment.png'),
                    height: 17,
                    width: 17,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  // onTap: onPdfAddPressed,
                  child: Container(
                    // padding: EdgeInsets.all(8),
                    child: Image.asset('assets/images/more.png'), height: 17,
                    width: 17,
                  ),
                ),
              ])
      ])),
    );
  }
}
