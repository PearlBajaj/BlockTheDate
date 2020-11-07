import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneInputController = TextEditingController();
  TextEditingController otpInputController = TextEditingController();
  Color buttonColor = textA;

  @override
  initState() {
    phoneInputController = new TextEditingController();
    otpInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: appBlue,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3.07,
              width: MediaQuery.of(context).size.width * 100,
              decoration: BoxDecoration(
                  color: appBlue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Image.asset('images/logo.png'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 24.375,
                    ),
                    Container(
                      height: 78,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Login into',
                          style: boldTextStyle(32, appWhite),
                        ),
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                          text: ' your account',
                          style: boldTextStyle(32, appWhite),
                        ),
                      ])),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 16.25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.085,
                width: MediaQuery.of(context).size.width / 1.28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Enter Mobile No.',
                      style: normalTextStyle(14, text5),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 19.5,
                      width: MediaQuery.of(context).size.width / 1.21,
                      child: Stack(
                        children: <Widget>[
                          TextFormField(
                            style: normalTextStyle(12, text5),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            controller: phoneInputController,
                            keyboardType: TextInputType.number,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                buttonColor = appBlue;
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right:16.0),
                                child: Text(
                                  'Send OTP',
                                  style: boldTextStyle(15, appBlue),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Enter OTP',
                      style: normalTextStyle(14, text5),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 19.5,
                      width: MediaQuery.of(context).size.width / 1.21,
                      child: TextFormField(
                        style: normalTextStyle(12, text5),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        controller: phoneInputController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Resend OTP: 30s',
                        style: normalTextStyle(12, text5),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.64,
                        height: MediaQuery.of(context).size.height / 19.5,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            "Login",
                            style: boldTextStyle(14, appWhite),
                          ),
                          color: buttonColor,
                          textColor: appWhite,
                          onPressed: () {
                            Navigator.pushNamed(context, 'Home');
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 16.25,
            ),
            Text('or continue with', style: boldTextStyle(16, textA)),
            SizedBox(
              height: MediaQuery.of(context).size.height / 16.25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    height: 40,
                    width: 40,
                    child: Image.asset('images/linked_in.png')),
                Container(
                    height: 40,
                    width: 40,
                    child: Image.asset('images/gplus.png')),
                Container(
                    height: 40,
                    width: 40,
                    child: Image.asset('images/fb.png')),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 16.25,
            ),
          ],
        ),
      ),
    );
  }
}
