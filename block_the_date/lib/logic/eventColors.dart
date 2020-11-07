import 'package:block_the_date/components/constantColors.dart';
import 'package:flutter/material.dart';

Color eventColor(String type) {
  if (type == 'Birthday' || type == 'Wedding' || type == 'Event') {
    return appLightBlue;
  } else if (type == 'Meeting') {
    return appRed;
  } else if (type == 'Task') {
    return appOrange;
  }
  return Colors.black;
}
