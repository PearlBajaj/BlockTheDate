import 'package:block_the_date/components/constantColors.dart';
import 'package:block_the_date/components/customAppBar.dart';
import 'package:block_the_date/screens/moreMenuScreens/moreScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  String sel;
  final _profileFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(66.0),
        child: CustomAppBar(
          title: 'Profile',
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _profileFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'images/lady.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  radius: 48.0,
                  // backgroundImage: ,
                  backgroundColor: Color(0xffECECEC),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ProfileLabel(
                label: 'Full Name',
              ),
              ProfileFormField(),
              //SizedBox(height: 4,),
              ProfileLabel(
                label: 'Email Id',
              ),
              ProfileFormField(),
              // SizedBox(height: 4,),
              ProfileLabel(
                label: 'Mobile No.',
              ),
              ProfileFormField(),
              //SizedBox(height: 4,),
              ProfileLabel(
                label: 'Date of Birth',
              ),
              ProfileFormFieldIcon(),
              //SizedBox(height: 4,),
              ProfileLabel(
                label: 'Gender',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32,top: 8),
                child: Container(
                  height: 52,
                  child: DropdownButtonFormField<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: appBlue,
                      size: 24,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Select option',
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 12, color: Color(0xffAAAAAA)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    value: sel,
                    items: ["Female", "Male", "Others"]
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
                      setState(() => sel = value);
                    },
                  ),
                ),
              ),
              SaveButton( onPressed: (){
                Navigator.of(context).pop();
              },),
            ],
          ),
        ),
      ),
    );
  }
}
