import 'package:flutter/material.dart';
import 'package:myjemisysapp/widgets/buttonNewUser.dart';
import 'package:myjemisysapp/widgets/newEmail.dart';
import 'package:myjemisysapp/widgets/newName.dart';
import 'package:myjemisysapp/widgets/password.dart';
import 'package:myjemisysapp/widgets/signup.dart';
import 'package:myjemisysapp/widgets/textNew.dart';
import 'package:myjemisysapp/widgets/userOld.dart';

class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
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
                Row(
                  children: <Widget>[
                    SingUp(),
                    TextNew(),
                  ],
                ),
                NewNome(),
                NewEmail(),
                PasswordInput(),
                ButtonNewUser(),
                UserOld(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}