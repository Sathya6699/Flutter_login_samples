

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myjemisysapp/widgets/signup5.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myjemisysapp/widgets//bezierContainer.dart';

class LoginPage5 extends StatefulWidget {
  LoginPage5({Key key, this.title}) : super(key: key);


  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage5> {

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
        ),
     ]
        ),),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey)
              ))
          ),  ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 1,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    SizedBox(height: 10,);
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
       child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

        RaisedButton.icon(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0)),
    color: Colors.red,
    icon: Icon(
    FontAwesomeIcons.google,
    color: Colors.white,
    ),

    label: Text(
    "  Google  ",
    style: TextStyle(color: Colors.white),
    ),
    onPressed: () {},
    ), SizedBox(width: 100.0,),
    RaisedButton.icon(
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(2.0)),
    color: Colors.indigo,
    icon: Icon(
    FontAwesomeIcons.facebook,
    color: Colors.white,
    ),
    label: Text(
    "Facebook",
    style: TextStyle(color: Colors.white),
    ),
    onPressed: () {},
    ),

              ],));
  }
  Widget _twitterButton() {
    SizedBox(height: 10,);
    return Container(
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0)),
              color: Colors.white,
              icon: Icon(
                FontAwesomeIcons.apple,
                color: Colors.black,

              ),
              label: Text(
                "    Apple   ",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {},
            ),
            SizedBox(width: 100.0),
            RaisedButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0)),
              color: Colors.blue,
              icon: Icon(
                FontAwesomeIcons.twitter,
                color: Colors.white,
              ),
              label: Text(
                "   Twitter  ",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ],));
  }
  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
       // Navigator.push(
        //    context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0),
        padding: EdgeInsets.all(0),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 2,),
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'J',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'EMi',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'Sys',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("User ID"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    @override
    Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      double screenhight = MediaQuery
          .of(context)
          .size
          .height;
    }

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height:MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      _title(),
                      SizedBox(height: 40),
                      _emailPasswordWidget(),
                      SizedBox(height: 20),
                      _submitButton(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password ?',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                      ),
                      _divider(),
                      _facebookButton(),
                      _twitterButton(),
                      SizedBox(height: height * .03),
                      _createAccountLabel(),
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ));
  }
}