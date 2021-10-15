import 'package:flutter/material.dart';
import 'package:gmeet/UI/Auth/phone_login.dart';
import 'package:gmeet/UI/login.dart';
import 'package:gmeet/constants.dart';
import 'package:permission_handler/permission_handler.dart';

class PhoneButton extends StatefulWidget {
  PhoneButton({Key key}) : super(key: key);

  @override
  _PhoneButtonState createState() => _PhoneButtonState();
}

class _PhoneButtonState extends State<PhoneButton> {
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
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
          onPressed: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PhoneLogin()),
            );
          },
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.teal[800]),
              elevation: MaterialStateProperty.all(0),
              minimumSize: MaterialStateProperty.all(Size.zero),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
              backgroundColor: MaterialStateProperty.all(kPrimaryLightColor)),
          child: Text(
            "Continue With Phone",
            style: TextStyle(
                fontFamily: 'Product Sans',
                letterSpacing: 1,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
