import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Animation/FadeAnimation.dart';
import 'signin_button.dart';
import 'teddy_controller.dart';
import 'tracking_text_input.dart';

void main() => runApp(MyApp3());

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TeddyController _teddyController;
  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
      body: Container(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      // Box decoration takes a gradient
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.0, 1.0],
                        colors: [
                          Color.fromRGBO(170, 207, 211, 1.0),
                          Color.fromRGBO(93, 142, 155, 1.0),
                        ],
                      ),
                    ),
                  )
              ),
                Positioned.fill(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 200,
                              padding: const EdgeInsets.only(left: 30.0, right:30.0),
                              child: FlareActor(
                                "assets/Teddy.flr",
                                shouldClip: false,
                                alignment: Alignment.bottomCenter,
                                fit: BoxFit.contain,
                                controller: _teddyController,
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Form(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        TrackingTextInput(
                                            label: "User ID",
                                            hint: "Enter ur User ID",
                                            onCaretMoved: (Offset caret) {
                                              _teddyController.lookAt(caret);
                                            }),
                                        TrackingTextInput(
                                          label: "Password",
                                          hint: "Enter password",
                                          isObscured: true,
                                          onCaretMoved: (Offset caret) {
                                            _teddyController.coverEyes(caret != null);
                                            _teddyController.lookAt(null);
                                          },
                                          onTextChanged: (String value) {
                                            _teddyController.setPassword(value);
                                          },
                                        ),
                                        SigninButton(
                                            child: Text("Login",
                                                style: TextStyle(
                                                    fontFamily: "RobotoMedium",
                                                    fontSize: 16,
                                                    color: Colors.white)),
                                            onPressed: () {
                                              _teddyController.submitPassword();
                                            })
                                      ],
                                    )),
                              )),
                          const SizedBox(height: 20.0),
                          Center(
                            child: FadeAnimation(
                              0.1,
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          FadeAnimation(
  0.1,
                            Center(
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:15),
                          FadeAnimation(0.1,   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              OutlineButton.icon(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 30.0,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.lightBlueAccent),
                                color: Colors.blue,
                                highlightedBorderColor: Colors.blue,
                                textColor: Colors.lightBlueAccent,
                                icon: Icon(
                                  FontAwesomeIcons.twitter,
                                  size: 18.0,
                                ),
                                label: Text("  Twitter  "),
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
                          FadeAnimation(0.1,   Row(
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
                                label: Text("  Google  "),
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
                                highlightedBorderColor: Colors.black,
                                borderSide: BorderSide(color: Colors.black),
                                color: Colors.black,
                                textColor: Colors.black,
                                icon: Icon(
                                  FontAwesomeIcons.apple,
                                  size: 18.0,
                                ),
                                label: Text("   Apple    "),
                                onPressed: () {},
                              ),
                            ],
                          ),),
                        ])),
              ),
  ],
          )));
  }
}