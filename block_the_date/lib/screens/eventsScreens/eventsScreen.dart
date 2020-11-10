import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/components/customAppBar.dart';
import 'package:block_the_date/components/customBottomNavigationBar.dart';
import 'package:block_the_date/components/lines.dart';
import 'package:block_the_date/logic/dateFuntions.dart';
import 'package:block_the_date/logic/eventColors.dart';
import 'package:block_the_date/logic/models.dart';
import 'package:block_the_date/screens/eventsScreens/newEventScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';


import 'newTaskScreen.dart';


class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
   Color monthlyIconColor = appBlue;
   Color dailyIconColor = textC;
   Color weeklyIconColor = textC;

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
        child: CustomNotificationAppBar(
          title: 'Event Calendar',
          leading: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height:40,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:_headerDate.year.toString(),
                              style: normalTextStyle(12, textA)
                            ),
                            TextSpan(
                              text: '\n',
                            ),
                            TextSpan(
                              text: monthGetter(_headerDate.month),
                              style: normalTextStyle(16, text3)
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: appBlue,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: IconButton(
                        onPressed: (){
                          if(monthlyIconColor == textC){
                            setState(() {
                              monthlyIconColor = appBlue;
                              weeklyIconColor = textC;
                              dailyIconColor = textC;
                            });

                          }
                        },
                        icon: ImageIcon(
                          AssetImage('images/month.png'),
                          color: monthlyIconColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: IconButton(
                        onPressed: (){
                          if(weeklyIconColor == textC){
                            setState(() {
                              monthlyIconColor = textC;
                              weeklyIconColor = appBlue;
                              dailyIconColor = textC;
                            });
                          }
                        },
                        icon: ImageIcon(
                          AssetImage('images/week.png'),
                          color: weeklyIconColor,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        if(dailyIconColor == textC){
                          setState(() {
                            monthlyIconColor = textC;
                            weeklyIconColor = textC;
                            dailyIconColor = appBlue;
                          });
                        }
                      },
                      icon: ImageIcon(
                        AssetImage('images/daily.png'),
                        color: dailyIconColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:56.0),
                child: SingleChildScrollView(
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
                    rowHeight: MediaQuery.of(context).size.height/7.5,
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
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            date.substring(0, 1).toString(),
                            style: boldTextStyle(14, appBlue)
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
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        animatedIconTheme: IconThemeData(size: 40),
        backgroundColor: appBlue,
        visible: true,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: Transform.scale(
              scale: 0.75,
              child: ImageIcon(
                AssetImage('images/addTasks.png'),
                color: appBlue,
              ),
            ),
            backgroundColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => NewTaskScreen(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
            label: 'New Task',
            labelStyle: normalTextStyle(12, text3),),
          SpeedDialChild(
            child: Transform.scale(
              scale: 0.75,
              child: ImageIcon(
                AssetImage('images/addEvents.png'),
                color: appBlue,
              ),
            ),
            backgroundColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => NewEventScreen(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
            label: 'New Event',
            labelStyle: normalTextStyle(12, text3),)
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 2,),
    );
  }
}
