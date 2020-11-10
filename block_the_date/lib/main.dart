import 'package:block_the_date/screens/homeScreens/eventListScreen.dart';
import 'package:block_the_date/screens/homeScreens/homeScreen.dart';
import 'package:block_the_date/screens/homeScreens/notificationScreen.dart';
import 'package:block_the_date/screens/loginScreen.dart';
import 'package:block_the_date/screens/shopScreens/shopList.dart';
import 'package:block_the_date/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: <String,WidgetBuilder>{
        'Login':(BuildContext context) => LoginScreen(),
        'Home': (BuildContext context) => HomeScreen(),
        'ShopList': (BuildContext context) => ShopsList(),
        'Notification': (BuildContext context) => NotificationScreen(),
        'EventList': (BuildContext context) => EventListScreen(),
      },
    );
  }
}
