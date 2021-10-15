import 'package:flutter/material.dart';
import 'package:gmeet/UI/WelcomeDetails/AuthButtons/google_button.dart';

class GettingStarted extends StatefulWidget {
  GettingStarted({Key key}) : super(key: key);

  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('OOYO Health'),
      ),
      body: Center(
        child: GoogleButton(),
      ),
    );
  }
}
