import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myjemisysapp/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
);
@override
void initState() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    double screenhight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        SingleChildScrollView(
          child: Container(
            height:MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-1.png'),

                              )
                          ),
                        )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-2.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/clock.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[400]))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "User ID",
                                    hintStyle: TextStyle(color: Colors.grey[500])

                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(2.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[500])
                                ),
                              ),
                            ),

                          ],
                        ),
                      )),
                      SizedBox(height: 20,),
                      FadeAnimation(2, Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ]
                            )
                        ),
                        child: Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      )),

                      SizedBox(height: 10,),
                      FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                      SizedBox(height: 20,),
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
                              FontAwesomeIcons.googlePlusG,
                              size: 18.0,
                            ),
                            label: Text("  Google"),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10.0),
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
                      )
                  ),
                      SizedBox(height: 4,),
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
                        label: Text("  Twitter"),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 10.0),
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
                        label: Text("    Apple   "),
                        onPressed: () {},
                      ),
                    ],
                  ),),
                      SizedBox(height: 15,),
                      FadeAnimation(1, Text("Don't have an Account? Sign Up", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}