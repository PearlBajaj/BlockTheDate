import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/components/customButton.dart';
import 'package:block_the_date/screens/eventsScreens/eventsScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height / 4.87),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Stack(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 100,
                  child: Image.asset(
                    'images/headerBanner.png',
                    fit: BoxFit.fill,
                  )),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 26.0, left: 16),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage(
                        'images/cancel_icon.png',
                      ),
                      color: appWhite,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              EventScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 26.0, left: 16),
                  child: IconButton(
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                      color: appWhite,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, right: 16),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit_rounded,
                      color: appWhite,
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                  child: Text(
                    'Birthday Party',
                    style: boldTextStyle(24, appWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              height: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    'Date & Time',
                    style: normalTextStyle(14, text3),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 56.0, right: 16),
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Text(
                    'Mon, Oct 21, 2020',
                    style: normalTextStyle(14, text3),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  '03:30 PM',
                  style: normalTextStyle(14, text3),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 56.0, right: 16),
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Text(
                    'Mon, Oct 21, 2020',
                    style: normalTextStyle(14, text3),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  '04:30 PM',
                  style: normalTextStyle(14, text3),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24.0)),
                ),
                context: context,
                builder: (BuildContext context) {
                  return EventOccurrence();
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 24,
                    width: 24,
                    child: Image.asset('images/repeat.png'),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 22.5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.25,
                    child: Text(
                      'One Time Event',
                      style: normalTextStyle(14, text3),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24.0)),
                ),
                context: context,
                builder: (BuildContext context) {
                  return ReminderSetter();
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                height: 24,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 24,
                      width: 24,
                      child: Image.asset('images/reminder.png'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 22.5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        'Tuesday Oct 20, 2020',
                        style: normalTextStyle(14, text3),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      '08:30 PM',
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Container(
              height: 1.0,
              decoration: BoxDecoration(
                  color: Color(0xff707070),
                  borderRadius: BorderRadius.all(Radius.circular(24))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    'user@gmail.com',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 24,
                  width: 24,
                  child: Image.asset('images/timezone.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 22.5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.25,
                  child: Text(
                    'Indian Standard Time',
                    style: normalTextStyle(14, text3),
                    maxLines: 1,
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
                  color: Color(0xff707070),
                  borderRadius: BorderRadius.all(Radius.circular(24))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 24,
                  width: 24,
                  child: Image.asset('images/addGuests.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 22.5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.25,
                  child: Text(
                    'Add Guests',
                    style: normalTextStyle(14, textA),
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Mumbai, Maharashtra, India',
                    style: normalTextStyle(14, text3),
                    maxLines: 1,
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
                    'Add Description ',
                    style: normalTextStyle(14, textA),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SaveButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class EventOccurrence extends StatefulWidget {
  @override
  _EventOccurrenceState createState() => _EventOccurrenceState();
}

class _EventOccurrenceState extends State<EventOccurrence> {
  bool oneTime = false;
  bool weekly = false;
  bool daily = false;
  bool monthly = false;
  bool yearly = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 4.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      color: Color(0xffCCCCCC),
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Column(
                    children: <Widget>[
                      CheckboxTileCircle(
                        value: oneTime,
                        text: 'One Time Event',
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      CheckboxTileCircle(
                        value: daily,
                        text: 'Daily',
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      CheckboxTileCircle(
                        value: weekly,
                        text: 'Weekly',
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      CheckboxTileCircle(
                        value: monthly,
                        text: 'Monthly',
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      CheckboxTileCircle(
                        value: yearly,
                        text: 'Yearly',
                      ),
                      SizedBox(
                        height: 22,
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

class CheckboxTileCircle extends StatefulWidget {
  bool value;
  final String text;
  CheckboxTileCircle({this.value, this.text});
  @override
  _CheckboxTileCircleState createState() => _CheckboxTileCircleState();
}

class _CheckboxTileCircleState extends State<CheckboxTileCircle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              widget.value = !widget.value;
            });
          },
          child: Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: textA),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: widget.value
                  ? Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appBlue,
                      ),
                    )
                  : Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appWhite,
                      ),
                    ),
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          widget.text,
          style: normalTextStyle(14, text3),
        ),
      ],
    );
  }
}

class ReminderSetter extends StatefulWidget {
  @override
  _ReminderSetterState createState() => _ReminderSetterState();
}

class _ReminderSetterState extends State<ReminderSetter> {
  bool isSwitched = false;
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  initState() {
    timeController = new TextEditingController();
    timeController.text = '06:30 PM';
    dateController = new TextEditingController();
    dateController.text = '24/05/2020';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 2.4,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter stateSetter) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 4.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: Color(0xffCCCCCC),
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: ListTile(
                          title: Text(
                            'No Reminders',
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: appBlue.withOpacity(0.5),
                            activeColor: appBlue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0, bottom: 8),
                                  child: Text(
                                    'Daily',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Color(0xff333333),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width / 2.5,
                                  height: 40,
                                  child: TextFormField(
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Color(0xff333333),
                                        fontWeight: FontWeight.w400),

                                    decoration: InputDecoration(
                                      suffixIcon: Transform.scale(
                                          scale: 0.75,
                                          child: ImageIcon(
                                            AssetImage('images/calendar.png'),
                                            color: appBlue,
                                          )),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    controller: dateController,
                                    keyboardType: TextInputType.datetime,
                                    // validator: validator,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0, bottom: 8),
                                  child: Text(
                                    'Daily',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Color(0xff333333),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width / 2.5,
                                  height: 40,
                                  child: TextFormField(
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Color(0xff333333),
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                      suffixIcon: Transform.scale(
                                          scale: 0.75,
                                          child: ImageIcon(
                                            AssetImage('images/time.png'),
                                            color: appBlue,
                                          )),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    controller: timeController,
                                    keyboardType: TextInputType.datetime,
                                    // validator: validator,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
