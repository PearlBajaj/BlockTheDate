import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/constantTextStyles.dart';
import 'package:block_the_date/screens/moreMenuScreens/moreScreen.dart';
import 'package:block_the_date/screens/moreMenuScreens/sellerListingScreens/listingScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewProductScreen extends StatefulWidget {
  @override
  _NewProductScreenState createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  String category;
  bool isSwitched = false;
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
                        child: Padding(
                          padding: const EdgeInsets.only(left:4.0, right: 4),
                          child: Image.asset(
                            'images/bakersDelight.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 26.0, left: 16),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage(
                        'images/cancel_icon.png',
                      ),
                      color: appWhite,
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
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 26.0, left: 16),
                  child: IconButton(
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                      color: appWhite,
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
                    icon: Icon(
                      Icons.edit_rounded,
                      color: appWhite,
                      size: 24,
                    ),
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
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16,),
              FormLabel(label: 'Price'),
              SuffixFormField(
                label: 'Add Price',
                textInputType: TextInputType.number,
              ),
              FormLabel(label: 'Category'),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32,top: 2,bottom: 6),
                child: Container(
                  height: 52,
                  child: DropdownButtonFormField<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: appBlue,
                      size: 24,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Enter Category',
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 12, color: Color(0xff555555)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    value: category,
                    items: ["Donut", "Cake",'Pastry,','Macaroons',"Others"]
                        .map((label) => DropdownMenuItem(
                      child: Text(
                        label,
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Color(0xff555555),
                        ),
                      ),
                      value: label,
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => category = value);
                    },
                  ),
                ),
              ),
              FormLabel(label: 'Condition'),
              BasicFormField(
                label: 'Enter Condition',
                textInputType: TextInputType.number,
                height: 40,
              ),
              FormLabel(label: 'Location'),
              BasicFormField(
                label: 'Enter Location',
                textInputType: TextInputType.number,
                height: 40,
              ),
              FormLabel(label: 'Description'),
              BasicFormField(
                label: 'Enter here ...',
                textInputType: TextInputType.number,
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 12),
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
              Expanded(child: Container(),),
              Padding(
                padding: const EdgeInsets.only(left:16.0,bottom: 6,right: 16),
                child: SaveButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          )
      ),
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

class BasicFormField extends StatelessWidget {
  final String label;
  // final TextEditingController controller;
  final TextInputType textInputType;
  final double height;
  // final Function validator;

  const BasicFormField({Key key, this.label, this.textInputType, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:2.0,bottom: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: TextFormField(
            style: TextStyle(
              fontSize: 12,
            ),
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            // controller: controller,
            keyboardType: textInputType,
            // validator: validator,
          ),
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

  const SuffixFormField({Key key, this.label, this.textInputType,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:2.0,bottom: 8.0),
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
              labelText: label,
              suffixText: 'INR',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            // controller: controller,
            keyboardType: textInputType,
            // validator: validator,
          ),
        ),
      ),
    );
  }
}
