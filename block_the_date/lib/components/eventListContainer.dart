import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/components/lines.dart';
import 'package:block_the_date/logic/eventColors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventListContainer extends StatelessWidget {
  final String type;
  final String description;
  final String date;
  final String time;
  const EventListContainer(
      {Key key, this.type, this.description, this.date, this.time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 20),
        child: Container(
          height: 50,
          width: 50,
          child: Text(
            DateFormat("hh:mm a").format(DateTime.parse(time)),
            style: normalTextStyle(12, text3),
          ),
        ),
      ),
      Container(
          width: 276,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                type,
                style: normalTextStyle(
                  12,
                  eventColor(type),
                ),
              ),
              Text(
                description,
                style: normalTextStyle(12, text3),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
    ]);
    ;
  }
}
