import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './Animation/FadeAnimation.dart';

class HomePage10 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff21254A),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            child: Stack(
              children: <Widget>[
                Positioned(
                    child: FadeAnimation(
                      1,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/1.png"),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  1,
                  Text(
                    "Hello there, \nwelcome back",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FadeAnimation(
                  1.5,
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[100],
                              ),
                            ),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "User ID",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[100],
                              ),
                            ),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: FadeAnimation(
                    1,
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.pink[200],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FadeAnimation(
                  1,
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FadeAnimation(
                  1,
                  Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.pink[200],
                      ),
                    ),
                  ),
                ),
               SizedBox(height:15),
                FadeAnimation(1.5,   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OutlineButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 30.0,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue),
                      color: Colors.blue,
                      highlightedBorderColor: Colors.blue,
                      textColor: Colors.blue,
                      icon: Icon(
                        FontAwesomeIcons.twitter,
                        size: 18.0,
                      ),
                      label: Text("   Twitter  "),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20.0),
                    OutlineButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 30.0,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      highlightedBorderColor: Colors.indigo,
                      borderSide: BorderSide(color: Colors.indigo),
                      color: Colors.indigo,
                      textColor: Colors.indigo,
                      icon: Icon(
                        FontAwesomeIcons.facebookF,
                        size: 18.0,
                      ),
                      label: Text("Facebook"),
                      onPressed: () {},
                    ),
                  ],
                ),),
                SizedBox(height:4),
                FadeAnimation(1.5,   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OutlineButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 30.0,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.red),
                      color: Colors.red,
                      highlightedBorderColor: Colors.red,
                      textColor: Colors.red,
                      icon: Icon(
                        FontAwesomeIcons.google,
                        size: 18.0,
                      ),
                      label: Text("   Google  "),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20.0),
                    OutlineButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 30.0,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      highlightedBorderColor: Colors.white,
                      borderSide: BorderSide(color: Colors.white),
                      color: Colors.white,
                      textColor: Colors.white,
                      icon: Icon(
                        FontAwesomeIcons.apple,
                        size: 18.0,
                      ),
                      label: Text("    Apple   "),
                      onPressed: () {},
                    ),
                  ],
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}