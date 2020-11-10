import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DMScreen extends StatefulWidget {
  final String name;
  final String image;
  const DMScreen({this.name, this.image});

  @override
  _DMScreenState createState() => _DMScreenState();
}

class _DMScreenState extends State<DMScreen> {
  TextEditingController messageController = TextEditingController();
  String image;
  @override
  initState() {
    image = widget.image;
    print(image);
    messageController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(66.0),
        child: AppBar(
          centerTitle: false,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    radius: 28.0,
                    // backgroundImage: ,
                    backgroundColor: Color(0xffECECEC),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left:12.0),
                  child: Text(
                    widget.name,
                    style: boldTextStyle(16, appWhite),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          backgroundColor: appBlue,
        ),
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 12,
          ),
          Center(
            child: Text(
              'Today',
              style: normalTextStyle(10, text5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0, right: 12),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  color: chatBoxSent,
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 8.0, left: 16, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hello! My name is John Doe.',
                        style: normalTextStyle(14, text3),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '12:45 pm',
                              style: normalTextStyle(12, text6),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              height: 16,
                              width: 16,
                              child: Image.asset('images/doubleTick.png'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  width: MediaQuery.of(context).size.width / 1.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                    color: chatBoxReceive,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 16, bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hello! My name is Andrea S\'souza.',
                          style: normalTextStyle(14, text3),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '01:05 pm',
                                  style: normalTextStyle(12, text6),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 12),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  color: chatBoxSent,
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 8.0, left: 16, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hi, It\'s good to here back from you.',
                        style: normalTextStyle(14, text3),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '02:56 pm',
                              style: normalTextStyle(12, text6),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              height: 16,
                              width: 16,
                              child: Image.asset('images/tick.png'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 12),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width / 3.13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  color: chatBoxSent,
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 8.0, left: 16, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '...',
                        style: boldTextStyle(14, text3),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '05:45 pm',
                              style: normalTextStyle(12, text6),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: Container(),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.14,
                  child: TextFormField(
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Color(0xff555555),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Transform.scale(
                        scale: 0.75,
                        child: ImageIcon(
                          AssetImage(
                            'images/emoji.png',
                          ),
                          color: appBlue,
                        ),
                      ),
                      suffixIcon: Transform.scale(
                        scale: 0.75,
                        child: ImageIcon(
                          AssetImage(
                            'images/attachments.png',
                          ),
                          color: appBlue,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    controller: messageController,
                    keyboardType: TextInputType.text,
                  ),
                ),
                ImageIcon(
                  AssetImage(
                    'images/sendRequest.png',
                  ),
                  color: appBlue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
