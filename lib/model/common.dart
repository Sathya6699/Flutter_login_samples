import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../style.dart';
import 'dataobject.dart';


import 'package:flutter/widgets.dart';



class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth/100;
    blockSizeVertical = screenHeight/100;
    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal)/100;
    safeBlockVertical = (screenHeight - _safeAreaVertical)/100;
  }
}
final String serverToken = 'AAAAvC24Gzk:APA91bHFNcs39p9xryyytKpYE6lCyMS1FjfSuIls6eDeBjYfX9YdjG0E0UKA6xMt9FeZVsRwGsL01HARDKp0zjx2M2SJ16YgfUIhsyj1QHjbDSNgDan5zfj8y6L519Vtt6hCiXTvOylU';
final gformatdate = DateFormat('yyyy/MM/dd');
DateTime gCurrentDate = DateTime.now();
var date1 = DateTime.parse(DateTime.now().toString());
String gformattedDate1 = "${date1.day}/${date1.month}/${date1.year}";
String gformattedDate2 = "${date1.year}/${date1.month}/${date1.day}";



String IsLogin = 'N';
String IsFilter = 'N';
String IsFileUploaded = 'N';
String IsSign = 'N';
String gDocNo = '';
String gVipName = '';
String gVipNo = '';
String gDocType = '';
String gDocType2 = '';
String gStoreCode = 'HQ';
String gDate = '';
String gAmount = '\$0.00';
String gUserName = '';
String gUserID = 'SA';
String gEmail ='';
String gEmailNew ='';
String gEmailNew1 ='';
String gMaciD ='';
String gEmailreturnMsg ='';
int gDocuments = 0;
int gID = 0;
String txtmessage='';
String txtSubject='';


List<GetMemberMaster> gCountryList = [];
List<GetMemberMaster> gMemberType =  [];
List<GetMemberMaster> gMemberTitle = [];
List<GetMemberMaster> gNationality = [];
List<GetMemberMaster> gReligion = [];
List<GetMemberMaster> gRace = [];

var gSetting;

//String gFromDate =  '2020/05/01';
String gFromDate =  gformatdate.format(gCurrentDate);
String gToDate =  gformatdate.format(gCurrentDate);
String gDocDate = gformatdate.format(gCurrentDate);
DateTime gDatenow = DateTime.now();
String gProgramName = '';
List<int> gImagebytes;
bool isSendEmail = false;
bool isNewEmailUpdate = false;
void setMenuColor(String color, String color1) async{
SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setString("primary2Color", color);
await prefs.setString("accent2Color", color1);

}
 void getMenuColor() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   try {
     var color = await prefs.getString('primary2Color');
     print(color);
     if (color != null) {
       primary2Color = new Color(
           int.parse((color.replaceAll("Color(", "")).replaceAll(")", "")));
       var color1 = await prefs.getString('accent2Color');
       print(color1);
       if (color1 != null)
         accent2Color = new Color(
             int.parse((color.replaceAll("Color(", "")).replaceAll(")", "")));
     }
   }
   on Exception catch (_) {

   }
 }

class ButtomActionBarMenu{
  static List<MenuItem> SetButtomActoinBarItem() {
    List<MenuItem> allDestinations = [];
    allDestinations = <MenuItem>[
      MenuItem('Home', Icons.home, Colors.teal),
      MenuItem('Categories', Icons.category, Colors.cyan),
      MenuItem('Offer', Icons.local_offer, Colors.orange),
      MenuItem('List', Icons.favorite_border, Colors.orange),
      MenuItem('More', Icons.more_vert, Colors.blue)
    ];
    return allDestinations;
  }
  static List<MenuItem> SetMenuItem() {
    List<MenuItem> allDestinations = [];
    allDestinations = <MenuItem>[
      MenuItem('Image Slider', Icons.directions_boat, Colors.teal),
      MenuItem('Store', Icons.directions_bus, Colors.cyan),
      MenuItem('Contact Us', Icons.contacts, Colors.orange),
      MenuItem('Test', Icons.directions_walk, Colors.orange),
    ];
    return allDestinations;
  }
}
class MenuItem {
  final String title;
  final IconData icon;
  final MaterialColor color;
  MenuItem(this.title, this.icon, this.color);
}

class Program{
  final String programID;

  Program(this.programID);
}
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}
class RadioList {
  String name;
  int index;
  RadioList({this.name, this.index});
}
class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
                        ),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.black),)
                      ]),
                    )
                  ]));
        });
  }

  static Future<void> AlertMessage(BuildContext context, String msg) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
              children:[
                Icon(Icons.add_alert, color:primary1Color),
                Text('  Alert')
              ]
          ),

          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                // side: BorderSide(color: Colors.red),
              ),
              color: primary1Color,
              textColor: Colors.white,
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  static Future<void> AlertMessage5(BuildContext context, String msg) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
              children:[
                Icon(Icons.add_alert, color:primary5Color),
                Text('  Alert')
              ]
          ),

          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                // side: BorderSide(color: Colors.red),
              ),
              color: primary5Color,
              textColor: Colors.white,
              child: Text('Enter the subject'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  static Future<void> Dialogshow(
      BuildContext context, GlobalKey key) async
  {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              key: key,
              backgroundColor: Colors.white,
              children: <Widget>[
                Center(
                  child: Column(children: [
                    SpinKitWave(color: Colors.red),
                    SizedBox(height: 10,),
                    Text("Please Wait....",style: TextStyle(color: Colors.black),)
                  ], ),
                ),
              ],
            ),
          );


        });

  }
  static Future<void> AlertMessage2(BuildContext context, String msg) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
              children:[
                Icon(Icons.mail_outline, color:primary1Color),
                Text('  Message')
              ]
          ),

          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                // side: BorderSide(color: Colors.red),
              ),
              color: primary1Color,
              textColor: Colors.white,
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  static Future<void> AlertMessage3(BuildContext context, String msg) {
    return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Row(
    children: [
    Icon(Icons.add_alert, color: primary1Color),
    Text('  Alert')
    ]
    ),
    );
    },
    );
  }

  static Future<void> showLoadingOnlyDialog(BuildContext context, GlobalKey _key) {
    showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    key: _key,
                    padding: EdgeInsets.only(top: 50, left: 20.0, right: 50),
                    child: Align(
                        alignment: Alignment.center,
                        child: Material(
                          type: MaterialType.transparency,
                          child: new Stack(
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  child: SizedBox(width: 50,
                                    child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CircularProgressIndicator(
                                          valueColor: new AlwaysStoppedAnimation<Color>(
                                              Colors.redAccent),
                                        )
                                    ),
                                  ),
//              margin: EdgeInsets.only(top: 80, left: 12, right: 12, bottom: 50),
                                  decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.only(
//                              topLeft: const Radius.circular(1000.0),
//                              topRight: const Radius.circular(300.0),
//                              bottomLeft: const Radius.circular(150.0),
//                              bottomRight: const Radius.circular(1000.0),
//                            ),
                                  ),
                                ),
                              ]),
                        )
                    ),
                  ))
          );
        });
  }
    static Future<bool> asyncConfirmDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset settings?'),
          content: const Text(
              'This will reset your device to its default factory settings.'),
          actions: <Widget>[
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: const Text('ACCEPT'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      },
    );
  }

  static Future<String> asyncInputDialog2(BuildContext context, String iTitle) async {
    final _text = TextEditingController();
    bool _validate = false;
    String teamName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {

        return AlertDialog(
          title: Text(iTitle,
            //style: TextStyle(color: Colors.white, backgroundColor: title1Color,),
          ),
          content: new Theme(
            data: new ThemeData(
              primaryColor: primary1Color,
              accentColor: accent1Color,
            ),
            child: Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                      controller: _text,
                      autofocus: true,
                      decoration: new InputDecoration(
                        labelText: 'Enter the Value', hintText: 'Enter',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      ),
//                    onChanged: (value) {
//                      teamName = value;
//                    },
                    )
                )
              ],
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: 100.0,
              child: Container(
                  margin: const EdgeInsets.fromLTRB(7.0, 0.0, 10.0, 0.0),
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.redAccent),
                    ),
                    color: primary1Color,
                    padding: EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Ok",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      _text.text.isEmpty ? _validate = true : _validate = false;
                      teamName = _text.text;
                      if(_validate){
                        Dialogs.AlertMessage(context, 'Input cannot be blank, please check.');
                      }
                      else {
                        Navigator.of(context).pop(teamName);
                      }
                    },
                  )
              ),
            ),
            SizedBox(
              width: 100.0,
              child: Container(
                  margin: const EdgeInsets.fromLTRB(7.0, 0.0, 10.0, 0.0),
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.redAccent),
                    ),
                    color: primary1Color,
                    padding: EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop('Cancel');
                    },
                  )
              ),
            ),

          ],
        );
      },
    );
  }

  static Future<String> asyncInputDialog(
      BuildContext context, String iTitle) async {
    final _text = TextEditingController();
    bool _validate = false;
    String inputvalue = '';
    return showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              backgroundColor: Colors.transparent,
              children: <Widget>[
                Center(
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(left: 0.0,right: 0.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                              top: 18.0,
                            ),
                            margin: EdgeInsets.only(top: 13.0,right: 8.0),
                            decoration: BoxDecoration(
                                color: primary1Color,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 0.0,
                                    offset: Offset(0.0, 0.0),
                                  ),
                                ]),
                            child: new Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                SizedBox(
                                  height: 0.0,
                                ),
                                Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: new Text(iTitle,
                                          style:TextStyle(fontSize: 24.0,color: Colors.white)),
                                    )//
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  //padding: EdgeInsets.only(top: 15.0,bottom:15.0),
                                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                    ),
                                    child: new Theme(
                                      data: new ThemeData(
                                        primaryColor: primary1Color,
                                        accentColor: accent1Color,
                                      ),
                                      child: TextField(
                                        controller: _text,
                                        autofocus: true,
                                        decoration: new InputDecoration(
                                          labelText: 'Enter the Value', hintText: 'Enter',
                                          errorText: _validate ? 'Value Can\'t Be Empty' : null,

                                        ),
                                      ),
                                    )
                                ),
                                Container(
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: SizedBox(),
                                        ),
                                        Container(
                                          child: SizedBox(
                                              width: 100,
                                              child: RaisedButton(
                                                shape: new RoundedRectangleBorder(
                                                  borderRadius: new BorderRadius.circular(10.0),
                                                  side: BorderSide(color: Colors.redAccent),
                                                ),
                                                color: primary1Color,
                                                padding: EdgeInsets.all(3.0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                      "Ok",
                                                      style: TextStyle(
                                                          color: Colors.white, fontSize: 13
                                                        //fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                onPressed: () {
                                                  _text.text.isEmpty ? _validate = true : _validate = false;
                                                  inputvalue = _text.text;
                                                  if(_validate){
                                                    Dialogs.AlertMessage(context, 'Input cannot be blank, please check.');
                                                  }
                                                  else {
                                                    Navigator.of(context).pop(inputvalue);
                                                  }
                                                },
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(),
                                        ),
                                      ],
                                    )
                                ),
                                InkWell(
                                  child: Container(),

                                )
                              ],
                            ),

                          ),
                          Positioned(
                            right: 0.0,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).pop('Cancel');
                                //Navigator.of(context).pop();
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                  radius: 14.0,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.close, color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                )
              ],
            ),
          );
        }
    );
  }
}


class TextStorage {
  Future<DeviceLog> getSetting() async {
    DeviceLog dlog = DeviceLog();

//    DataService dataService = DataService();
    String getVal="";
//    SharedPreferences prefs =  await SharedPreferences.getInstance();
//    prefs?.setString("settingvalue", "");
    try {
      TextStorage tobj = TextStorage();
      String text = await tobj.readContent();
      getVal = text;
      if(text != "File does not exists" && text != "Couldn't read file"){
        //prefs?.setString("settingvalue", text);
        dlog = DeviceLog.fromJson(jsonDecode(text));
      }

    } catch (e) {
      //print(e.toString());
      getVal = "Couldn't read file";
    }
    //print(getVal);
    return dlog;
  }
  Future<String> setSetting(DeviceLog dlog) async {
    TextStorage tobj = TextStorage();
    dlog.userId = dlog.userId==null ? null : '"'+dlog.userId+'"';
    dlog.password = dlog.password==null ? null : '"'+dlog.password+'"';
    dlog.userName = dlog.userName==null ? null : '"'+dlog.userName+'"';
    tobj.writeContent(dlog.toJson().toString());
    print("Saved");
  }
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/deviceSetting.txt');
  }
  Future<String> readContent() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      // Returning the contents of the file
      return contents;
    } catch (e) {
      // If encountering an error, return
      return "Couldn't read file";//+e.toString();
    }
  }
  Future<File> writeContent(String data) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString(data);
  }
 //Future<String> getSetting() async {
  //  DataService dataService = DataService();
 }
//    String getVal="";
//    SharedPreferences prefs =  await SharedPreferences.getInstance();
////    prefs?.setString("settingvalue", "");
//    try {
//      TextStorage tobj = TextStorage();
//      String text = await tobj.readContent();
//      getVal = text;
//      if(text != "File does not exists" && text != "Couldn't read file")
//        prefs?.setString("settingvalue", text);
//    } catch (e) {
//      print(e.toString());
//      getVal = "Couldn't read file";
//    }
//    //print(getVal);
//    return getVal;
//  }
//  Future<String> setSetting(String jsonval) async {
//    TextStorage tobj = TextStorage();
//    tobj.writeContent(jsonval);
//    print("Saved");
//  }
