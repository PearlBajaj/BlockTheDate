
import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/components/customAppBar.dart';
import 'package:block_the_date/components/lines.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(66.0),
        child: CustomAppBar(
          title: 'Notifications',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              ChatNotification(
                text:
                'Request for chat from from Mr. Abbas Shaikh (+91 98645 82945)',
              ),
              Line(),
              InviteNotification(
                text: 'Invitation for Birthday Party on Sept 21, 2020',
              ),
              Line(),
              ChatNotification(
                text:
                'Request for chat from from Mr. Krishnamurthy Iyer(+91 74207 75960)',
              ),
              Line(),
              InviteNotification(
                text:
                'Invitation for Marriage Anniversary Party on Sept 26, 2020',
              ),
              Line(),
              ReminderNotification(
                text:
                'Reminder: Team Meeting for UX Strategy & UI Design discussion',
              ),
              Line(),
              ChatNotification(
                text:
                'Request for chat from from Mr. Jaswinder Zuber Kaur(+91 38361 29781)',
              ),
              Line(),
              InviteNotification(
                text:
                'Invitation to Join Team Meeting on Sept 26, 2020 at 4:30',
              ),
              Line(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatNotification extends StatelessWidget {
  final String text;
  const ChatNotification({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 24,
          width: 24,
          child: Image.asset('images/chat.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(left:16.0,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 45,
                width: 292,
                child: Text(
                  text,
                  style: normalTextStyle(12, text3),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Accept',
                    style:boldTextStyle(12, appBlue),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Text(
                    'Reject',
                    style: boldTextStyle(12, reject),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class InviteNotification extends StatelessWidget {
  final String text;
  const InviteNotification({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 24,
          width: 24,
          child: Image.asset('images/event.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(left:16.0,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 45,
                width: 292,
                child: Text(
                  text,
                  style: normalTextStyle(12, text3),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,

                ),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: (){
                  // RespondScreen();
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      'Respond',
                      style: boldTextStyle(12, appBlue)
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ReminderNotification extends StatelessWidget {
  final String text;

  const ReminderNotification({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 24,
          width: 24,
          child: Image.asset('images/reminder.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(left:16.0,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 45,
                width: 292,
                child: Text(
                  text,
                  style: normalTextStyle(12, text3),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'View',
                    style: boldTextStyle(12, appBlue),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}



