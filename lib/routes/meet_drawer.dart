import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gmeet/Services/agora.dart';
import 'package:gmeet/Services/google_auth.dart';
import 'package:gmeet/UI/home.dart';
import 'package:gmeet/UI/meeting_code.dart';
import 'package:gmeet/constants.dart';
import 'package:headset_event/headset_event.dart';
import 'package:url_launcher/url_launcher.dart';

class MeetDrawer extends StatefulWidget {
  MeetDrawer({Key key}) : super(key: key);

  @override
  _MeetDrawerState createState() => _MeetDrawerState();
}

class _MeetDrawerState extends State<MeetDrawer> {
  static var clr1 = Colors.teal[700];
  static var clr2 = Colors.transparent;
  static var clr3 = Colors.transparent;
  static var soundIcon = Icons.volume_up_outlined;
  static var isHeadphoneConnected = false;
  static var isMuted = false;
  static var isVidOff = false;
  var _loading = false;
  var _isAccPressed = false;
  var _sheet = false;
  var _snack = true;
  var _logOut = false;
  var _opacity = 1.0;
  User _user = FirebaseAuth.instance.currentUser;
  Agora _agora = Agora();
  Camera _camera = Camera();

  @override
  void initState() {
    super.initState();
    HeadsetEvent headsetPlugin = new HeadsetEvent();
    headsetPlugin.setListener((_val) {
      if (_val == HeadsetState.CONNECT)
        setState(() {
          isHeadphoneConnected = true;
          soundIcon = Icons.headset_outlined;
          clr2 = Colors.teal[700];
          clr1 = Colors.transparent;
          clr3 = Colors.transparent;
        });
      else
        setState(() {
          isHeadphoneConnected = false;
          soundIcon = Icons.volume_up_outlined;
          clr1 = Colors.teal[700];
          clr2 = Colors.transparent;
          clr3 = Colors.transparent;
          try {
            _agora.engine.setEnableSpeakerphone(true);
          } catch (e) {}
        });
    });
  }

  void mic() {
    setState(() {
      isMuted = !isMuted;
      Fluttertoast.cancel();
    });
    Fluttertoast.showToast(
      msg: isMuted ? "Microphone off" : "Microphone on",
      gravity: ToastGravity.CENTER,
      textColor: Colors.white,
      backgroundColor: Colors.transparent,
    );
  }

  void video() {
    setState(() {
      isVidOff = !isVidOff;
    });
  }

  void newMeeting() async {
    setState(() {
      _loading = true;
    });
// Not Solved
    // await _agora.createChannel(this._user.uid);
  }

  void stopLoading() {
    setState(() {
      _loading = false;
    });
  }

  void meetingCode() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MeetingCode()),
    );
  }

  void menu() {}

  void settings() {}

  void feedback() async {
    const _url = 'mailto:amalnathm7@gmail.com?subject=Feedback';
    await canLaunch(_url) ? await launch(_url) : throw "Could not launch $_url";
  }

  void abuse() async {
    const _url = 'https://support.google.com/meet/contact/abuse';
    await canLaunch(_url) ? await launch(_url) : throw "Could not launch $_url";
  }

  void help() async {
    const _url = 'https://support.google.com';
    await canLaunch(_url) ? await launch(_url) : throw "Could not launch $_url";
  }

  void _launchURL1() async {
    const _url = 'https://policies.google.com/terms';
    await canLaunch(_url) ? await launch(_url) : throw "Could not launch $_url";
  }

  void _launchURL2() async {
    const _url = 'https://policies.google.com/privacy';
    await canLaunch(_url) ? await launch(_url) : throw "Could not launch $_url";
  }

  void manageAccount() async {
    const _url = 'https://myaccount.google.com';
    await canLaunch(_url) ? await launch(_url) : throw "Could not launch $_url";
  }

  void speaker() {
    setState(() {
      clr1 = Colors.teal[700];
      clr2 = Colors.transparent;
      clr3 = Colors.transparent;
      soundIcon = Icons.volume_up_outlined;
    });
    Navigator.pop(context);
  }

  void phone() {
    setState(() {
      clr2 = Colors.teal[700];
      clr1 = Colors.transparent;
      clr3 = Colors.transparent;
      soundIcon =
          isHeadphoneConnected ? Icons.headset_outlined : Icons.phone_in_talk;
    });
    Navigator.pop(context);
  }

  void audioOff() {
    setState(() {
      clr3 = Colors.teal[700];
      clr2 = Colors.transparent;
      clr1 = Colors.transparent;
      soundIcon = Icons.volume_off_outlined;
    });
    Navigator.pop(context);
  }

  void logout() {
    setState(() {
      _logOut = true;
    });
    GoogleAuth().signOut(context);
  }

  void btm() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 8,
              ),
              ListTile(
                dense: true,
                onTap: speaker,
                leading: Icon(
                  Icons.volume_up_outlined,
                  color: Colors.black54,
                ),
                title: Text(
                  "Speaker",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.check,
                  color: clr1,
                ),
              ),
              ListTile(
                dense: true,
                onTap: phone,
                leading: Icon(
                  isHeadphoneConnected
                      ? Icons.headset_outlined
                      : Icons.phone_in_talk,
                  color: Colors.black54,
                ),
                title: Text(
                  isHeadphoneConnected ? "Wired headphones" : "Phone",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.check,
                  color: clr2,
                ),
              ),
              ListTile(
                dense: true,
                onTap: audioOff,
                leading: Icon(
                  Icons.volume_off_outlined,
                  color: Colors.black54,
                ),
                title: Text(
                  "Audio off",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.check,
                  color: clr3,
                ),
              ),
              ListTile(
                dense: true,
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(
                  Icons.close_sharp,
                  color: Colors.black54,
                ),
                title: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              )
            ],
          );
        });
  }

  void refresh() {}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          ExpansionTile(
            tilePadding: EdgeInsets.zero,
            onExpansionChanged: (val) {
              setState(() {
                _isAccPressed = val;
              });
            },
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: _user != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        _user.photoURL,
                        height: 36,
                      ))
                  : SizedBox(),
            ),
            title: Text(
              _user != null ? _user.displayName : "",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'Product Sans',
                  fontSize: 15,
                  color: Colors.black),
            ),
            subtitle: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              text: TextSpan(children: [
                TextSpan(
                  text: _user != null ? _user.email + " " : "",
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
                WidgetSpan(
                    child: Icon(
                  _isAccPressed
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.black54,
                  size: 18,
                ))
              ]),
            ),
            trailing: _logOut
                ? Padding(
                    padding: const EdgeInsets.only(right: 28),
                    child: Container(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                        )),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: IconButton(
                          iconSize: 20,
                          splashRadius: 20,
                          color: Colors.black54,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.logout,
                          ),
                          onPressed: logout,
                        )),
                  ),
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                      shadowColor: Colors.grey,
                      onSurface: Colors.grey,
                      minimumSize: Size(180, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 0.5),
                      )),
                  onPressed: manageAccount,
                  child: Text(
                    "Manage your Google Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Product Sans',
                        fontSize: 12),
                  )),
              SizedBox(
                height: 5,
              )
            ],
          ),
          Divider(
            color: Colors.black12,
            thickness: 1,
            height: 0,
          ),
          ListTile(
            onTap: settings,
            dense: true,
            minLeadingWidth: 20,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                Icons.settings_outlined,
                size: 20,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 14, fontFamily: 'Product Sans'),
            ),
          ),
          ListTile(
            onTap: feedback,
            dense: true,
            minLeadingWidth: 20,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                Icons.feedback_outlined,
                size: 20,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Send feedback",
              style: TextStyle(fontSize: 14, fontFamily: 'Product Sans'),
            ),
          ),
          ListTile(
            onTap: abuse,
            dense: true,
            minLeadingWidth: 20,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                Icons.report_gmailerrorred_outlined,
                size: 20,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Report abuse",
              style: TextStyle(fontSize: 14, fontFamily: 'Product Sans'),
            ),
          ),
          ListTile(
            onTap: help,
            dense: true,
            minLeadingWidth: 20,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                Icons.help,
                size: 20,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Help",
              style: TextStyle(fontSize: 14, fontFamily: 'Product Sans'),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    thickness: 1,
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: _launchURL2,
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.black12),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.only(left: 5, right: 5))),
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Text("  •  "),
                      TextButton(
                        onPressed: _launchURL1,
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.black12),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.only(left: 5, right: 5))),
                        child: Text(
                          "Terms of Service",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
