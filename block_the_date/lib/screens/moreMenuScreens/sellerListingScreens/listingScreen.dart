import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/components/customBottomNavigationBar.dart';
import 'package:block_the_date/components/lines.dart';
import 'package:block_the_date/screens/moreMenuScreens/sellerListingScreens/newProductScreen.dart';
import 'package:block_the_date/screens/shopScreens/shopScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerListingScreen extends StatefulWidget {
  @override
  _SellerListingScreenState createState() => _SellerListingScreenState();
}

class _SellerListingScreenState extends State<SellerListingScreen> {
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
                child: CarouselSlider.builder(
                    options: CarouselOptions(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 100,
                        decoration: BoxDecoration(
                          color: const Color(0xff000000),
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter:
                              ColorFilter.mode(Color(0xff000000).withOpacity(0.6),
                                  BlendMode.dstATop),
                              image: AssetImage('images/bakersDelight.png')
                          ),
                        ),
                        // child: Padding(
                        //   padding: const EdgeInsets.only(left:4.0),
                        //   child: Image.asset('images/bakersDelight.png',
                        //      fit: BoxFit.fill,
                        //       color: Colors.black.withOpacity(0.32),
                        //       colorBlendMode: BlendMode.dstATop,
                        //   ),
                        // )
                      );
                    }),
          ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 26.0, left: 8),
                  child: Container(
                    child: IconButton(
                      icon: Transform.scale(
                        scale: 1.25,
                        child: ImageIcon(
                          AssetImage(
                            'images/clear.png',
                          ),
                          color: appWhite,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                ShopScreen(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 26.0, right: 16),
                  child: IconButton(
                    icon: Transform.scale(
                      scale: 1.25,
                      child: ImageIcon(
                        AssetImage('images/addImg.png'),
                        color: appWhite,
                        size: 24,
                      ),
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
                    icon: Transform.scale(
                        scale: 1.25,
                        child: ImageIcon(
                          AssetImage('images/edit.png'),
                          color: appWhite,
                          size: 24,
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                  child: Text(
                    'Birthday Party',
                    style: boldTextStyle(24, appWhite),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: appWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  ItemContainer(url: 'images/first.png', name: 'Chocolate Delight', address: 'Powai, Mumbai, Maharashtra 400076', price: 'Rs. 250/-',),
                  Line(),
                  ItemContainer(url: 'images/two.png', name: 'Dark Belgium', address: 'Powai, Mumbai, Maharashtra 400076', price: 'Rs. 300/-',),
                  Line(),
                  ItemContainer(url: 'images/three.png', name: 'Blueberry Delight', address: 'Powai, Mumbai, Maharashtra 400076', price: 'Rs. 350/-',),
                  Line(),
                  ItemContainer(url: 'images/four.png', name: 'Truffle & Nuts', address: 'Powai, Mumbai, Maharashtra 400076', price: 'Rs. 250/-',),
                  Line(),
                  ItemContainer(url: 'images/five.png', name: 'Strawberry Sprinkles', address: 'Powai, Mumbai, Maharashtra 400076', price: 'Rs. 200/-',),
                ],

              ),
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: ImageIcon(
          AssetImage('images/addProduct.png'),
        ),
        backgroundColor: appBlue,
        onPressed: (){
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => NewProductScreen(),
              transitionDuration: Duration(seconds: 0),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 4,),
    );
  }
}

class ItemContainer extends StatelessWidget {
  final String url;
  final String name;
  final String address;
  final String price;

  const ItemContainer({Key key, this.url, this.name, this.address, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0, bottom: 8),
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
                height: 56,
                width: 56,
                child: Image(image: AssetImage(url),fit: BoxFit.fill,)
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: Color(0xFf333333),
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: Text(
                    address,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: Color(0xFf3555555),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Expanded(child: Container(),),
            Text(price,
              style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: appBlue,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}

