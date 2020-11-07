import 'dart:async';

import 'package:block_the_date/components/constantColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, 'Login'));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: appBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo.png'),
            SizedBox(
              height: 24,
            ),
            Text(
              '#BlockTheDate',
              style: GoogleFonts.montserrat(
                fontSize: 32,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
