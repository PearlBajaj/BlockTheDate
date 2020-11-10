import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/logic/models.dart';
import 'package:block_the_date/screens/moreMenuScreens/moreScreen.dart';
import 'package:block_the_date/screens/moreMenuScreens/sellerListingScreens/listingScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class NewProductScreen extends StatefulWidget {
  @override
  _NewProductScreenState createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  String category;
  bool isSwitched = false;

  double topPadding(BuildContext context) {
    return 8;
  }

  double bottomPadding(BuildContext context) {
    return 8;
  }

  String dropdownValue = 'Donuts';

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
                                SellerListingScreen(),
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
      body: Container(
          height: MediaQuery.of(context).size.height * 100,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    FormLabel(label: 'Price'),
                    Padding(
                      padding: EdgeInsets.only(
                          top: topPadding(context), bottom: bottomPadding(context)),
                      child: SuffixFormField(
                        label: 'Add Price',
                        textInputType: TextInputType.number,
                      ),
                    ),
                    FormLabel(label: 'Category'),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 32.0,
                          right: 32,
                          top: topPadding(context),
                          bottom: bottomPadding(context)),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: textC),
                        ),
                        child: Stack(
                          children: [
                            DropdownButton<String>(
                              value: dropdownValue,
                              elevation: 16,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12, color: Color(0xff555555)),
                              underline: Container(
                                height: 0,
                              ),
                              icon:  Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: appWhite,
                                size: 24,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'Donuts',
                                'Cake',
                                'Pastry',
                                'Macaroons',
                                'Souffle',
                                'Others'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: appBlue,
                                  size: 24,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    FormLabel(label: 'Condition'),
                    Padding(
                      padding: EdgeInsets.only(
                          top: topPadding(context), bottom: bottomPadding(context)),
                      child: BasicFormField(
                        label: 'Enter Condition',
                        textInputType: TextInputType.number,
                        height: 40,
                      ),
                    ),
                    FormLabel(label: 'Location'),
                    Padding(
                      padding: EdgeInsets.only(
                          top: topPadding(context), bottom: bottomPadding(context)),
                      child: BasicFormField(
                        label: 'Enter Location',
                        textInputType: TextInputType.number,
                        height: 40,
                      ),
                    ),
                    FormLabel(label: 'Description'),
                    Padding(
                      padding: EdgeInsets.only(
                          top: topPadding(context), bottom: bottomPadding(context)),
                      child: BasicFormField(
                        label: 'Enter here ...',
                        textInputType: TextInputType.number,
                        height: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 12),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: topPadding(context), bottom: bottomPadding(context)),
                        child: ListTile(
                          title: Text(
                            'Offer Shipping',
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: appBlue.withOpacity(0.5),
                            activeColor: appBlue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 16.0, bottom: 8, right: 16),
                  child: SaveButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class FormLabel extends StatelessWidget {
  final String label;
  const FormLabel({Key key, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Text(label,
          style:
              GoogleFonts.montserrat(fontSize: 14, color: Color(0xff555555))),
    );
  }
}

class BasicFormField extends StatelessWidget {
  final String label;
  // final TextEditingController controller;
  final TextInputType textInputType;
  final double height;
  // final Function validator;

  const BasicFormField({Key key, this.label, this.textInputType, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: TextFormField(
          style: TextStyle(
            fontSize: 12,
          ),
          decoration: InputDecoration(
            hintText: label,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: textC)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: textC)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: textC)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: textC)),
          ),
          // controller: controller,
          keyboardType: textInputType,
          // validator: validator,
        ),
      ),
    );
  }
}

class SuffixFormField extends StatelessWidget {
  final String label;
  // final TextEditingController controller;
  final TextInputType textInputType;
  // final Function validator;

  const SuffixFormField({
    Key key,
    this.label,
    this.textInputType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:40,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: Stack(
          children: <Widget>[
            TextFormField(
              style: TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: label,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: textC)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: textC)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: textC)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: textC)),
              ),
              // controller: controller,
              keyboardType: textInputType,
              // validator: validator,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  'INR',
                  style: normalTextStyle(12, text5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
