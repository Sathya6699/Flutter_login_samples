import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:myjemisysapp/Message.dart';
import 'package:myjemisysapp/style.dart';

import 'model/common.dart';



class Filter extends StatefulWidget{
  @override
  _Filter createState() => _Filter();
}
class _Filter extends State<Filter>{
  final dateFormat1 = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
  final format = DateFormat('yyyy/MM/dd');
  final format2 = DateFormat('dd/MM/yyyy');
  // final format = DateFormat('yyyy/MM/dd');
  DateTime selectedDate = DateTime.now();

  String _selectedText = "admin@jemisys.com";
  String isChangeFrom = "N";
  String isChangeTo = "N";
  final f = new DateFormat('yyyy-MM-dd hh:mm');
  TextEditingController _fromdate = new TextEditingController();
  TextEditingController _todate = new TextEditingController();

  DateTime date;
  TimeOfDay time;

  Future<String> regdt;
  TextEditingController inputtextFieldurl = TextEditingController();
  TextEditingController inputtextFielduserID = TextEditingController();
  TextEditingController inputtextFieldpassword = TextEditingController();
  TextEditingController inputtextFielddeviceName = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _myKey = GlobalKey<FormState>();
  Map<String, dynamic> formData;

  var txtMsg = [
    'admin@jemisys.com',
    'thiru@jemisys.com',
    'ramesh@jemisys.com',
    'nsram.raja@jemisys.com',
  ];

  @override
  void initState() {
    super.initState();
    if(txtmessage!= "" && txtmessage != "admin@jemisys.com"){
      _selectedText = txtmessage;
    }
  }

  _Filter() {
    if (txtmessage == ""  && txtmessage == "admin@jemisys.com") {
      formData = {
        'Email ID': _selectedText,
      };
    }
    else
      formData = {
        'EMail ID': _selectedText.trim(),
      };
  }


  Widget LoadDoctype(){
    if ( gProgramName=='FilterSign'){
      return FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              isDense: true,
              hintText: "Mail ID",
              labelText: "Mail iD",
              icon: Icon(Icons.arrow_drop_down_circle,size: 30,color: primary5Color),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius
                    .circular(5),
                borderSide: new BorderSide(
                ),
              ),
            ),
            isEmpty: _selectedText == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedText ,
                isDense: true,
                onChanged: (String newValue) {
                  setState(() {
                    _selectedText = newValue;
                    state.didChange(newValue);
                  });
                },
                items: txtMsg.map((String value) {
                  return DropdownMenuItem<String>(
                    // child:Divider(color: Colors.black87),
                    value: value,
                    //Divider(color: Colors.black87),
                    child: Text(value,
                        style: GoogleFonts.lato(color: Colors.black,)
                    ),
                  );

                }).toList(),
              ),
            ),
          );
        },
      );
    }
    else
      return FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              isDense: true,
              hintText: "Mail ID",
              labelText: "Mail ID",
              icon: Icon(Icons.arrow_drop_down_circle,size: 30,color: primary5Color),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius
                    .circular(5),
                borderSide: new BorderSide(
                ),
              ),
            ),
            isEmpty: _selectedText == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedText ,
                isDense: true,
                onChanged: (String newValue) {
                  setState(() {
                    _selectedText = newValue;
                    gEmailNew = newValue;
                    state.didChange(newValue);
                  });
                },
                items: txtMsg.map((String value) {
                  return DropdownMenuItem<String>(
                    // child:Divider(color: Colors.black87),
                    value: value,
                    //Divider(color: Colors.black87),
                    child: Text(value,
                        style: GoogleFonts.lato(color: Colors.black,)
                    ),
                  );

                }).toList(),
              ),
            ),
          );
        },
      );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: brightness1,
          primaryColor: primary5Color,
          accentColor: accent5Color,

          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: Body1StylePoppins,

          ),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Apply Filter",
                  style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
              leading: IconButton(icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context, false),
              ),
              actions: <Widget>[

              ],
              backgroundColor: Colors.deepOrange,
              centerTitle: true,
            ),
            body: Container(
                decoration: BoxDecoration(
                  // Box decoration takes a gradient
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0, 1],
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
                      pageColortop,
                      pageColorbottom
                    ],
                  ),
                ),

                child: Container(
                  child: Column(
                    //mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //Spacer(),

                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0)
                              ),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 50.0,
                                  offset: Offset(0.0, 0.0),
                                ),
                              ]),
                          //height: 200,
                          child: Container(
                            margin: EdgeInsets.only(left: 20.0, top: 20.0,right: 20.0, bottom: 20.0),
                            decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 6.0,
                                    offset: Offset(1.0, 3.0),
                                  ),
                                ]),
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.fromLTRB(20.0, 25.0, 25.0, 25.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child:  LoadDoctype(),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),//Switch

                                  SizedBox(
                                    height: 10,
                                  ),//Login Button
                                  Container(
                                    child: SizedBox(
                                        width: 170,
                                        child: RaisedButton(
                                          shape: new RoundedRectangleBorder(

                                            borderRadius: new BorderRadius.circular(5.0),
                                            side: BorderSide(color: Colors.redAccent),
                                          ),
                                          color: primary5Color,
                                          padding: EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                                                child: Icon(
                                                  Icons.filter,
                                                  color: Colors.white,
                                                  size: 25.0,
                                                ),
                                              ),
                                              Text(
                                                "  Apply",
                                                //style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 13)
                                                style: GoogleFonts.lato(
                                                    color: Colors.white, fontSize: 17
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {
                                            IsFilter ="Y";
                                            //Navigator.pop(context);
                                            gEmailNew = _selectedText.trim();
                                            Navigator.pop(context, false);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Message())
                                            );
//                                            else
//                                              Navigator.pop(context);
                                          },
                                        )
                                    ),

                                  ),

                                ],
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                )
            )
        )
    );
  }
}
