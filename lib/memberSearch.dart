import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myjemisysapp/data/dataService.dart';
import 'package:myjemisysapp/model/common.dart';
import 'package:myjemisysapp/model/dataobject.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'member.dart';
import 'package:simple_search_bar/simple_search_bar.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

void main(){
  runApp(new MaterialApp(
    home: new MemberSearch(),
  ));
}

class MemberSearch extends StatefulWidget {
  @override
  _MemberSearch createState() => new _MemberSearch();

}
//State is information of the application that can change over time or when some actions are taken.
class _MemberSearch extends State<MemberSearch>{
  final AppBarController appBarController = AppBarController();
  ScrollController _scrollController = new ScrollController();
  ScrollController _scrollController2 = new ScrollController();
  DataService obj = new DataService();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  List<UpdateMember> itemDt = [];
  final format = DateFormat('yyyy/MM/dd');
  final fdatetime = new DateFormat('dd-MM-yyyy hh:mm aa');
  bool _isOnTop = true;
  TextEditingController txtSearch = TextEditingController();
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  _scrollToTop() {
    _scrollController2.animateTo(_scrollController2.position.minScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    setState(() => _isOnTop = true);
  }

  Future<List<GetMemberMaster>> getCountry() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    gSetting = await obj.GetMemberCountry(param);
    if(gSetting==null){

    }
    else{

    }
    gCountryList = gSetting;
    return gSetting;

  }

  Future<List<GetMemberMaster>> getNationality() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    gSetting = await obj.GetMemberNationality(param);
    if(gSetting==null){

    }
    else{

    }
    gNationality = gSetting;
    return gSetting;

  }

  Future<List<GetMemberMaster>> getRace() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    gSetting = await obj.GetMemberRace(param);
    if(gSetting==null){

    }
    else{

    }
    gRace = gSetting;
    return gSetting;

  }

  Future<List<GetMemberMaster>> getReligion() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    gSetting = await obj.GetMemberReligion(param);
    if(gSetting==null){

    }
    else{

    }
    gReligion = gSetting;
    return gSetting;

  }

  Future<List<GetMemberMaster>> getMemberType() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    gSetting = await obj.GetMemberType(param);
    if(gSetting==null){

    }
    else{

    }
    gMemberType =gSetting;
    return gSetting;

  }

  Future<List<GetMemberMaster>> getMemberTitle() async {
    GetMemberMaster param = GetMemberMaster();
    param.values = "*ALL";
    param.connectionString=gconnectionstring;
    gSetting = await obj.GetMemberTitle(param);
    if(gSetting==null){

    }
    else{

    }


    gMemberTitle =gSetting;
    return gSetting;

  }

  Future<List<UpdateMember>> _fetchData() async {
    UpdateMember param = UpdateMember();
    param.value1 = txtSearch.text.trim();
    param.connectionString=gconnectionstring;
    var dt2 = await  obj.GetMemberList(param) ;
    itemDt = dt2;
    for(var a in dt2){
    }
    return dt2;
  }


  ListView Memberlist(List<UpdateMember> data) {
    return
      new ListView.builder(
        controller: _scrollController2,
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) =>
            Doclist(data[index]),
      );
  }

  // ignore: non_constant_identifier_names
  Widget Doclist(UpdateMember Dt){
    return  new  Card(
      clipBehavior: Clip.antiAlias,
      color: Color(0x22ff3a5a),
      shadowColor: Color(0xffff88379),
      elevation: 20,
      margin: EdgeInsets.all(10),
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: new Container(
        padding: EdgeInsets.fromLTRB(0,2,0,0),
        height:110,
        //width: double.maxFinite,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
                flex: 1,
                child: SizedBox(
                  height: double.infinity,
                  child: ListTile(
                    //contentPadding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
                    //leading: _buildLeadingTile(),
                      leading: Icon(Icons.arrow_right, color: Color(0xffff3764), size: 60),
                      //title: Text('${Dt.storeCode} ${Dt.docNo}  ${Dt.docType } '),
                      title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                '${Dt.name.toString()} ',maxLines: 1,
                                style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 15)
                              //style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold,fontSize: 14),
                            ),

                            SizedBox(
                              height: 4,
                            ),
                            Text(
                                '${Dt.vipNo} ',maxLines: 1,
                                style: GoogleFonts.poppins(color: Colors.black54,fontSize: 16)
                            ),

                            SizedBox(
                              height: 6,
                            ),
                            Text(
                                '${Dt.handphone} ',
                                style: GoogleFonts.poppins(color: Colors.black54,fontSize: 12)
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                                '${Dt.address} ',
                                style: GoogleFonts.poppins(color: Colors.black54,fontSize: 10.5)
                            ),
                          ]),

                      trailing: new IconButton(icon: Icon(Icons.edit,size: 35, color: Color(0xffff3764),),
                          onPressed: (){
                            gVipNo = Dt.vipNo.trim();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Member(),
                                // settings: RouteSettings(
                                // ),
                              ),
                            );
                          })
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  void loadDefault() async{
    await getMemberTitle();
    await getCountry();
    await getMemberType();
    await getNationality();
    await getRace();
    await getReligion();

    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController2 = ScrollController();
    txtSearch.text="";
    //loadDefault();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    double screenhight = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0), // here the desired height
          child: AppBar(
            title: Text("Member Search"),backgroundColor: Color(0xffff3a5a),centerTitle: true,
            leading: IconButton(icon:Icon(Icons.arrow_back),
                onPressed:() {
                  Navigator.pop(context, false);
                }
            ),
            actions: <Widget>[

            ],

          )
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body:
      SingleChildScrollView(
          child:Container(
            padding: const EdgeInsets.fromLTRB(10,10,10,5),
            child:  Container(
                height:  screenhight-(AppBar().preferredSize.height)-60,
                child: FutureBuilder<List<UpdateMember>>(
                  future: _fetchData(),
                  builder: (context, snapshot) {
                    if (itemDt.length > 0) {
                      List<UpdateMember> data = itemDt;
                      //return _jobsListView(data);
                      return Memberlist(data);

                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                      //return Text("No Record found");
                    }
                    //return Container();
                    return Text("No Record found!");
                  },
                )
            ),

          )
      ),

    );

  }
}
