import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/lines.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool tasks = false;
  bool events = false;
  bool reminders = false;
  bool invites = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2.35,
      child: StatefulBuilder(
        builder:
            (BuildContext context, StateSetter stateSetter) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                thickLine(),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Column(
                    children: <Widget>[
                      CheckboxListTile(
                        controlAffinity:
                        ListTileControlAffinity.leading,
                        checkColor: appBlue,
                        activeColor: Colors.white,
                        title: Text(
                          'Tasks',
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Color(0xff333333)),
                        ),
                        value: this.tasks,
                        onChanged: (bool value) {
                          stateSetter(() {
                            this.tasks = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity:
                        ListTileControlAffinity.leading,
                        checkColor: appBlue,
                        activeColor: Colors.white,
                        title: Text(
                          'Events',
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Color(0xff333333)),
                        ),
                        value: this.events,
                        onChanged: (bool value) {
                          stateSetter(() {
                            this.events = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity:
                        ListTileControlAffinity.leading,
                        checkColor: appBlue,
                        activeColor: Colors.white,
                        title: Text(
                          'Reminders',
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Color(0xff333333)),
                        ),
                        value: this.reminders,
                        onChanged: (bool value) {
                          stateSetter(() {
                            this.reminders = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity:
                        ListTileControlAffinity.leading,
                        checkColor: appBlue,
                        activeColor: Colors.white,
                        title: Text(
                          'Invites',
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Color(0xff333333)),
                        ),
                        value: this.invites,
                        onChanged: (bool value) {
                          stateSetter(() {
                            this.invites = value;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
