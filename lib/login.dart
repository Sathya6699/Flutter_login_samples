
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myjemisysapp/Message.dart';
import 'package:myjemisysapp/lib/colors1.dart';
import 'package:myjemisysapp/loginnext.dart';
import 'package:myjemisysapp/model/common.dart';
import 'package:myjemisysapp/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/dataobject.dart';
import 'package:myjemisysapp/data/dataService.dart';
import 'package:myjemisysapp/model/dataobject.dart';
import 'package:flutter/widgets.dart';

import 'style.dart';

class Login extends StatefulWidget{
  final Function function;

  Login({Key key, this.function, List<Color> pickerColors, void Function(List<Color> colors) onColorsChanged}) : super(key: key);

  @override
  _login createState() => _login();

}
enum LoginType  { A, B, C, D}

class _login extends State<Login> {

  final GlobalKey<State> _keyLoaderLogin = new GlobalKey<State>();
  DataService dataService = DataService();
  TextStorage commonFn = TextStorage();
  DeviceLog Dlog = DeviceLog();
  TextEditingController txtuserid = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  bool isSwitched = false;
  bool isBioEnabled = true;
  int _currentIndex = 3;
  int loginCounter = 0;
  LoginType _LoginType = LoginType.A;
  bool _hasBiometricsSupport = false;

  Future<String> getDefault() async {
    Dlog = (await commonFn.getSetting());
    if (Dlog.userId != null) {
      //dlog = DeviceLog.fromJson(jsonDecode(setting));
      if (Dlog.stayLogin != null) {
        setState(() {
          txtuserid.text = Dlog.userId;
          if (Dlog.stayLogin == true) {
            txtpassword.text = Dlog.password;
            isSwitched = Dlog.stayLogin == null ? false : Dlog.stayLogin;
          }
        });
      }
    }
  }

  Future<String> checkLogin() async {
    String res = "Failed";
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (txtuserid.text != null && txtuserid.text != '' &&
        txtpassword.text != null && txtpassword.text != '') {
      Dialogs.Dialogshow(context, _keyLoaderLogin); //invoking go

      Users param = Users();
      param.userID = txtuserid.text.trim();
      param.password = txtpassword.text.trim();
      param.macID = "RAJA-LENOVO";
      param.deviceName = "RAJA-LENOVO";
      param.connectionString = gconnectionstring;
      print(param.toParam());
      var dt = await dataService.GetUserData(param);
      print(dt.returnStatus);
      if (dt.returnStatus != null && dt.returnStatus == 'OK') {
        gUserName = dt.description;
        IsLogin = "Y";
        Navigator.of(_keyLoaderLogin.currentContext, rootNavigator: true)
            .pop(); //close the dialoge
        Navigator.pop(context, dt.description);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => next()), (
            Route<dynamic> route) => false);
        res = 'OK';
        setState(() {
          //prefs.setInt('loginCounter', (isBioEnabled) ? 1 : 0);
          //prefs.setString('userID', txtuserid.text.trim());
          //prefs.setString('password', txtpassword.text.trim());
          // prefs.setBool('bioEnabled', isBioEnabled);
        });
      }
      else {
        Navigator.of(_keyLoaderLogin.currentContext, rootNavigator: true)
            .pop(); //close the dialoge
        showInfoFlushbar(context, dt.returnStatus);
        IsLogin = "N";
      }
    }
    return res;
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
    this.getDefault();
  }

  @override
  Widget build(BuildContext context) {
   /*   SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      double screenhight = MediaQuery.of(context).size.height;*/

    return Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
       //       height:MediaQuery.of(context).size.height,
              child: Column(),
              width: double.infinity,
            ),

            Stack(

              children: <Widget>[
                ClipPath(

                  clipper: WaveClipper2(),

                  child: Container(

                    child: Column(),

                    width: double.infinity,

                    height: 350,

                    decoration: BoxDecoration(

                        gradient: LinearGradient(

                            colors: [primary2Color, pop2])),

                  ),

                ),

                ClipPath(

                  clipper: WaveClipper3(),

                  child: Container(

                    child: Column(),

                    width: double.infinity,

                    height: 350,

                    decoration: BoxDecoration(

                        gradient: LinearGradient(

                            colors: [primary2Color, Colors.grey.shade200])),

                  ),

                ),

                ClipPath(

                  clipper: WaveClipper1(),

                  child: Container(

                    child: Column(

                      children: <Widget>[

                        SizedBox(

                          height: 60,width: 0,

                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FlatButton.icon(
                              label: const Text('A', maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      color: Colors.black)),
                              icon: Radio(
                                activeColor: Colors.black,
                                visualDensity: VisualDensity(
                                    horizontal: -4.0, vertical: -4.0),
                                groupValue: _LoginType,
                                value: LoginType.A,
                                onChanged: (LoginType value) {
                                  setState(() {
                                    _LoginType = LoginType.A;
                                    primary2Color = Colors.blueGrey;
                                    accent2Color = Colors.grey;
                                    pop2 = Colors.white12;
                                  });
                                },
                              ),
                              onPressed: () {
                                setState(() {

                                });
                              },
                            ),
                            SizedBox(width: 1,),
                            FlatButton.icon(
                              label: const Text('B', maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      color: Colors.black)),
                              icon: Radio(
                                visualDensity: VisualDensity(
                                    horizontal: -4.0, vertical: -4.0),
                                activeColor: Colors.black,
                                value: LoginType.B,
                                groupValue: _LoginType,
                                onChanged: (LoginType value) {
                                  setState(() {
                                    _LoginType = LoginType.B;
                                    primary2Color = Colors.purple;
                                    accent2Color = Colors.purpleAccent.shade200;
                                    pop2 = Colors.white12;
                                  });
                                },
                              ),
                              onPressed: () {
                                setState(() {

                                });
                              },
                            ),
                            SizedBox(width:1),
                            FlatButton.icon(
                              label: const Text('C', maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      color: Colors.black)),
                              icon: Radio(
                                activeColor: Colors.black,
                                visualDensity: VisualDensity(
                                    horizontal: -4.0, vertical: -4.0),
                                groupValue: _LoginType,
                                value: LoginType.C,
                                onChanged: (LoginType value) {
                                  setState(() {
                                    _LoginType = LoginType.C;
                                    primary2Color = Colors.blue;
                                    accent2Color = Colors.blueAccent.shade200;
                                     pop2: Colors.blueAccent;
                                  });
                                },
                              ),
                              onPressed: () {
                                setState(() {

                                });
                              },
                            ),
                            SizedBox(width: 1,),
                            FlatButton.icon(
                              label: const Text('D', maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      color: Colors.black)),
                              icon: Radio(
                                activeColor: Colors.black,
                                visualDensity: VisualDensity(
                                    horizontal: -4.0, vertical: -4.0),
                                groupValue: _LoginType,
                                value: LoginType.D,
                                onChanged: (LoginType value) {
                                  setState(() {
                                    _LoginType = LoginType.D;
                                    primary2Color = Colors.orange;
                                    accent2Color = Colors.orangeAccent.shade200;
                                    pop2: Colors.orangeAccent;
                                  });
                                },
                              ),
                              onPressed: () {
                                setState(() {

                                });
                              },
                            ),

                          ],
                        ),
                        SizedBox(width:1),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  titlePadding: const EdgeInsets.all(0.0),
                                  contentPadding: const EdgeInsets.all(0.0),
                                  content: SingleChildScrollView(
                                    child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              ColorPicker(
                                                pickerColor: primary2Color,
                                                onColorChanged: changeprimary2Color,
                                                colorPickerWidth: 300.0,
                                                pickerAreaHeightPercent: 0.5,
                                                enableAlpha: true,
                                                displayThumbColor: true,
                                                showLabel: true,
                                                paletteType: PaletteType.hsv,
                                                pickerAreaBorderRadius: const BorderRadius
                                                    .only(
                                                  topLeft: const Radius
                                                      .circular(2.0),
                                                  topRight: const Radius
                                                      .circular(2.0),
                                                ),
                                              ),
                                              ColorPicker(
                                                pickerColor: accent2Color,
                                                onColorChanged: changeaccent2Color,
                                                colorPickerWidth: 300.0,
                                                pickerAreaHeightPercent: 0.5,
                                                enableAlpha: true,
                                                displayThumbColor: true,
                                                showLabel: true,
                                                paletteType: PaletteType.hsv,
                                                pickerAreaBorderRadius: const BorderRadius
                                                    .only(
                                                  topLeft: const Radius
                                                      .circular(2.0),
                                                  topRight: const Radius
                                                      .circular(2.0),
                                                ),
                                              ),

                                            ],
                                          ),
                                          Positioned(
                                            left: 5.0,
                                            bottom: 1.0,
                                            child: Material(
                                              color: buttonColor,
                                              child: InkWell(
                                                onTap: () {
                                                  setMenuColor(
                                                      primary2Color.toString(),
                                                      accent2Color.toString(),
                                                  );
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      9.0),
                                                  child: Text("Apply",
                                                    style: TextStyle(
                                                        color: buttonTextColor),),
                                                ),
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child:
                              Text("Picker", style: TextStyle(
                                  fontSize: 12,color: Colors.black)),
                            ),
                          ),
                        ),
                        SizedBox(

                          height: 0,

                        ),
                        Icon(

                          Icons.supervised_user_circle,

                          color: Colors.white,

                          size: 50,

                        ),

                        SizedBox(

                          height: 10,

                        ),
                        Text(

                          "Login",

                          style: TextStyle(

                              color: Colors.white,

                              fontWeight: FontWeight.w700,

                              fontSize: 25),

                        ),

                      ],

                    ),

                    width: double.infinity,

                    height: 350,

                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [primary2Color, accent2Color])),
                  ),

                ),

              ],

            ),

            SizedBox(

                height: 0),

            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 35, 0),
              child: TextField(
                controller: txtuserid,
                cursorColor: primary2Color,
                decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                    ),
                    prefixIcon: Icon(Icons.person, color: primary2Color,),
                    labelText: 'User ID',
                    labelStyle: TextStyle(color: accent2Color),
                    focusColor: accent2Color,
                    fillColor: accent2Color,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: accent2Color)
                    )
                ),
              ),
            ),
            SizedBox(height: 2),
            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 35, 0),
              child: TextField(
                obscureText: true,
                controller: txtpassword,
                cursorColor: primary2Color,
                decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                    ),
                    prefixIcon: Icon(Icons.lock, color: primary2Color),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: accent2Color),
                    focusColor: accent2Color,
                    fillColor: accent2Color,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: accent2Color)
                    )
                ),
              ),
            ),
            SizedBox(

              height: 15,

            ),

            Padding(

              padding: EdgeInsets.symmetric(horizontal: 32),

              child: Container(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: SizedBox(
                            width: 165,
                            //height: 49,
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                side: BorderSide(color: accent2Color),
                              ),
                              color: accent2Color,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(14.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                checkLogin();
                             //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Message()), (Route<dynamic> route) => false);
                              },
                            ),
                          )
                      ),
                      SizedBox(width: 15,),
                      Container(
                          child:
                          IconButton(
                            icon: Icon(Icons.fingerprint),
                            iconSize: 45,
                            color: Colors.grey,
                            onPressed: () async {

                            },
                          )
                      )
                    ],
                  )
              ),),
            SizedBox(height: 20,),

            Center(

              child: Text("Forgot Password?", style: TextStyle(
                  color: accent2Color, fontSize: 12, fontWeight: FontWeight.w700),),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                Text("Don't have an Account? ", style: TextStyle(
                    color: accent2Color, fontSize: 12, fontWeight: FontWeight.normal),),

                Text("Sign Up ", style: TextStyle(color: accent2Color,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    decoration: TextDecoration.underline)),
              ],
            ),
            SizedBox(height: 25,),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10, left: 35),
                    height: 1,
                    color: accent2Color,
                  ),
                ),
                Text('or Sign in with'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 35),
                    height: 1,
                    color: primary2Color,
                  ),
                )
              ],
            ),
            SizedBox(height: 25,),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child:
                          SignInButton(Buttons.Apple,
                            mini: true,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child:
                          SignInButton(Buttons.Facebook,
                            mini: true,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                            child:
                            SignInButton(Buttons.Twitter,
                              mini: true,
                              onPressed: () {},
                            )
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(

                          child:

                          SignInButton(Buttons.Email,
                            mini: true,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width:20.0),
                      ],
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }


  void changeprimary2Color(Color color) => setState(() => primary2Color = color);
  void changeaccent2Color(Color color) => setState(() => accent2Color = color);
  void changepop2(Color color) => setState(() => pop2 = color);
  void changetertiary2Color(Color color) => setState(() => tertiary2Color = color);
  void changesecondary2Color(Color color) => setState(() => secondary2Color = color);
  void changepops(Color color) => setState(() => pops = color);}
  void showInfoFlushbar(BuildContext context, String msg) {
  Flushbar(
  title: 'Failed to login',
  message: '$msg',
  icon: Icon(
  Icons.info_outline,
  size: 28,
  color: primary2Color
  ),
  leftBarIndicatorColor:primary2Color,
  duration: Duration(seconds: 3),
  )..show(context);
  }


class WaveClipper1 extends CustomClipper<Path> {

  @override

  Path getClip(Size size) {

    final path = Path();

    path.lineTo(0.0, size.height - 50);



    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);

    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,

        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);

    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,

        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override

  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return false;

  }

}

class WaveClipper3 extends CustomClipper<Path> {

  @override

  Path getClip(Size size) {

    final path = Path();

    path.lineTo(0.0, size.height - 50);


    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);

    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,

        firstEndPoint.dx, firstEndPoint.dy);


    var secondEndPoint = Offset(size.width, size.height - 40);

    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,

        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0);

    path.close();

    return path;

  }


  @override

  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return false;

  }
}

class WaveClipper2 extends CustomClipper<Path> {

  @override

  Path getClip(Size size) {

    final path = Path();

    path.lineTo(0.0, size.height - 50);



    var firstEndPoint = Offset(size.width * .7, size.height - 40);

    var firstControlPoint = Offset(size.width * .25, size.height);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,

        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);

    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,

        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0);

    path.close();

    return path;

  }


  @override

  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return false;

  }
}
