import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/logic/dateFuntions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RespondScreen extends StatelessWidget {
  final String type;
  final String event;
  final String description;
  final String date;
  final String location;
  final String email;

  const RespondScreen(
      {Key key,
        this.type,
        this.event,
        this.description,
        this.date,
        this.location,
        this.email})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height / 4.87),
        child: AppBar(
          flexibleSpace: Stack(
            children: <Widget>[
              Container(width: MediaQuery.of(context).size.width*100, child: Image.asset('images/headerBanner.png', fit: BoxFit.fill,)),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left:16.0,bottom: 16),
                  child: Text(
                    event,
                    style: boldTextStyle(24, appWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              height: 24,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 24,
                    width: 24,
                    child: Image.asset('images/time.png'),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 22.5,
                  ),
                  Text(
                    weekdayGetter(DateTime.parse(date).weekday) +
                        ', ' +
                        monthGetter(DateTime.parse(date).month)
                            .substring(0, 3) +
                        ' ' +
                        DateTime.parse(date).day.toString() +
                        ', ' +
                        DateTime.parse(date).year.toString(),
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: text3,
                        fontWeight: FontWeight.w400),
                  ),
                  Expanded(child: Container(),),
                  Text(
                    DateFormat("hh:mm a").format(DateTime.parse(date)),
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: text3,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 24,
                  width: 24,
                  child: Image.asset('images/location.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 22.5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.25,
                  child: Text(
                    location.toString(),
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: text3,
                        fontWeight: FontWeight.w400),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 24,
                  width: 24,
                  child: Image.asset('images/description.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 22.5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.25,
                  child: Text(
                    description,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: text3,
                        fontWeight: FontWeight.w400),
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 24,
                  width: 24,
                  child: Image.asset('images/email.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 22.5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.25,
                  child: Text(
                    email,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: text3,
                        fontWeight: FontWeight.w400),
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Container(
              height: 1.0,
              decoration: BoxDecoration(
                  color: lineColor,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 24,
                  width: 24,
                  child: Image.asset('images/notes.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 22.5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.25,
                  height: MediaQuery.of(context).size.height /6.19,
                  child: Text(
                    'Add note to the sender',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: textA,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: (){Navigator.of(context).pop();},
                child: Text('Yes',
                    style: boldTextStyle(14, appBlue),
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.of(context).pop();},
                child: Text('Maybe',
                    style: boldTextStyle(14, appBlue),
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.of(context).pop();},
                child: Text('No',
                    style: boldTextStyle(14, reject)),
              )
            ],
          )
        ],
      ),
    );
  }
}
