import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gmeet/constants.dart';

class OtpVerification extends StatefulWidget {
  OtpVerification({Key key}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'OTP Verification',
          style: TextStyle(
              color: kTextDarkerColor,
              fontFamily: 'Product Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Enter the OTP sent to \n0554536187 ',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Product Sans',
              ),
            ),
            SizedBox(height: 150),
            OtpTextField(
              fieldWidth: 50,
              numberOfFields: 6,
              borderWidth: 2,
              fillColor: kPrimaryLightColor,
              borderColor: Colors.red,
              focusedBorderColor: kPrimaryColor,
              cursorColor: kPrimaryColor,
              margin: EdgeInsets.symmetric(horizontal: 5),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomeScreen()));
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            )
          ],
        ),
      ),
    );
  }
}
