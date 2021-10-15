import 'package:flutter/material.dart';
import 'package:gmeet/UI/Auth/otp.dart';
import 'package:gmeet/UI/WelcomeDetails/AuthButtons/google_button.dart';
import 'package:gmeet/constants.dart';

class PhoneLogin extends StatefulWidget {
  PhoneLogin({Key key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: Text(
          'Continue With Phone',
          style: TextStyle(
              color: kTextDarkerColor,
              fontFamily: 'Product Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Enter your phone number to \nreceive otp ',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Product Sans',
                ),
              ),
              SizedBox(height: 150),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Enter phone number',
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Product Sans',
                      color: kPrimaryColor),
                  hintText: 'xxx xxx xxxx',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: kTextDarkerColor,
                    fontFamily: 'Product Sans',
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 60,
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpVerification(),
                      ),
                    );
                  },
                  color: kPrimaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Product Sans',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(child: Text('Or')),
              SizedBox(height: 20),
              GoogleButton()
            ],
          ),
        ),
      ),
    );
  }
}
