import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gmeet/Services/agora.dart';

import 'package:gmeet/UI/meeting_code.dart';
import 'package:gmeet/UI/meeting_header.dart';
import 'package:gmeet/components/Appbar/video_call_appbar.dart';
import 'package:gmeet/constants.dart';
import 'package:headset_event/headset_event.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  static var clr1 = Colors.teal[700];
  static var clr2 = Colors.transparent;
  static var clr3 = Colors.transparent;
  static var soundIcon = Icons.volume_up_outlined;
  static var isHeadphoneConnected = false;
  static var isMuted = false;
  static var isVidOff = false;
  var _loading = false;

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

    await _agora.createChannel(this);
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
    _agora.context = context;
    return Opacity(
      opacity: _loading ? 0.5 : 1,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: VideoCallAppbar(
              onBackPressed: () {
                Navigator.pop(context);
              },
              onMuteVolumePressed: btm,
              reportPressed: abuse),
          body: Column(
            children: [
              MeetingHeader(),
              isVidOff
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 110),
                        height: MediaQuery.of(context).size.height * .4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kTextDarkerColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _user != null
                                ? Center(
                                    child: ClipRRect(
                                      child: Image.network(
                                        _user.photoURL,
                                        height: 80,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black54,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 110),
                          height: MediaQuery.of(context).size.height * .4,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: _camera),
                    ),
              _loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    )
                  : SizedBox(),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      height: 55,
                      width: 55,
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          color:
                              isVidOff ? kTextDarkerColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: isVidOff
                                  ? Colors.transparent
                                  : kTextDarkerColor)),
                      child: IconButton(
                        splashRadius: 25,
                        splashColor: Colors.transparent,
                        icon: Icon(isVidOff
                            ? Icons.videocam_off_outlined
                            : Icons.videocam_outlined),
                        onPressed: video,
                        color: isVidOff ? Colors.white : kTextDarkerColor,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AnimatedContainer(
                      height: 55,
                      width: 55,
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          color:
                              isMuted ? kTextDarkerColor : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: isMuted
                                  ? Colors.transparent
                                  : kTextDarkerColor)),
                      child: IconButton(
                        splashRadius: 25,
                        splashColor: Colors.transparent,
                        icon: Icon(isMuted
                            ? Icons.mic_off_outlined
                            : Icons.mic_none_outlined),
                        onPressed: mic,
                        color: isMuted ? Colors.white : kTextDarkerColor,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor,
                      ),
                      // margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                          onPressed: newMeeting,
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              minimumSize: MaterialStateProperty.all(Size.zero),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20)),
                              backgroundColor:
                                  MaterialStateProperty.all(kPrimaryColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              )),
                          child: Text(
                            "Ask to join",
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              letterSpacing: 1,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class Camera extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CameraState();
  }
}

class CameraState extends State<Camera> {
  CameraController camController;

  camera() async {
    final cameras = await availableCameras();
    camController = CameraController(
      cameras.last,
      ResolutionPreset.ultraHigh,
    );
    camController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    camController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    camera();
  }

  @override
  Widget build(BuildContext context) {
    return camController != null
        ? camController.value.isInitialized
            ? CameraPreview(camController)
            : SizedBox()
        : SizedBox();
  }
}
