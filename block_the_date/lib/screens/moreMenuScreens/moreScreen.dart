import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/screens/loginScreen.dart';
import 'package:block_the_date/screens/moreMenuScreens/rsvpScreens/rsvpInvitesScreen.dart';
import 'package:block_the_date/screens/moreMenuScreens/sellerListingScreens/becomeSellerScreen.dart';
import 'package:block_the_date/screens/moreMenuScreens/sellerListingScreens/listingScreen.dart';
import 'package:block_the_date/screens/moreMenuScreens/viewProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 4.0,
              width: 40.0,
              decoration: BoxDecoration(
                  color: Color(0xffCCCCCC),
                  borderRadius: BorderRadius.all(Radius.circular(24))),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left:32.0),
              child: Column(
                children: [
                  Container(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: CircleAvatar(
                            child: ClipOval(
                              child: Image.asset('images/lady.png', fit: BoxFit.fitHeight,),
                            ),
                            radius: 28.0,
                            // backgroundImage: ,
                            backgroundColor: Color(0xffECECEC),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              UserNameText(name: 'Vrushali Pednekar'),
                              SizedBox(
                                height: 4,
                              ),
                              GestureDetector(
                                child: ViewProfileText(),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation1, animation2) => ViewProfile(),
                                      transitionDuration: Duration(seconds: 0),
                                    ),
                                  );
                                  // Navigator.pushNamed(context, 'Profile');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => RSVPInvitesScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                      // Navigator.pushReplacementNamed(context, 'RSVPInvites');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/rsvp.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        MenuListText(label: 'RSVP Invites'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: (){
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/pendingRequests.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        MenuListText(label: 'Pending Requests'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => BecomeSellerScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                      // Navigator.pushNamed(context, 'SellerListing');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/seller.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        MenuListText(label: 'Seller Listings'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/settings.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      MenuListText(label: 'Settings'),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => LoginScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/logout.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        MenuListText(label: 'Logout'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
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

class UserNameText extends StatelessWidget {
  final String name;
  const UserNameText({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
        name,
        style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff333333)
        )
    );
  }
}

class ViewProfileText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
        'View Profile',
        style: GoogleFonts.montserrat(
            fontSize: 12,
            color: Color(0xff0090FF)
        )
    );
  }
}

class MenuListText extends StatelessWidget {
  final String label;
  const MenuListText({Key key, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
        label,
        style: GoogleFonts.montserrat(
            fontSize: 14,
            color: Color(0xff333333)
        )
    );
  }
}

class ProfileLabel extends StatelessWidget {
  final String label;
  const ProfileLabel({Key key, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Text(
          label,
          style: GoogleFonts.montserrat(
              fontSize: 14,
              color: Color(0xff555555)
          )
      ),
    );
  }
}

class ProfileFormField extends StatelessWidget {
  // final String label;
  // final TextEditingController controller;
  // final TextInputType textInputType;
  // final Function validator;
  //
  // const ProfileFormField({Key key, this.label, this.controller, this.textInputType, this.validator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: TextFormField(
            style: TextStyle(
              fontSize: 12,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            // controller: controller,
            // keyboardType: textInputType,
            // validator: validator,
          ),
        ),
      ),
    );
  }
}
class ProfileFormFieldIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: TextFormField(
            style: TextStyle(
              fontSize: 12,
            ),
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.calendar_today_outlined,color: appBlue,size: 24,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            // controller: controller,
            // keyboardType: textInputType,
            // validator: validator,
          ),
        ),
      ),
    );
  }
}

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
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}



