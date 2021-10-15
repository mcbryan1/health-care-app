import 'package:flutter/material.dart';
import 'package:gmeet/UI/login.dart';
import 'package:gmeet/constants.dart';
import 'package:permission_handler/permission_handler.dart';

class GoogleButton extends StatefulWidget {
  GoogleButton({Key key}) : super(key: key);

  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  void checkCamAndMic() async {
    if (await Permission.camera.isGranted &&
        await Permission.microphone.isGranted)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
  }

  @override
  void initState() {
    super.initState();
    checkCamAndMic();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
          onPressed: () async {
            if (await Permission.camera.isPermanentlyDenied) openAppSettings();
            if (await Permission.microphone.isPermanentlyDenied)
              openAppSettings();
            while (await Permission.camera.request().isDenied) {}
            while (await Permission.microphone.request().isDenied) {}

            if (await Permission.camera.isGranted &&
                await Permission.microphone.isGranted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            }
          },
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.teal[800]),
              elevation: MaterialStateProperty.all(0),
              minimumSize: MaterialStateProperty.all(Size.zero),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
              backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
          child: Text(
            "Continue With Google",
            style: TextStyle(
              fontFamily: 'Product Sans',
              letterSpacing: 1,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
