import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/components/customAppBar.dart';
import 'package:block_the_date/components/customBottomNavigationBar.dart';
import 'package:block_the_date/logic/models.dart';
import 'package:block_the_date/screens/chatScreens/chatScreen.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  final List<RequestModel> _Requests = [
    RequestModel('Amey Joshi', '(393)120-9367', 'male'),
    RequestModel('Sunny Chawla', '(462)842-0138','male'),
    RequestModel('Anrea D\'souza', '(480)450-5109','female'),
    RequestModel('Keanu Garrett', '(002)454-4138','male'),
    RequestModel('Nicholas Cunningham', '(824)558-6793','male'),
    RequestModel('Joan Fox', '(053)767-5865','female'),
    RequestModel('Alex Woodkin', '(215)356-6809', 'male'),
    RequestModel('Joe Palmer', '(395)860-2519', 'female'),
    RequestModel('Ryan Hart', '(945)76-6514', 'male'),
    RequestModel('Eliza Fuller', '(255)935-6012', 'female'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(66.0),
          child: CustomNotificationAppBar(
            title: 'Chat',
            leading: false,
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
              child: Padding(
                padding: const EdgeInsets.only(top:8,right:16.0,left: 16),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: _Requests.length,
                      itemBuilder: (BuildContext context, int index) {
                        if(index < (_Requests.length-1)){
                          return Column(
                            children: <Widget>[
                              RequestContainer(
                          name: _Requests[index].name,
                            number: _Requests[index].number,
                            gender: _Requests[index].gender,
                          ),
                              SizedBox(height: 16,),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: MediaQuery.of(context).size.width/1.3,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                      color: textC,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(24))),
                                ),
                              ),
                              SizedBox(height: 16,),
                            ],
                          );
                        }
                        else{
                          return Padding(
                            padding: const EdgeInsets.only(bottom:16.0),
                            child: RequestContainer(
                              name: _Requests[index].name,
                              number: _Requests[index].number,
                              gender: _Requests[index].gender,
                            ),
                          );
                        }
                      }),
                ),
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
  final String gender;

  String imageGetter(String gender) {
    if (gender == 'male') {
      return 'images/male.png';
    } else if (gender == 'female') {
      return 'images/female.png';
    } else
      return null;
  }

  const RequestContainer({Key key, this.name, this.number, this.gender}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 47,
            width: 47,
            child: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  imageGetter(gender),
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
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                Center(
                  child: Container(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
