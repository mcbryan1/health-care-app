import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class NotesAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onPdfAddPressed;
  final VoidCallback onSearchPressed;
  final VoidCallback onMenuPressed;
  const NotesAppbar(
      {Key key,
      this.onBackPressed,
      this.onPdfAddPressed,
      this.onSearchPressed,
      this.onMenuPressed})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Container(
          // padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: onBackPressed,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.chevron_left,
                        color: kTextDarkerColor,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('All notes',
                      style: TextStyle(
                          color: kTextDarkerColor, fontFamily: 'Product Sans'))
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onPdfAddPressed,
                    child: Container(
                      // padding: EdgeInsets.all(8),
                      child: Image.asset('assets/images/add.png'), height: 17,
                      width: 17,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: onSearchPressed,
                    child: Container(
                      child: Image.asset('assets/images/search.png'),
                      height: 17,
                      width: 17,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: onMenuPressed,
                    child: Container(
                      child: Image.asset('assets/images/more.png'),
                      height: 17,
                      width: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
