import 'package:flutter/material.dart';
import 'package:myjemisysapp/widgets/button.dart';
import 'package:myjemisysapp/widgets/first.dart';
import 'package:myjemisysapp/widgets/forgot.dart';
import 'package:myjemisysapp/widgets/inputEmail.dart';
import 'package:myjemisysapp/widgets/password.dart';
import 'package:myjemisysapp/widgets/textLogin.dart';
import 'package:myjemisysapp/widgets/verticalText.dart';

class LoginPage3 extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
                InputEmail(),
                PasswordInput(),
                ButtonLogin(),
                FirstTime(),
                Forgot(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
