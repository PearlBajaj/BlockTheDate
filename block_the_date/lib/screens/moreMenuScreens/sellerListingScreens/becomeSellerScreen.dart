import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/customAppBar.dart';
import 'package:block_the_date/screens/moreMenuScreens/moreScreen.dart';
import 'package:block_the_date/screens/moreMenuScreens/sellerListingScreens/listingScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BecomeSellerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(66.0),
        child: CustomNotificationAppBar(
          title: 'Become a Seller',
          leading: true,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:16.0,right: 16,top: 24),
            child: Container(
              height: MediaQuery.of(context).size.height/4.87,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffCCCCCC),
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ImageIcon(AssetImage('images/addVideo.png'),size: 48,color: appBlue,),
                  SizedBox(width: 24,),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Add Video',
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Color(0xff333333),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                          text: 'Upload a video up to 20 seconds',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: Color(0xff333333),
                          ),
                        ),
                      ])),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:16.0,right: 16,top: 16),
            child: Container(
              height: MediaQuery.of(context).size.height/4.87,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffCCCCCC),
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ImageIcon(AssetImage('images/addImage.png'),size: 48,color: appBlue,),
                  SizedBox(width: 24,),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Add Photo',
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Color(0xff333333),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                          text: 'Upload your profile picture',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: Color(0xff333333),
                          ),
                        ),
                      ])),
                ],
              ),
            ),
          ),
          Expanded(child: Container(),),
          SaveButton(onPressed: (){
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => SellerListingScreen(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
            // Navigator.pushNamed(context, 'SellerListing');
          },),
        ],
      ),
    );
  }
}
