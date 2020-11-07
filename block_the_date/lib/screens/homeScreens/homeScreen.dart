import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/components/customBottomNavigationBar.dart';
import 'package:block_the_date/components/eventListContainer.dart';
import 'package:block_the_date/components/lines.dart';
import 'package:block_the_date/components/pendingRequests.dart';
import 'package:block_the_date/logic/dateFuntions.dart';
import 'package:block_the_date/logic/eventColors.dart';
import 'package:block_the_date/logic/models.dart';
import 'package:block_the_date/screens/homeScreens/filterScreen.dart';
import 'package:block_the_date/screens/homeScreens/notificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<DateTime, List> _events;
  CalendarController _calendarController = CalendarController();
  DateTime _headerDate;
  List<Event> _selectedEventsList = [];

  List<Event> _eventList = [
    Event('Birthday Party on the 2nd of October', 'Event', '2020-10-2',
        '2020-10-02 11:00:00.000'),
    Event('Meeting with Client for further discussions for the product',
        'Meeting', '2020-10-7', '2020-10-07 11:00:00.000'),
    Event('Create strategy for Marketing and Promotions ', 'Task', '2020-10-7',
        '2020-10-07 15:45:00.000'),
    Event('Mr. & Mrs. Singh\'s Anniversary Event', 'Event', '2020-10-7',
        '2020-10-07 20:00:00.000'),
    Event('Team Meeting to discuss wireframes', 'Meeting', '2020-10-9',
        '2020-10-09 15:45:00.000'),
    Event('Meeting for UX Strategy and UI Design discussions', 'Meeting',
        '2020-10-30', '2020-10-30 11:00:00.000'),
  ];

  @override
  void initState() {
    super.initState();
    _events = {
      DateTime(2020, 10, 2): ['Birthday'],
      DateTime(2020, 10, 7): ['Wedding', 'Meeting', 'Task'],
      DateTime(2020, 10, 9): ['Meeting'],
      DateTime(2020, 10, 30): ['Meeting'],
    };
    _calendarController = CalendarController();
    _headerDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(66.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: _headerDate.year.toString(),
                  style: normalTextStyle(12, appWhite),
                ),
                TextSpan(
                  text: '\n',
                ),
                TextSpan(
                  text: monthGetter(_headerDate.month),
                  style: boldTextStyle(20, appWhite),
                  ),
              ],
            ),
          ),
          backgroundColor: appBlue,
          actions: <Widget>[
            IconButton(
              icon: ImageIcon(AssetImage('images/search.png')),
              onPressed: () {
              },
            ),
            IconButton(
              icon: ImageIcon(AssetImage('images/filter.png')),
              onPressed: () {
                showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(24.0)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return FilterScreen();
                  },
                );
              },
            ),
            IconButton(
              icon: ImageIcon(AssetImage('images/notification.png')),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => NotificationScreen(),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                child: TableCalendar(
                  calendarController: _calendarController,
                  events: _events,
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                  },
                  onVisibleDaysChanged: (_, __, ___) {
                    setState(() {
                      _headerDate = _calendarController.focusedDay;
                    });
                  },
                  initialCalendarFormat: CalendarFormat.month,
                  headerVisible: false,
                  headerStyle: HeaderStyle(
                      titleTextBuilder: (date, locale) => DateFormat.yM(locale).format(date),
                    formatButtonTextStyle:
                    TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.deepOrange[400],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    canEventMarkersOverflow: true,
                    todayColor: appBlue,
                    selectedColor: appBlue,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    dowTextBuilder: (date, locale) {
                      return DateFormat.E(locale).format(date)[0].toString();
                    },
                    weekdayStyle: GoogleFonts.montserrat(
                      backgroundColor: appBlue,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: appWhite,
                    ),
                    weekendStyle: GoogleFonts.montserrat(
                      backgroundColor: appBlue,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: appWhite,
                    ),
                  ),
                  onDaySelected: (date, events, holidays) {
                    setState(() {
                      for (int i = 0; i < _eventList.length; i++) {
                        if (DateFormat("yyyy-MM-dd")
                            .parse(_eventList[i].date) ==
                            DateFormat("yyyy-MM-dd").parse(date.toString())) {
                          _selectedEventsList.add(_eventList[i]);
                        }
                      }
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24.0)),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return ConstrainedBox(
                            constraints: new BoxConstraints(
                              minHeight: MediaQuery.of(context).size.height/2,
                              // maxHeight: MediaQuery.of(context).size.
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: <Widget>[
                                  thickLine(),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 24,
                                        width: 24,
                                        child: Icon(
                                          Icons.keyboard_arrow_left_sharp,
                                          color: appBlue,
                                          size: 24,
                                        ),
                                      ),
                                      Text(
                                        monthGetter(date.month) +
                                            ' ' +
                                            date.day.toString() +
                                            ', ' +
                                            date.year.toString(),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            color: Color(0xFF333333),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        height: 24,
                                        width: 24,
                                        child: Icon(
                                          Icons.keyboard_arrow_right_sharp,
                                          color: appBlue,
                                          size: 24,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _selectedEventsList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                          return EventListContainer(
                                            type: _selectedEventsList[index].type,
                                            description: _selectedEventsList[index].description,
                                            date: _selectedEventsList[index].date,
                                            time: _selectedEventsList[index].time,
                                          );
                                      })
                                ],
                              ),
                            ),
                          );
                        },
                      ).then((value) => _selectedEventsList.clear());
                    });
                  },
                  builders: CalendarBuilders(
                    markersBuilder: (context, date, events, holidays) {
                      return [
                        Container(
                          height: 8,
                          width: 38,
                          decoration: new BoxDecoration(
                            color: eventColor(events[0].toString()),
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          margin: const EdgeInsets.all(7.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Text(
                              events[0].toString(),
                              style: GoogleFonts.montserrat(
                                fontSize: 6,
                                color: appWhite,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ];
                    },

                    outsideWeekendDayBuilder: (context, date, events) =>
                        Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              date.day.toString(),
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: textC,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                    dowWeekdayBuilder: (context, date) => Container(
                      decoration: BoxDecoration(
                        color: appBlue,
                        border: Border.all(
                            color: appBlue,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          date.substring(0, 1).toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: appWhite,
                          ),
                        ),
                      ),
                    ),
                    outsideDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          date.day.toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: textC,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    dayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          date.day.toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: text3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: appBlue),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          date.day.toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: text3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: appBlue,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          date.day.toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: appWhite,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Pending Requests',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Container(height: MediaQuery.of(context).size.height/3,child: PendingRequests(height: MediaQuery.of(context).size.height/1.8)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 0,),
    );
  }
}

