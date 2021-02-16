import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myjemisysapp/loginnext.dart';
import 'package:myjemisysapp/memberSearch.dart';
import 'package:myjemisysapp/model/common.dart';
import 'package:myjemisysapp/login.dart';
import 'data/dataService.dart';
import 'style.dart';

void main() => runApp(MaterialApp(
  home: SplashScreen(),
));

class SplashScreen extends StatefulWidget{
  @override
  _splashScreen createState() => _splashScreen();
}

class _splashScreen extends State<SplashScreen>{

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => DefaultScreen()
    )
    );

  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
    //this.getDefault();


    Timer(
      Duration(seconds: 4),route,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(

              colors: [Colors.pinkAccent, Colors.purpleAccent])),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  SpinKitThreeBounce(
                    color: Colors.white,
                  ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Text(
                      "Welcome",
                      style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 14),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
    ],
      ),
    );
    //return
  }
}
class DefaultScreen extends StatefulWidget{
  @override
  _defaultScreen createState() => _defaultScreen();
}
class _defaultScreen extends State<DefaultScreen>{
  bool isloadSetting;
  Future getDefault() async {
    DataService dataService = DataService();
    TextStorage common = TextStorage();
    await dataService.setDefault();
    var setting = await common.getSetting();
    if(setting != "File does not exists" && setting != "Couldn't read file")
    {
      isloadSetting =  true;
    }
    else {
      isloadSetting = false;
      //isloadSetting = true;
    }

  }

  @override
  void initState() {
    super.initState();
    setState(() {
      this.getDefault();
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isloadSetting== true ? next() : next(),
    );
  }
}