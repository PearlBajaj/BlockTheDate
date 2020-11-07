import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/components/customAppBar.dart';
import 'package:block_the_date/components/customBottomNavigationBar.dart';
import 'package:block_the_date/logic/models.dart';
import 'package:block_the_date/screens/chatScreens/chatScreen.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  final List<RequestModel> _Requests = [
    RequestModel('Amey Joshi', '(393)120-9367'),
    RequestModel('Sunny Chawla', '(462)842-0138'),
    RequestModel('Anrea D\'souza', '(480)450-5109'),
    RequestModel('Keanu Garrett', '(002)454-4138'),
    RequestModel('Joan Fox', '(002)454-4138'),
    RequestModel('Denise Fisher', '(053)767-5865'),
    RequestModel('Nicholas Cunningham', '(053)767-5865'),
    RequestModel('Denise Bailey', '(053)767-5865'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(66.0),
          child: CustomNotificationAppBar(
            title: 'Chat',
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Stack(
          children: [
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => ChatScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Text('Chats', style: boldTextStyle(16, textA)),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Requests',
                        style: boldTextStyle(16, appBlue),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 2.0,
                        width: 64,
                        decoration: BoxDecoration(
                            color: appBlue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:35.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: _Requests.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RequestContainer(
                        name: _Requests[index].name,
                        number: _Requests[index].number,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        index: 1,
      ),
    );
  }
}

class RequestContainer extends StatelessWidget {
  final String name;
  final String number;

  const RequestContainer({Key key, this.name, this.number}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Row(
        children: <Widget>[
          Container(
            height: 47,
            width: 47,
            child: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/lady.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              radius: 28.0,
              // backgroundImage: ,
              backgroundColor: Color(0xffECECEC),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 30,
          ),
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: normalTextStyle(14, text3),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(number, style: textStyle3(10, text5)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: appBlue,
                      ),
                      child: Image.asset(
                        'images/sendRequest1.png',
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 1.0,
                decoration: BoxDecoration(
                    color: textC,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
