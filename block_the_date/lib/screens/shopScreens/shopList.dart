import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/logic/models.dart';
import 'package:block_the_date/screens/shopScreens/shopScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopsList extends StatelessWidget {
  final List<ShopDetails> _shopDetails = [
    ShopDetails(
      'Bakers Treat',
      '+91 88049 18227',
      'Shop No.1, Radhika Niwas, opposite IIT main gate, Powai, Mumbai, Maharashtra 400076',
      'George Dean',
      4,
      'images/bakersDelight.png',
    ),
    ShopDetails(
      'The Cake Shop',
      '+91 92473 18690',
      'Savarkar Nagar, Chandivali, Powai, Mumbai, Maharashtra 400072',
      'Mr. Bruce Lucas',
      4,
      'images/bakersDelight.png',
    ),
    ShopDetails(
      'The Party Hunters',
      '+91 86241 62909',
      'New Mhada Colony, Savarkar Nagar, Chandivali, Powai, Mumbai, Maharashtra 400076',
      'Nancy Garrett',
      4,
      'images/bakersDelight.png',
    ),
    ShopDetails(
      '38 Degree East',
      '+91 97725 95812',
      '1, Orchard Ave, Panchkutir Ganesh Nagar, Powai, Mumbai, Maharashtra 400076',
      'Eugene Grand',
      3,
      'images/bakersDelight.png',
    ),
    ShopDetails(
      'Mix & Match',
      '+91 95560 15881',
      'New Mhada Colony, Savarkar Nagar, Chandivali, Powai, Mumbai, Maharashtra 400076',
      'MR. Terry Marshall',
      3,
      'images/bakersDelight.png',
    ),
  ];
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
          title: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Shops',
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w500),
            ),
          ),
          backgroundColor: appBlue,
          actions: <Widget>[
            IconButton(
                icon: ImageIcon(
                  AssetImage('images/filter.png'),
                  color: Colors.white,
                )
            ),
            IconButton(
                icon: ImageIcon(
                  AssetImage('images/search.png'),
                  color: Colors.white,
                )
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: _shopDetails.length,
          itemBuilder: (context,index){
            return ShopContainer(
              name: _shopDetails[index].name,
              owner: _shopDetails[index].owner,
              address:_shopDetails[index].address,
              number: _shopDetails[index].number,
              stars: _shopDetails[index].stars,
              image: _shopDetails[index].image,
            );
          }
      ),
    );
  }
}

