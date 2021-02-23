import 'package:flutter/material.dart';
// import 'package:Helper_Hiring_System/Screens/Login/login_screen.dart';
// import 'package:Helper_Hiring_System/Screens/Signup/signup_screen.dart';
import 'package:Helper_Hiring_System/Screens/Welcome/components/background.dart';
// import 'package:Helper_Hiring_System/components/rounded_button.dart';
import 'package:Helper_Hiring_System/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Helper_Hiring_System/home.dart';
import 'package:Helper_Hiring_System/helper_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class Body extends StatefulWidget {
  
  // final VoidCallback onSignedUp;
  final String name;
  final String email;
  final String contactno;
  final String state;
  final String city;
  final String password;
  Body({this.name, this.email, this.contactno, this.state, this.city, this.password});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              
              padding: EdgeInsets.fromLTRB(size.width * 0.05 ,size.height*0.04, size.width * 0.05, size.height*0.04),
              
              child: SvgPicture.asset(
                "assets/icons/chat.svg",
                
                height: size.height * 0.40,
              ),
            ),
            
            SizedBox(height: size.height * 0.05),

            Container(
              padding: EdgeInsets.all(size.width*0.06),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  Text(
                    "WHAT ARE YOU HERE FOR?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)
                  ),

                  SizedBox(height: size.height * 0.03),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: kPrimaryColor,
                        onPressed: ()async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool("pref"+ widget.email, true);
                        print("Employer Store Function Call!!!!!!!!!!!!!!!!!");
                        store();
                        Navigator.pop(context);
                        Navigator.push(context , MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text(
                          "I want a Helper",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: kPrimaryLightColor,
                        onPressed: ()async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool("pref"+widget.email, false);
                        print("Helper Store Function Call!!!!!!!!!!!!!!!!!");
                        helper_store();
                        Navigator.pop(context);
                        Navigator.push(context , MaterialPageRoute(builder: (context) => HelperHome()));
                        },
                        child: Text(
                          "I want a Job",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            

          ],

        ),
      ),
    );
  }

  Future<void> store() async {
    try{
      await FirebaseFirestore.instance
        .collection('employer')
        .doc(widget.email)
        .set(
        {'name': widget.name,'email': widget.email, 'password':widget.password,'contact no': widget.contactno, 'state':widget.state, 'city':widget.city});
    }
    catch(e){
      print("Error: " + e);
    }
    
  }

  Future<void> helper_store() async {
    try{
      await FirebaseFirestore.instance
        .collection('helper')
        .doc(widget.email)
        .set(
        {'name': widget.name,'email': widget.email, 'password':widget.password,'contact no': widget.contactno, 'state':widget.state, 'city':widget.city});
    }
    catch(e){
      print("Error: " + e);
    }
    
  }
  
}