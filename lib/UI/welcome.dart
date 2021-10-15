import 'package:flutter/material.dart';
import 'package:gmeet/UI/WelcomeDetails/AuthButtons/google_button.dart';
import 'package:gmeet/UI/WelcomeDetails/AuthButtons/phone_button.dart';
import 'package:gmeet/UI/WelcomeDetails/terms.dart';
import 'package:gmeet/UI/WelcomeDetails/title_subtitle.dart';
import 'package:gmeet/UI/WelcomeDetails/welcome_image.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleSubtitle(),
            SizedBox(
              height: 50,
            ),
            WelcomeImage(),
            SizedBox(
              height: 50,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: GoogleButton()),
            SizedBox(
              height: 20,
            ),
            PhoneButton(),
            SizedBox(
              height: 30,
            ),
            TermsAndConditions()
          ],
        ),
      ),
    );
  }
}
