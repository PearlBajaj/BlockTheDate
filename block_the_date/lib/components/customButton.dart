import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function onPressed;

  const SaveButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom:16.0,top:24,right: 16),
        child: Container(
          width: 136,
          height: 40,
          child: RaisedButton(
            color: appBlue,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0),
            ),
            onPressed: onPressed,
            child: Text(
              'Save',
              style: textStyle4(14, appWhite),
            ),
          ),
        ),
      ),
    );
  }
}
