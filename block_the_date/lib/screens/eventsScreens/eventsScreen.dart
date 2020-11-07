import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/components/customAppBar.dart';
import 'package:block_the_date/components/customBottomNavigationBar.dart';
import 'package:block_the_date/logic/dateFuntions.dart';
import 'package:block_the_date/screens/eventsScreens/newEventScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'newTaskScreen.dart';


class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
   Color monthlyIconColor = appBlue;
   Color dailyIconColor = textC;
   Color weeklyIconColor = textC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(66.0),
        child: CustomNotificationAppBar(
          title: 'Event Calendar',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: DateTime.now().year.toString(),
                              style: normalTextStyle(12, textA)
                            ),
                            TextSpan(
                              text: '\n',
                            ),
                            TextSpan(
                              text: monthGetter(DateTime.now().month),
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
                    )
                  ],
                ),
              ],
            ),
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
