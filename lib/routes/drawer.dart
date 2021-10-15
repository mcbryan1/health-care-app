import 'package:flutter/material.dart';

import '../constants.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
            // padding: EdgeInsets.symmetric(),
            child: DrawerHeader(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Text('G', style: TextStyle(color: Colors.blue, fontSize: 25)),
                Text('o', style: TextStyle(color: Colors.red, fontSize: 25)),
                Text('o', style: TextStyle(color: Colors.yellow, fontSize: 25)),
                Text('g', style: TextStyle(color: Colors.blue, fontSize: 25)),
                Text('l', style: TextStyle(color: Colors.green, fontSize: 25)),
                Text('e', style: TextStyle(color: Colors.red, fontSize: 25)),
                SizedBox(width: 5),
                Text('Meet',
                    style: TextStyle(color: kTextDarkerColor, fontSize: 25)),
              ]),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined,
                color: kTextDarkerColor, size: 21),
            title: Text('Settings', style: TextStyle(color: kTextDarkerColor)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Send feedback',
                style: TextStyle(color: kTextDarkerColor)),
            leading: Icon(Icons.feedback_outlined,
                color: kTextDarkerColor, size: 21),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:
                Icon(Icons.help_outline, color: kTextDarkerColor, size: 21),
            title: Text('Help', style: TextStyle(color: kTextDarkerColor)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
