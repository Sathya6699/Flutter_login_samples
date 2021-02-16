import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myjemisysapp/style.dart';
import 'Message.dart';
import 'data/dataService.dart';
import 'model/common.dart';
import 'model/dataobject.dart';

class compose extends StatefulWidget {
  @override
  _State1 createState() => _State1();
}

class _State1 extends State<compose> {
  String _selectedSubject = "Video Call";
  List<String> attachments = [];
  bool isHTML = false;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  TextEditingController txtSubject = TextEditingController();
  TextEditingController txtMessage = TextEditingController();
  TextEditingController txttomail = TextEditingController();
  DataService dataService = DataService();
  Map<String, dynamic> formData;

  // ignore: non_constant_identifier_names, missing_return
  bool _Receipent() {
    // ignore: unrelated_type_equality_checks
    if (gEmailNew == "admin@jemisys.com") {
      return true;
    }
    else {
      return false;
    }
  }

  var txtSub = [
    'Video Call',
    'Home try on',
    'Feed back',
  ];

  Future<String> UpdateMsg() async {
    String res = "Faild";
    //SharedPreferences prefs =  await SharedPreferences.getInstance();

    if (txtReceipent.text != null && txtReceipent.text != '' &&
        txtMessage.text != null && txtMessage.text != '') {
      Dialogs.showLoadingDialog(context, _keyLoader); //invoking go
      UpdateMail param = UpdateMail();
      param.iD = gID;
      param.fromUID = gMaciD;
      param.toUID = "";
      param.fromEmail = gEmailNew;
      param.toEmail = txtReceipent.text;
      param.subject = _selectedSubject;
      param.message = txtMessage.text;
      param.messageType = "S";
      param.mode = "I";
      // param.connectionString= gconnectionstring;
      print(param.toParam());
      var dt = await dataService.UpdateMessageContent(param);
      // print('nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');
      //print(dt.returnStatus);
      if (dt.returnStatus != null && dt.returnStatus == 'OK') {
        Navigator.of(_keyLoader.currentContext, rootNavigator: true)
            .pop(); //close the dialoge
        res = 'OK';
        txtMessage.clear();
        Navigator.pop(context, false);
      }
      else {
        Navigator.of(_keyLoader.currentContext, rootNavigator: true)
            .pop(); //close the dialoge
        Dialogs.AlertMessage(context,
            dt.returnStatus);
      }
    }
    return res;
  }

  final txtReceipent = TextEditingController(
    text: '',
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    txtReceipent.text = _Receipent() == true ? '' : "admin@jemisys.com";
    // ignore: unnecessary_statements
    txtSubject.text = '';
    txtMessage.text = '';
    txttomail.text = '';
  }

// ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(primaryColor: Colors.red),
        home: Scaffold(
          appBar: AppBar(
            title: new Text('New Message',
                style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
            centerTitle: true,
            leading: IconButton(icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context, false);
                }
            ),
            backgroundColor: Colors.deepOrange,

          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20,15,20,15),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 15,),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: TextField(

                        keyboardType:TextInputType.emailAddress,
                        readOnly: _Receipent() == true ? false : true,
                        controller: txtReceipent,
                        decoration: InputDecoration(
                          //prefixIcon: ,
                          icon: Icon(Icons.arrow_drop_down_circle,size: 30,color: primary5Color),
                          isDense: true,
                          border: OutlineInputBorder(),
                          labelText: 'Recipient',
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "Subject",
                              labelText: "Subject",
                              icon: Icon(Icons.subject,size: 30,color: primary5Color),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius
                                    .circular(3),
                                borderSide: new BorderSide(
                                ),
                              ),
                            ),
                            isEmpty: _selectedSubject == '',
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _selectedSubject,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _selectedSubject = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: txtSub.map((String value) {
                                    return DropdownMenuItem<String>(
                                      // child:Divider(color: Colors.black87),
                                      value: value,
                                      //Divider(color: Colors.black87),
                                      child: Text(value,
                                          style: GoogleFonts.lato(
                                            color: Colors.black,)
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ));
                      },
                    ),
                     SizedBox(height: 15,),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: TextField(
                        controller: txtMessage,
                        maxLines: 8,
                        decoration: InputDecoration(
                            icon: Icon(Icons.message,size: 26,color: primary5Color),
                            labelText: 'Body', border: OutlineInputBorder()),
                      ),
                    ),
                  ]),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.send,),
            label: Text('Send'),
            backgroundColor: primary5Color,
            onPressed: UpdateMsg,
          ),
        ),
      );
    }
  }



