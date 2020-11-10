import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/screens/homeScreens/notificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      title: Text(
        title,
        style: normalTextStyle(20, appWhite),
        textAlign: TextAlign.left,
      ),
      backgroundColor: appBlue,
    );
  }
}

class CustomNotificationAppBar extends StatelessWidget {
  final String title;
  final bool leading;

  const CustomNotificationAppBar({Key key, this.title, this.leading}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: leading,
      centerTitle: false,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: GoogleFonts.montserrat(
              fontSize: 20, color: appWhite, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: appBlue,
      actions: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => NotificationScreen(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
            icon: ImageIcon(
              AssetImage('images/notification.png'),
              color: appWhite,
            )),
      ],
    );
  }
}
