import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/logic/dateFuntions.dart';
import 'package:block_the_date/logic/models.dart';
import 'package:block_the_date/screens/moreMenuScreens/rsvpScreens/respondScreens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PendingRequests extends StatelessWidget {
  final double height;
  final List<PendingRequestsModel> _pendingRequests = [
    PendingRequestsModel(
        'Invitation',
        'Birthday Party',
        'This birthday party will be magical and delighting if you just decide to bless us with your presence. You are invited! We are going to have a wonderful party at our residence. You, along with your family are most cordially invited to be with us.',
        '2020-10-21 15:30:00.000',
        'Sion- Trombay Marg, SG Barve Marg, Kurla East, Mumbai, Maharashtra - 400071',
        'user@gmail.com'),
    PendingRequestsModel(
        'Invitation',
        'Wedding Anniversary',
        'This Wedding Anniversary party for Mr. and Mrs. Singh will be magical and delighting if you just decide to bless us with your presence. You are invited! We are going to have a wonderful party at our residence. You, along with your family are most cordially invited to be with us.',
        '2020-10-07 15:30:00.000',
        'Sion- Trombay Marg, SG Barve Marg, Kurla East, Mumbai, Maharashtra - 400071',
        'user@gmail.com'),
    PendingRequestsModel(
        'Task',
        'Meeting Wireframes',
        'Some description',
        '2020-10-09 15:30:00.000',
        'Sion- Trombay Marg, SG Barve Marg, Kurla East, Mumbai, Maharashtra - 400071',
        'user@gmail.com'),
    PendingRequestsModel(
        'Reminder',
        'Meeting UI Design',
        'Some description',
        '2020-10-30 15:30:00.000',
        'Sion- Trombay Marg, SG Barve Marg, Kurla East, Mumbai, Maharashtra - 400071',
        'user@gmail.com'),
  ];

  PendingRequests({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
          itemCount: _pendingRequests.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 87,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/7.65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          weekdayGetter(DateFormat("yyyy-MM-dd")
                              .parse(_pendingRequests[index].date)
                              .weekday),
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: textA,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Text(
                          monthGetter(DateFormat("yyyy-MM-dd")
                                      .parse(_pendingRequests[index].date)
                                      .month)
                                  .substring(0, 3) +
                              ', ' +
                              DateFormat("yyyy-MM-dd")
                                  .parse(_pendingRequests[index].date)
                                  .day
                                  .toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: text3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, right: 8),
                    child: Stack(children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width/1.4,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        // width: MediaQuery.of(context).size.width / 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width/1.4,
                          height: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color(0xFFFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffCCCCCC),
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                              )
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 16),
                                child: SizedBox(
                                  width: 134,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 14,
                                      ),
                                      Text(
                                        _pendingRequests[index].type,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        _pendingRequests[index].event,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(child: Container(),),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation1, animation2) => RespondScreen(
                                        type: _pendingRequests[index]
                                            .type,
                                        event: _pendingRequests[index]
                                            .event,
                                        description:
                                        _pendingRequests[index]
                                            .description,
                                        date: _pendingRequests[index]
                                            .date,
                                        location:
                                        _pendingRequests[index]
                                            .location,
                                        email: _pendingRequests[index]
                                            .email,
                                      ),
                                      transitionDuration: Duration(seconds: 0),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text(
                                    'Respond',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Color(0xff4F59F8),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
