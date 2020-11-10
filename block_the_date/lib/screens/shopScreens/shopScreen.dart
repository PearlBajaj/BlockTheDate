import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/customBottomNavigationBar.dart';
import 'package:block_the_date/logic/models.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('images/map.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
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
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_back,
                              color: appBlue,
                            ),
                          ),
                          Text(
                            'Enter Location',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Color(0xffcccccc),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ImageIcon(
                              AssetImage('images/search.png'),
                              color: appBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24.0)),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return ShopsBottomScreen();
                        },
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0),
                        ),
                        color: Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffCCCCCC),
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 3.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                color: Color(0xffCCCCCC),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(24))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Shops',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: Color(0xff333333),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        index: 3,
      ),
    );
  }
}

class ShopsBottomScreen extends StatefulWidget {
  @override
  _ShopsBottomScreenState createState() => _ShopsBottomScreenState();
}

class _ShopsBottomScreenState extends State<ShopsBottomScreen> {
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
      'images/theCakeShop.png',
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
      'images/38Degrees.png',
    ),
    ShopDetails(
      'Mix & Match',
      '+91 95560 15881',
      'New Mhada Colony, Savarkar Nagar, Chandivali, Powai, Mumbai, Maharashtra 400076',
      'MR. Terry Marshall',
      3,
      'images/Mix&Match.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.15,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap:(){
                    Navigator.pushNamed(context, 'ShopList');
                  },
                  child: Container(
                    height: 3.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: Color(0xffCCCCCC),
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:12, left:16.0, bottom:12,right: 16),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Shops',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Color(0xff333333),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      ImageIcon(
                        AssetImage('images/filter.png'),
                        color: appBlue,
                      )
                    ],
                  ),
                ),
                CarouselSlider.builder(
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height / 4.5),
                    itemCount: _shopDetails.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'ShopList');
                        },
                        child: ShopContainer(
                          name: _shopDetails[index].name,
                          owner: _shopDetails[index].owner,
                          address:_shopDetails[index].address,
                          number: _shopDetails[index].number,
                          stars: _shopDetails[index].stars,
                          image: _shopDetails[index].image,
                        ),
                      );
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}

class ShopContainer extends StatelessWidget {
  final String name;
  final String number;
  final String address;
  final String owner;
  final int stars;
  final String image;

  const ShopContainer(
      {Key key,
        this.name,
        this.number,
        this.address,
        this.owner,
        this.stars,
        this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
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
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 4.5,
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text(
                      name,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  StarDisplay(
                    value: stars,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text(
                      owner,
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Color(0xff555555),
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text(
                      number,
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Color(0xff555555),
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text(
                      address,
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Color(0xff555555),
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return index < value
            ? Icon(
          Icons.star,
          color: Color(0xffFFC400),
          size: 14,
        )
            : Icon(
          Icons.star_border,
          color: Color(0xffCCCCCC),
          size: 14,
        );
      }),
    );
  }
}
