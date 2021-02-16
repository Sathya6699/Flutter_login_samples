import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myjemisysapp/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myjemisysapp/data/dataService.dart';
import 'package:myjemisysapp/model/common.dart';
import 'package:myjemisysapp/model/dataobject.dart';
import 'dart:core';
import 'package:intl/intl.dart';
class Member extends StatefulWidget{

  @override
  _member createState() => _member();
}
class _member extends State<Member>{
  List<GetMember> itemDt = [];

  DataService dataService = new DataService();
  GetMember Dt;
  bool _isRow = true;
  bool _switchEmail= true;
  bool _switchSMS= true;
  bool checkBoxAuto = true;
  GetMemberMaster _selectedMemberType;
  GetMemberMaster _selectedMemberTitle;
  GetMemberMaster _selectedCountry;
  GetMemberMaster _selectedNationality;
  GetMemberMaster _selectedRace;
  GetMemberMaster _selectedReligion ;
  String res = "Faild";
  DateTime selectedDate = DateTime.now();
  String initValue="Select your Birth Date";
  bool isDateSelected= false;
  DateTime birthDate; // instance of DateTime
  String birthDateInString;
  final format = DateFormat('dd/MMM/yyyy');
  final String currentItem="";
  String gBirthDate =  gformatdate.format(gCurrentDate);
  List<GetMemberMaster> CountryList = [];
  List<GetMemberMaster> MemberType =  [];
  List<GetMemberMaster> MemberTitle = [];
  List<GetMemberMaster> Nationality = [];
  List<GetMemberMaster> Religion = [];
  List<GetMemberMaster> Race = [];

  var _Nationality = [
    '',
    'Singaporean',
    'Chinese',
    'Malaysian',
    'Indian',
    'SPR'
  ];


  Future<List<GetMemberMaster>> getCountry() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    var setting = await dataService.GetMemberCountry(param);
    if(setting==null){

    }
    else{

    }
    CountryList = setting;
    return setting;

  }

  Future<List<GetMemberMaster>> getNationality() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    var setting = await dataService.GetMemberNationality(param);
    if(setting==null){

    }
    else{

    }
    Nationality = setting;
    return setting;

  }

  Future<List<GetMemberMaster>> getRace() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    var setting = await dataService.GetMemberRace(param);
    if(setting==null){

    }
    else{

    }
    Race = setting;
    return setting;

  }

  Future<List<GetMemberMaster>> getReligion() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    var setting = await dataService.GetMemberReligion(param);
    if(setting==null){

    }
    else{

    }
    Religion = setting;
    return setting;

  }

  Future<List<GetMemberMaster>> getMemberType() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    var dtMemberType = await dataService.GetMemberType(param);
    if(dtMemberType==null){

    }
    else{

    }
    MemberType =dtMemberType;
    return dtMemberType;

  }

  Future<List<GetMemberMaster>> getMemberTitle() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    var setting = await dataService.GetMemberTitle(param);
    if(setting==null){

    }
    else{

    }


    MemberTitle =setting;
    return setting;

  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));

    if (picked != null)
    {
      setState(() {
        selectedDate = picked;
        birthDateInString = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
        gBirthDate = picked.toString();
        gBirthDate = format.format(DateTime.parse(gBirthDate));
        txtDOB.value = TextEditingValue(text: gBirthDate);

      });
    }
    else
      setState(() {
        //txtDOB.text ="";
      });

  }

  Future<String> _fetchMemberData() async {
    String res = "Failed";
    SharedPreferences prefs =  await SharedPreferences.getInstance();

    if (gVipNo != null && gVipNo!= '') {
      GetMember param = GetMember();
      param.value1 = gVipNo;
      param.connectionString= gconnectionstring;
      var dt = await dataService.GetMemberData(param);

      if (dt.status != null && dt.status == 1) {
        res = 'OK';

        setState(() {

          txtVipNo = new TextEditingController(text: dt != null ? dt.vipNo.toString() : '');
          txtName = new TextEditingController(text: dt != null ? dt.memberName.toString() : '');
          txtReferredBy = new TextEditingController(text: dt != null ? dt.referredVIPNo.toString() : '');
          txtDOB = new TextEditingController(text: dt.dob != null ? format.format(DateTime.parse(dt.dob)).toString() : '');
          _selectedMemberType = MemberType.where((e) => e.values == dt.memberType.trim()).toList()[0];
          _selectedMemberTitle = MemberTitle.where((e) => e.values == dt.title.trim()).toList()[0];
          txtMobileNumber = new TextEditingController(text: dt != null ? dt.telephone.toString() : '');
          txtEmail = new TextEditingController(text: dt != null ? dt.email.toString() : '');
          txtPostalCode = new TextEditingController(text: dt != null ? dt.postal.toString() : '');
          txtAddress = new TextEditingController(text: dt != null ? dt.address.toString() : '');
          txtAddress2 = new TextEditingController(text: dt != null ? dt.address2.toString() : '');
          txtAddress3 = new TextEditingController(text: dt != null ? dt.address3.toString() : '');
          txtAddress4 = new TextEditingController(text: dt != null ? dt.address4.toString() : '');
          _selectedCountry = CountryList.where((e) => e.values == dt.country.trim()).toList()[0];
          _selectedNationality = Nationality.where((e) => e.values == dt.nationality.trim()).toList()[0];
          _selectedRace = Race.where((e) => e.values == dt.race.trim()).toList()[0];
          _selectedReligion = Religion.where((e) => e.values == dt.religion.trim()).toList()[0];

          txtNRIC = new TextEditingController(text: dt != null ? dt.nricNo.toString() : '');
          if (dt.gender=="M")
          {
            _isRow = true;
          }
          else
            _isRow = false;

          if (dt.isSendEMail==1)
          {
            _switchEmail = true;
          }
          else
            _switchEmail = false;

          if (dt.isSendSMS==1)
          {
            _switchSMS = true;
          }
          else
            _switchSMS = false;
        });
      }
      else {
        gVipNo="";
      }
    }
    return res;
  }

  Future<String> _updateMember() async {
    String res = "Faild";


    //SharedPreferences prefs =  await SharedPreferences.getInstance();
    if ( txtName.text != null &&  txtName.text!= '')   {

      // Dialogs.showLoadingDialog(context, _keyLoaderS); //invoking go
      UpdateMember param = UpdateMember();
      param.vipNo = txtVipNo.text.trim();
      param.memberType = _selectedMemberType.values;
      param.title= _selectedMemberTitle.values;
      param.memberName= txtName.text.trim();
      param.nricNo= txtNRIC.text.trim();
      param.address= txtAddress.text.trim()==""?".":txtAddress.text.trim();
      param.address2=txtAddress2.text.trim()==""?"":txtAddress2.text.trim();
      param.address3=txtAddress3.text.trim()==""?"":txtAddress3.text.trim();
      param.address4=txtAddress4.text.trim()==""?"":txtAddress4.text.trim();
      param.country= _selectedCountry.values;
      param.nationality= _selectedNationality.values;
      param.postal= txtPostalCode.text.trim();
      param.handphone= txtMobileNumber.text.trim();
      param.telephone= txtMobileNumber.text.trim();
      param.email= txtEmail.text.trim();
      param.isSendEMail=_switchEmail== true ? 1:0;
      param.isSendSMS=_switchSMS== true ? 1:0;
      param.dob=  txtDOB.text;
      param.gender= _isRow==true ?"M":"F";
      param.race=_selectedRace.values;
      param.religion=_selectedReligion.values;
      param.goldRateDiscount= 0;
      param.discountPer=0;
      param.bDayDiscountPer=0;
      param.referredVIPNo=txtReferredBy.text.trim();
      param.mode=gVipNo==""?"I":"U";
      param.connectionString= gconnectionstring;
      print(param.toParam());
      var dt = await dataService.UpdateMemberdata(param);
      //print(param.toParam());
      if (dt.returnStatus != null && dt.returnStatus == 'OK') {
        //Navigator.of(_keyLoaderS.currentContext, rootNavigator: true)
        // .pop(); //close the dialoge

        res = 'OK';
        gVipNo = dt.value.trim();
        _fetchMemberData();
        Dialogs.AlertMessage(context,
            "Record updated successfully.");

      }
//      else {
//      Navigator.of(_keyLoaderS.currentContext, rootNavigator: true)
//            .pop(); //close the dialoge
//       }
    }

    return res;

  }

  String toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(3, '0');
    final d = dateTime.day.toString().padLeft(2, '0');

    return "$d$m$y";

  }

  bool isValidDate(String input) {
    try {
      DateFormat.yMd().parse(input);
      return true;
    } catch(e) {

      return false;

    }
  }

  Future<String> regdt;
  TextEditingController txtVipNo = TextEditingController();
  TextEditingController txtReferredBy = TextEditingController();
  TextEditingController txtMemberType = TextEditingController();
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtMobileNumber = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPostalCode = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtAddress2 = TextEditingController();
  TextEditingController txtAddress3 = TextEditingController();
  TextEditingController txtAddress4 = TextEditingController();
  TextEditingController txtCountryCode = TextEditingController();
  TextEditingController txtNationality = TextEditingController();
  TextEditingController txtDOB = TextEditingController();
  TextEditingController txtNRIC = TextEditingController();
  TextEditingController txtRace = TextEditingController();
  TextEditingController txtReligion = TextEditingController();

  _clearAll() async {
    setState(() {
      _selectedMemberType= MemberType[0];
      _selectedMemberTitle= MemberTitle[0];
      _selectedNationality= Nationality[0];
      _selectedRace= Race[0];
      _selectedReligion= Religion[0];
      _selectedCountry= CountryList[0];
      txtVipNo.text="";
      txtReferredBy.text="";
      txtMobileNumber.text  = "";
      txtName.text  = "";
      txtEmail.text  = "";
      txtPostalCode.text  = "";
      txtAddress.text  = "";
      txtAddress2.text  = "";
      txtAddress3.text  = "";
      txtAddress4.text  = "";
      txtNRIC.text  = "";
      txtDOB.text="";
      _switchEmail=false;
      _switchSMS=false;
    });

  }

  _loadDetail() async {
    setState(() {

    });

  }

  bool _EnableVipNo() {
    if (gVipNo!="") {
      return true;
    }
    if (checkBoxAuto==true && txtVipNo.text=="") {
      return true;
    }
    return false;
  }
  void loadDefault() async{
    await getMemberTitle();
    await getCountry();
    await getMemberType();
    await getNationality();
    await getRace();
    await getReligion();
    _selectedMemberType= MemberType[0];
    _selectedMemberTitle= MemberTitle[0];
    _selectedNationality= Nationality[0];
    _selectedRace= Race[0];
    _selectedReligion= Religion[0];
    _selectedCountry= CountryList[0];
    if (gVipNo!="")
    {
      checkBoxAuto =false;
      _fetchMemberData();
    }
    setState(() {

    });
  }
  void initState() {
    super.initState();
    loadDefault();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: brightness1,
          primaryColor: primary2Color,
          accentColor: accent2Color,
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: Body1Style,
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Member"),
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context, false),
            ),
            actions: <Widget>[
//                IconButton(
//                  icon: Icon(Icons.home),
//                  onPressed: () {
//                    Navigator.pop(context);
//                  },
//                ),
            ],
            backgroundColor: Color(0xffff3a5a),
            centerTitle: true,
          ),
          body:  SingleChildScrollView(
              child:Container(
                color: Colors.transparent,
                padding: const EdgeInsets.fromLTRB(12.0,5,12,10),//I used some padding without fixed width and height
                // Image(image: AssetImage("assets/logo3.png"),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: TextField(
//                                       onEditingComplete: () {
//                                         if (gVipNo ==""){
//                                         gVipNo=txtVipNo.text.trim();
//                                         _fetchMemberData();
//                                         }
//                                    },
                                readOnly: _EnableVipNo()==false?false:true,
                                controller: txtVipNo,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'VIP No.',
                                  labelText: "VIP No.",
                                  prefixIcon: Icon(Icons.person,color:title1Color),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor:  Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                  ),
                                ),)
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,0,2,0),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height:52,
                                  width:52,
                                  //color: Colors.deepOrange,
                                  child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            SizedBox(height: 2,),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(8,0,2,0),
                                              child: Container(

                                                decoration: BoxDecoration(
//                                    image: new DecorationImage(
//                                      image: new ExactAssetImage('assets/Auto.png'),
//                                      fit: BoxFit.cover,
//                                    ),
                                                    border: Border.all(
                                                        color: Colors.pink,
                                                        width: 2
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(50))
                                                ),
                                                width: 32,
                                                height: 32,
                                                child: Checkbox(

                                                  // title: Text("Checkbox label"),
                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                  value: checkBoxAuto,
                                                  tristate: false,

                                                  onChanged: (bool isChecked) {
                                                    setState(() {
                                                      checkBoxAuto = isChecked;
                                                      if(gVipNo=="")
                                                      {
                                                        _clearAll();
                                                      }

                                                    });
                                                  },
                                                ),

                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(height: 2,),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                              child: Text(
                                                'Auto',
                                                style: TextStyle(color: title1Color, fontWeight: FontWeight.bold,fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),

                                      ] ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(

                              child: TextField(
                                onTap: () {
                                  if (gVipNo ==""){
                                    gVipNo=txtVipNo.text.trim();
                                    _fetchMemberData();
                                  }
                                },
                                controller: txtReferredBy,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Referred By',
                                  labelText: "Referred By",
                                  prefixIcon: Icon(Icons.person_add,color:title1Color),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor:Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                  ),
                                ),)
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child:  InputDecorator(
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "Member Type*",
                                labelText: "Member Type*",
                                prefixIcon: Icon(Icons.people,color:title1Color),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius
                                      .circular(5),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                              ),

                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<GetMemberMaster>(
                                  value: _selectedMemberType,
                                  isDense: true,
                                  isExpanded:true,
                                  onChanged: (GetMemberMaster newValue) {
                                    setState(() {
                                      _selectedMemberType= newValue;
                                    });
                                  },
                                  items: MemberType.map((GetMemberMaster value) {
                                    return new DropdownMenuItem<GetMemberMaster>(
                                      // child:Divider(color: Colors.black87),
                                      value: value,
                                      //Divider(color: Colors.black87),
                                      child: Text(value.values,
                                          style: GoogleFonts.lato(color: Colors.black,)
                                      ),
                                    );

                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child:  InputDecorator(
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "Title",
                                labelText: "Title",
                                prefixIcon: Icon(Icons.perm_contact_calendar,color:title1Color),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius
                                      .circular(5),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                              ),

                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<GetMemberMaster>(
                                  value:_selectedMemberTitle,
                                  isDense: true,
                                  isExpanded:true,
                                  onChanged: (GetMemberMaster newValue) {
                                    setState(() {
                                      _selectedMemberTitle = newValue;

                                    });
                                  },
                                  items: MemberTitle.map((GetMemberMaster value) {
                                    return new DropdownMenuItem<GetMemberMaster>(
                                      // child:Divider(color: Colors.black87),
                                      value: value,
                                      //Divider(color: Colors.black87),
                                      child: Text(value.values,
                                          style: GoogleFonts.lato(color: Colors.black,)
                                      ),
                                    );

                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: TextField(
                                controller: txtName,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Name*',
                                  labelText: "Name*",
                                  prefixIcon: Icon(Icons.person,color:title1Color),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor:  Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                  ),
                                ),
                                onChanged: (text) {

                                },
                              )
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: TextField(
                                controller: txtMobileNumber,
                                keyboardType: TextInputType.phone,
                                //maxLength: 15,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Mobile Number',
                                  labelText: "Mobile Number",
                                  prefixIcon: Icon(Icons.call,color:title1Color),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor:  Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                  ),
                                ),)
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: TextField(
                                controller: txtEmail,
                                keyboardType: TextInputType.emailAddress,
                                //maxLength: 15,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Email',
                                  labelText: "Email",
                                  prefixIcon: Icon(Icons.mail_outline,color:title1Color),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor:  Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                  ),
                                ),)
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Container(
                            child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: CupertinoSwitch(
                                    value: _switchEmail,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _switchEmail = value;
                                      });
                                    }),

                              ),
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text('Send Email',style: GoogleFonts.lato(color: Colors.pink, fontSize: 13)),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: CupertinoSwitch(
                                    value: _switchSMS,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _switchSMS = value;
                                      });
                                    }),

                              ),
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text('Send SMS',style: GoogleFonts.lato(color: Colors.pink, fontSize: 13)),
                          ),
                        ],
                      ),
                      SizedBox(height: 0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height:0.0),
                                  ExpansionTile(
                                    leading: Icon(Icons.home,size: 30,color: Colors.blueGrey),
                                    title: Text(
                                      "Address",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        color: Colors.blueGrey,
                                      ),
                                    ),

                                    children: <Widget>[
                                      SizedBox(height:4.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: TextField(
                                                controller: txtPostalCode,
                                                keyboardType: TextInputType.phone,
                                                //maxLength: 15,
                                                autocorrect: true,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: 'Postal Code',
                                                  labelText: "Postal Code",
                                                  prefixIcon: Icon(Icons.fiber_pin,color:title1Color),
                                                  hintStyle: TextStyle(color: Colors.grey),
                                                  filled: true,
                                                  fillColor:  Colors.white70,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                ),)
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: TextField(
                                                controller: txtAddress,

                                                keyboardType: TextInputType.text,
                                                //maxLength: 15,
                                                autocorrect: true,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: 'Address1',
                                                  labelText: "Address1",
                                                  prefixIcon: Icon(Icons.home,color:title1Color),
                                                  hintStyle: TextStyle(color: Colors.grey),
                                                  filled: true,
                                                  fillColor:  Colors.white70,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                ),)
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: TextField(
                                                controller: txtAddress2,
                                                keyboardType: TextInputType.text,
                                                maxLines: 1,//                                //maxLength: 15,
                                                autocorrect: true,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: 'Address2',
                                                  labelText: "Address2",
                                                  prefixIcon: Icon(Icons.home,color:title1Color),
                                                  hintStyle: TextStyle(color: Colors.grey),
                                                  filled: true,
                                                  fillColor:  Colors.white70,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                ),)
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: TextField(
                                                controller: txtAddress3,
                                                keyboardType: TextInputType.text,
                                                maxLines: 1,//                                //maxLength: 15,
                                                autocorrect: true,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: 'Address3',
                                                  labelText: "Address3",
                                                  prefixIcon: Icon(Icons.home,color:title1Color),
                                                  hintStyle: TextStyle(color: Colors.grey),
                                                  filled: true,
                                                  fillColor:  Colors.white70,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                ),)
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: TextField(
                                                controller: txtAddress4,
                                                keyboardType: TextInputType.text,
                                                maxLines: 1,//                                //maxLength: 15,
                                                autocorrect: true,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: 'Address4',
                                                  labelText: "Address4",
                                                  prefixIcon: Icon(Icons.home,color:title1Color),
                                                  hintStyle: TextStyle(color: Colors.grey),
                                                  filled: true,
                                                  fillColor:  Colors.white70,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                ),)
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child:  InputDecorator(
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: "Country",
                                                labelText: "Country",
                                                prefixIcon: Icon(Icons.add_location,color:title1Color),
                                                border: new OutlineInputBorder(
                                                  borderRadius: new BorderRadius
                                                      .circular(5),
                                                  borderSide: new BorderSide(
                                                  ),
                                                ),
                                              ),

                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton<GetMemberMaster>(
                                                  hint: Text('Select Country'),
                                                  value: _selectedCountry ,
                                                  isDense: true,
                                                  onChanged: (GetMemberMaster newValue) {
                                                    setState(() {
                                                      _selectedCountry = newValue;
                                                    });
                                                  },

                                                  items:  CountryList.map((GetMemberMaster value) {
                                                    return DropdownMenuItem<GetMemberMaster>(
                                                      // child:Divider(color: Colors.black87),
                                                      value: value,
                                                      //Divider(color: Colors.black87),
                                                      child: Text(value.values,
                                                          style: GoogleFonts.lato(color: Colors.black,)
                                                      ),
                                                    );

                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child:  InputDecorator(
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: "Nationality",
                                                labelText: "Nationality",
                                                prefixIcon: Icon(Icons.flag,color:title1Color),
                                                border: new OutlineInputBorder(
                                                  borderRadius: new BorderRadius
                                                      .circular(5),
                                                  borderSide: new BorderSide(
                                                  ),
                                                ),
                                              ),

                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton<GetMemberMaster>(
                                                  value: _selectedNationality ,
                                                  isDense: true,
                                                  onChanged: (GetMemberMaster newValue) {
                                                    setState(() {
                                                      _selectedNationality = newValue;

                                                    });
                                                  },
                                                  items:  Nationality.map((GetMemberMaster value) {
                                                    return DropdownMenuItem<GetMemberMaster>(
                                                      // child:Divider(color: Colors.black87),
                                                      value: value,
                                                      //Divider(color: Colors.black87),
                                                      child: Text(value.values,
                                                          style: GoogleFonts.lato(color: Colors.black,)
                                                      ),
                                                    );

                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height:0.0),
                                  ExpansionTile(
                                    leading: Icon(Icons.person_pin,size: 32,color: Colors.blueGrey ),
                                    //backgroundColor: Colors.greenAccent,
                                    //initiallyExpanded:true,
                                    title: Text(
                                      "Personal Info",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    children: <Widget>[
                                      SizedBox(height:4.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: TextField(

                                                controller: txtDOB,
                                                readOnly: false,
                                                //keyboardType: TextInputType.datetime,
                                                //maxLength: 15,
                                                autocorrect: true,
                                                decoration: InputDecoration(

                                                  isDense: true,
                                                  hintText: 'dd/Mmm/yyyy',
                                                  labelText: "Date of Birth (dd/Mmm/yyyy)",
                                                  prefixIcon: Icon(Icons.date_range,color:title1Color),
                                                  suffixIcon: IconButton(onPressed: ()  {
                                                    _selectDate(context);
                                                  }, icon: Icon(Icons.date_range,color:title1Color)),
                                                  hintStyle: TextStyle(color: Colors.grey),
                                                  filled: true,
                                                  fillColor:  Colors.white70,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                ),)
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                            child: Text('I\' am',style: GoogleFonts.lato(color: Colors.black, fontSize: 14)),
                                          ),
                                          Expanded(
                                            child:  Container(
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Radio<bool>(
                                                            value: true,
                                                            groupValue: this._isRow,
                                                            activeColor: Colors.pink,
                                                            focusColor: Colors.pink,
                                                            onChanged: (bool value) {

                                                              setState(() {this._isRow = value;} );
                                                            }),
                                                        Text('Male',style: GoogleFonts.lato(color: Colors.black, fontSize: 15)),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Radio<bool>(
                                                            value: false,
                                                            groupValue: this._isRow,
                                                            activeColor: Colors.pink,
                                                            focusColor: Colors.pink,
                                                            onChanged: (bool value) {

                                                              setState((){this._isRow = value ;} );
                                                            }),
                                                        Text('Female',style: GoogleFonts.lato(color: Colors.black, fontSize: 15)),
                                                      ],

                                                    ),

                                                  ],

                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: TextField(
                                                controller: txtNRIC,
                                                autocorrect: true,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: 'NRIC No. / Passport',
                                                  labelText: "NRIC No / Passport",
                                                  prefixIcon: Icon(Icons.credit_card,color:title1Color),
                                                  hintStyle: TextStyle(color: Colors.grey),
                                                  filled: true,
                                                  fillColor:  Colors.white70,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                                  ),
                                                ),)
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child:  InputDecorator(
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: "Race",
                                                labelText: "Race",
                                                prefixIcon: Icon(Icons.assistant,color:title1Color),
                                                border: new OutlineInputBorder(
                                                  borderRadius: new BorderRadius
                                                      .circular(5),
                                                  borderSide: new BorderSide(
                                                  ),
                                                ),
                                              ),

                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton<GetMemberMaster>(
                                                  value: _selectedRace ,
                                                  isDense: true,
                                                  onChanged: (GetMemberMaster newValue) {
                                                    setState(() {
                                                      _selectedRace = newValue;
                                                    });
                                                  },
                                                  items: Race.map((GetMemberMaster value) {
                                                    return DropdownMenuItem<GetMemberMaster>(
                                                      // child:Divider(color: Colors.black87),
                                                      value: value,
                                                      //Divider(color: Colors.black87),
                                                      child: Text(value.values,
                                                          style: GoogleFonts.lato(color: Colors.black,)
                                                      ),
                                                    );

                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child:  InputDecorator(
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: "Religion",
                                                labelText: "Religion",
                                                prefixIcon: Icon(Icons.assistant,color:title1Color),
                                                border: new OutlineInputBorder(
                                                  borderRadius: new BorderRadius
                                                      .circular(5),
                                                  borderSide: new BorderSide(
                                                  ),
                                                ),
                                              ),

                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton<GetMemberMaster>(
                                                  value: _selectedReligion ,
                                                  isDense: true,
                                                  onChanged: (GetMemberMaster newValue) {
                                                    setState(() {
                                                      _selectedReligion = newValue;
                                                    });
                                                  },
                                                  items:  Religion.map((GetMemberMaster value) {
                                                    return DropdownMenuItem<GetMemberMaster>(
                                                      // child:Divider(color: Colors.black87),
                                                      value: value,
                                                      //Divider(color: Colors.black87),
                                                      child: Text(value.values,
                                                          style: GoogleFonts.lato(color: Colors.black,)
                                                      ),
                                                    );

                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          bottomNavigationBar: BottomAppBar(
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  // width: 50.0,
                  child: FlatButton(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2.0,2.0,2.0,2.0),
                          child: Icon(
                            Icons.save,
                            color: Colors.pink,
                            size: 24.0,
                          ),
                        ),
                        SizedBox(height: 0,),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 12
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {

//                        if(txtDOB.text!=""  && isValidDate(txtDOB.text)==false)
//                         {
//                               Dialogs.AlertMessage(context,
//                               "Invalid date of birth, Please check.");
//                         }
//                        else
                      _updateMember();

                    },
                  ),
                ),
                SizedBox(
                  width: 165.0,
                ),
                SizedBox(
                  //width: 65.0,
                  child: FlatButton(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2.0,2.0,2.0,2.0),
                          child: Icon(
                            Icons.clear,
                            color: Colors.pink,
                            size: 24.0,
                          ),
                        ),
                        SizedBox(height: 0,),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            "Clear",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 12
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      _clearAll();
                      gVipNo="";
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';
    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}