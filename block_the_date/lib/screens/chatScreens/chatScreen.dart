import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/components/customAppBar.dart';
import 'package:block_the_date/components/customBottomNavigationBar.dart';
import 'package:block_the_date/logic/models.dart';
import 'package:block_the_date/screens/chatScreens/dmScreen.dart';
import 'package:block_the_date/screens/chatScreens/requestsScreen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final List<ChatModel> _Chats = [
    ChatModel('Amey Joshi', 'Hi, It\'s good to here back from you.', '02:56 PM'),
    ChatModel('Sunny Chawla', 'Hi, It\'s good to here back from you.', '12:32 PM'),
    ChatModel('Anrea D\'souza', 'Hi, It\'s good to here back from you.', '09:12 PM'),
    ChatModel('Keanu Garrett', 'Lorem ipsum dolor sit amet, consetetur', 'Yesterday'),
    ChatModel('Joan Fox', 'Lorem ipsum dolor sit amet, consetetur', '25/10/2020'),
    ChatModel('Denise Fisher', 'Lorem ipsum dolor sit amet, consetetur', '25/10/2020'),
    ChatModel('Nicholas Cunningham', 'Lorem ipsum dolor sit amet, consetetur', '24/10/2020'),
    ChatModel('Denise Bailey', 'Lorem ipsum dolor sit amet, consetetur', '23/10/2020'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Chats',
                          style: boldTextStyle(16, appBlue)
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => RequestScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Text('Requests',
                        style: boldTextStyle(16, textA)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:35.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: _Chats.length,
                    itemBuilder:
                        (BuildContext context, int index) {
                      return ChatContainer(
                        name: _Chats[index].name,
                        text: _Chats[index].text,
                        time: _Chats[index].time,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 1),
    );
  }
}

class ChatContainer extends StatelessWidget {
  final String name;
  final String text;
  final String time;
  const ChatContainer({Key key, this.name, this.text, this.time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => DMScreen(name:name),
            transitionDuration: Duration(seconds: 0),
          ),
        );
      },
      child: Container(
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
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Row(
                      children: <Widget>[
                        Text(name,
                            style: normalTextStyle(14, text3)),
                        Expanded(
                          child: Container(),
                        ),
                        Text(time,
                          style: textStyle3(10, textA)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      text,
                      style: textStyle3(12, text5),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
            ),
          ],
        ),
      ),
    );
  }
}
