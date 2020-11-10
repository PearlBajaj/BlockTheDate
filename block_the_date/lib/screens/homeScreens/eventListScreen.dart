import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/customAppBar.dart';
import 'package:block_the_date/components/eventListContainer.dart';
import 'package:block_the_date/components/lines.dart';
import 'package:block_the_date/logic/dateFuntions.dart';
import 'package:block_the_date/logic/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventListScreen extends StatefulWidget {
  final DateTime date;

  const EventListScreen({Key key, this.date}) : super(key: key);

  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  DateTime date;
  @override
  initState() {
    date = widget.date;
    for (int i = 0; i < _eventList.length; i++) {
      if (DateFormat("yyyy-MM-dd").parse(_eventList[i].date) ==
          DateFormat("yyyy-MM-dd").parse(widget.date.toString())) {
        _selectedEventsList.add(_eventList[i]);
      }
    }
    super.initState();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(66.0),
        child: CustomAppBar(
          title: 'Event List',
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 18,
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
                if( index < (_selectedEventsList.length - 1)){
                  return Column(
                    children: <Widget>[
                       EventListContainer(
                        type: _selectedEventsList[index].type,
                        description: _selectedEventsList[index]
                            .description,
                        date: _selectedEventsList[index].date,
                        time: _selectedEventsList[index].time,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Line(),
                      ),
                    ],
                  );
                }
                else{
                  return EventListContainer(
                    type: _selectedEventsList[index].type,
                    description: _selectedEventsList[index]
                        .description,
                    date: _selectedEventsList[index].date,
                    time: _selectedEventsList[index].time,
                  );
                }
              })
        ],
      ),
    );
  }
}
