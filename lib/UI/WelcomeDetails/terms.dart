import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndConditions extends StatefulWidget {
  TermsAndConditions({Key key}) : super(key: key);

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  void _launchURL1() async {
    const _url = 'https://policies.google.com/terms';
    await canLaunch(_url) ? await launch(_url) : throw "Could not launch $_url";
  }

  void _launchURL2() async {
    const _url = 'https://policies.google.com/privacy';
    await canLaunch(_url) ? await launch(_url) : throw "Could not launch $_url";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'By Signing Up You Are Agreeing To Our',
          style: TextStyle(
              fontSize: 15, color: kPrimaryColor, fontFamily: 'Product Sans'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _launchURL1,
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              child: Text(
                "Terms of Service",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(" and ",
                style: TextStyle(
                    fontSize: 15,
                    color: kPrimaryColor,
                    fontFamily: 'Product Sans')),
            TextButton(
              onPressed: _launchURL2,
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              child: Text(
                "Privacy Policy",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
