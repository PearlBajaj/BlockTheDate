import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/screens/chatScreens/chatScreen.dart';
import 'package:block_the_date/screens/eventsScreens/eventsScreen.dart';
import 'package:block_the_date/screens/homeScreens/homeScreen.dart';
import 'package:block_the_date/screens/moreMenuScreens/moreScreen.dart';
import 'package:block_the_date/screens/shopScreens/shopScreen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  int index = 0;
  CustomBottomNavigationBar({this.index});
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 4) {
      _selectedIndex =4;
      showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
        ),
        context: context,
        builder: (BuildContext context) {
          return MoreScreen();
        },
      );
    }
    else if(index == 0){
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => HomeScreen(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    }
    else if(index == 1){
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => ChatScreen(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    }
    else if(index == 2){
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => EventScreen(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    }
    else if(index == 3){
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => ShopScreen(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: appBlue,
      unselectedItemColor: bottomNavNotActive,
      showUnselectedLabels: true,
      backgroundColor: appWhite,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('images/homeNav.png')),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('images/chatNav.png')),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('images/eventNav.png')),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('images/shopNav.png')),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('images/moreNav.png')),
          label: 'More',
        ),
      ],
    );
  }
}
