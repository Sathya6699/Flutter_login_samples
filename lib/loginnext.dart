import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myjemisysapp/login.dart';
import 'package:myjemisysapp/login3.dart';
import 'package:myjemisysapp/login5.dart';
import 'package:myjemisysapp/login6.dart';
import 'package:myjemisysapp/login8.dart';
import 'package:myjemisysapp/loginUi.dart';
import 'package:myjemisysapp/main6.dart';
import 'package:myjemisysapp/memberSearch.dart';
import 'package:myjemisysapp/shome.dart';
import 'package:myjemisysapp/widgets/loginpage5.dart';
import 'login10.dart';
import 'login2.dart';
import 'mail1.dart';

class next extends StatefulWidget {
  @override
  _next createState() => _next();
}
class _next extends State<next>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text('JEMiSys'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children:  <Widget>[
              Card(
                child:
                ListTile(
                  title: Text(''),
                ),
              ),
              Card(
                child:
                ListTile(
                    title: Text('Login1', style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18)),
                  onTap: () {
                    // What happens after you tap the navigation item
                   Navigator.push(context,MaterialPageRoute(builder: (context) => Login()));

                  },
                  leading: IconButton(icon:Icon(Icons.person),color: Colors.black,
                      onPressed:() {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()), (Route<dynamic> route) => false);
                      }
                ),

              ),
              ),
              Card(
                child:
                ListTile(
                  title: Text('Login2', style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18)),
                  onTap: () {
                    // What happens after you tap the navigation item
                   Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage5()));

                  },
                  leading: IconButton(icon:Icon(Icons.person),color: Colors.black,
                      onPressed:() {
                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage5()), (Route<dynamic> route) => false);
                      }
                  ),

                ),
              ),
              Card(
                child:
                ListTile(
                  title: Text('Login3', style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18)),
                  onTap: () {
                    // What happens after you tap the navigation item
                    Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));

                  },
                  leading: IconButton(icon:Icon(Icons.person),color: Colors.black,
                      onPressed:() {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                      }
                  ),

                ),
              ),
              Card(
                child:
                ListTile(
                  title: Text('Login4', style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18)),
                  onTap: () {
                    // What happens after you tap the navigation item
                    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));

                  },
                  leading: IconButton(icon:Icon(Icons.person),color: Colors.black,
                      onPressed:() {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (Route<dynamic> route) => false);
                      }
                  ),

                ),
              ),
              Card(
                child:
                ListTile(
                  title: Text('Login5', style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18)),
                  onTap: () {
                    // What happens after you tap the navigation item
                    Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage10()));

                  },
                  leading: IconButton(icon:Icon(Icons.person),color: Colors.black,
                      onPressed:() {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage10()), (Route<dynamic> route) => false);
                      }
                  ),

                ),
              ),
              Card(
                child:
                ListTile(
                  title: Text('Login6', style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18)),
                  onTap: () {
                    // What happens after you tap the navigation item
                    Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp3()));

                  },
                  leading: IconButton(icon:Icon(Icons.person),color: Colors.black,
                      onPressed:() {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyApp3()), (Route<dynamic> route) => false);
                      }
                  ),

                ),
              ),
              Card(
                child:
                ListTile(
                  title: Text('Message', style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18)),
                  onTap: () {
                    // What happens after you tap the navigation item
                   Navigator.push(context,MaterialPageRoute(builder: (context) => Filter()));

                  },
                  leading: IconButton(icon:Icon(Icons.message),color: Colors.black,
                      onPressed:() {
                       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Filter()), (Route<dynamic> route) => false);
                      }
                  ),

                ),
              ),
              Card(
                child:
                ListTile(
                  title: Text('App', style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18)),
                  onTap: () {
                    // What happens after you tap the navigation item
                    Navigator.push(context,MaterialPageRoute(builder: (context) => sHomePage()));

                  },
                  leading: IconButton(icon:Icon(Icons.message),color: Colors.black,
                      onPressed:() {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => sHomePage()), (Route<dynamic> route) => false);
                      }
                  ),

                ),
              ),
            ],
          ),
        ),
      // Here
      ),
    );
  }
}
