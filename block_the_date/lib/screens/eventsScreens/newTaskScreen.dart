import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/components/customButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'eventsScreen.dart';

class NewTaskScreen extends StatefulWidget {
  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  Color _iconColor1 = textC;
  Color _iconColor2 = textC;
  Color _iconColor3 = textC;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height / 4.87),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Stack(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 100,
                  child: Image.asset(
                    'images/headerBanner.png',
                    fit: BoxFit.fill,
                  )),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 26.0, left: 16),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage(
                        'images/cancel_icon.png',
                      ),
                      color: appWhite,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              EventScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 26.0, left: 16),
                  child: IconButton(
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                      color: appWhite,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, right: 16),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit_rounded,
                      color: appWhite,
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                  child: Text(
                    '#BlockTheDateApp',
                    style: boldTextStyle(24, appWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height/18.57,
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: IconButton(
                    onPressed: (){

                    },
                    icon: ImageIcon(
                      AssetImage('images/addTasks.png'),
                      color: appBlue,
                    ),
                  ),
                  title: Text(
                    'Create Tasks',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Icon(Icons.add, color: appBlue,),
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: (){
                      setState(() {
                        if(_iconColor1 == Color(0xffcccccc)){
                          _iconColor1= Color(0xff79BF0F);
                        }
                        else{
                          _iconColor1 = Color(0xffcccccc);
                        }

                      });
                    },
                    icon: ImageIcon(
                      AssetImage('images/tick_grey.png'),
                      color: _iconColor1,
                    ),
                  ),
                  title: Text(
                    'Create Wireframes for App',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: ImageIcon(
                    AssetImage('images/dots.png'),
                    color: Color(0xff333333),
                  ),
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: (){
                      setState(() {
                        if(_iconColor2 == Color(0xffcccccc)){
                          _iconColor2 = Color(0xff79BF0F);
                        }
                        else{
                          _iconColor2 = Color(0xffcccccc);
                        }

                      });
                    },
                    icon: ImageIcon(
                      AssetImage('images/tick_grey.png'),
                      color: _iconColor2,
                    ),
                  ),
                  title: Text(
                    'Create High Fidelity User Interface',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: ImageIcon(
                    AssetImage('images/dots.png'),
                    color: Color(0xff333333),
                  ),
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: (){
                      setState(() {
                        if(_iconColor3 == Color(0xffcccccc)){
                          _iconColor3 = Color(0xff79BF0F);
                        }
                        else{
                          _iconColor3 = Color(0xffcccccc);
                        }

                      });
                    },
                    icon: ImageIcon(
                      AssetImage('images/tick_grey.png'),
                      color: _iconColor3,
                    ),
                  ),
                  title: Text(
                    'Create Prototype for User Testing',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: ImageIcon(
                    AssetImage('images/dots.png'),
                    color: Color(0xff333333),
                  ),
                ),
              ],
            ),
            Expanded(child: Container(),),
            SaveButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
