import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myjemisysapp/model/dataobject.dart';
String gNotificationImageURL = 'http://51.79.160.233/NotificationImages/';
String gDocURL = 'http://51.79.160.233/JEMiSysDocuments/';
String gDocPath = 'D:/JO Documents/';
final String gconnectionstring="Server=51.79.160.233;Database=JEMiSys_Apps;User ID=jewel; Password=jewel;Trusted_Connection=False;Pooling=false;";
final String msgapiurl = 'http://51.79.160.233/JeMiSysNotificationsAPI/api/';
final String apiurl = 'http://51.79.160.233/JEMiSysAppToolsAPI/api/';
final String imageUrl='http://51.79.160.233/JewelImages/Images/';
final String emailapiurl = 'http://51.79.160.233/SMSeMailAppsToolAPI/';

class DataService {
  //SharedPreferences prefs;

  final Map<String, String> userheaders = {
    "Content-type": "application/json",
    "APIKey": "VEVTVDo1NTQyNTQzNTQ1Njk4NzQ1NA=="
  };


  // ignore: non_constant_identifier_names


  Future<UpdateMember> UpdateMemberdata(UpdateMember param) async {
    //print ('param:'+ param.toString());
    UpdateMember result;
    http.Response response = await http.post(
        apiurl + "Transaction/UpdateMember",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
    //print('tttttttttttttttttttt');
    // print(json.encode(param.toParam()));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = UpdateMember.fromJson(data);
      return result;
    }
    else {
      return result;
      //throw Exception('Failed to load album');
    }
  }

  Future<List<UpdateMember>> GetMemberList(UpdateMember param) async {
    List<UpdateMember> result = [];
    http.Response response = await http.post(
        apiurl + "Transaction/GetMemberSearch",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = UpdateMember.fromJson(i);
        if (iRow.status != "0") {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<GetMember> GetMemberData(GetMember param) async {
    GetMember result;
    http.Response response = await http.post(
        apiurl + "Transaction/GetMember",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = GetMember.fromJson(data);
      return result;
    }
    else {
      return result;
      //throw Exception('Failed to load album');
    }
  }

  Future<List<GetMemberMaster>> GetMemberCountry(GetMemberMaster param) async {
    List<GetMemberMaster> result = [];
    http.Response response = await http.post(
        apiurl + "Transaction/GetMemberCountry",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = GetMemberMaster.fromJson(i);
        if (iRow.status != 0) {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<List<GetMemberMaster>> GetMemberNationality(
      GetMemberMaster param) async {
    List<GetMemberMaster> result = [];
    http.Response response = await http.post(
        apiurl + "Transaction/GetMemberNationality",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = GetMemberMaster.fromJson(i);
        if (iRow.status != 0) {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<List<GetMemberMaster>> GetMemberRace(GetMemberMaster param) async {
    List<GetMemberMaster> result = [];
    http.Response response = await http.post(
        apiurl + "Transaction/GetMemberRace",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = GetMemberMaster.fromJson(i);
        if (iRow.status != 0) {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<List<GetMemberMaster>> GetMemberReligion(GetMemberMaster param) async {
    List<GetMemberMaster> result = [];
    http.Response response = await http.post(
        apiurl + "Transaction/GetMemberReligion",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = GetMemberMaster.fromJson(i);
        if (iRow.status != 0) {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<List<GetMemberMaster>> GetMemberType(GetMemberMaster param) async {
    List<GetMemberMaster> result = [];
    http.Response response = await http.post(
        apiurl + "Transaction/GetMemberType",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = GetMemberMaster.fromJson(i);
        if (iRow.status != 0) {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<List<GetMemberMaster>> GetMemberTitle(GetMemberMaster param) async {
    List<GetMemberMaster> result = [];
    http.Response response = await http.post(
        apiurl + "Transaction/GetMemberTitle",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      for (Map i in data) {
        var iRow = GetMemberMaster.fromJson(i);
        if (iRow.status != 0) {
          result.add(iRow);
        }
      }

      return result;
    }
    else {
      return result;
    }
  }


  // ignore: non_constant_identifier_names
  Future<List<GetCustomer>> GetCustomerList(GetCustomer param) async {
    List<GetCustomer> result = [];
    http.Response response = await http.post(
        apiurl + "Masters/GetCustomer",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );
//    print('tttttttttttttttttttttteeeeeeeeeeeeeeee');
//    print(json.encode(param.toParam()));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = GetCustomer.fromJson(i);
        if (iRow.status != 0) {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }

  // ignore: non_constant_identifier_names
  Future<List<GetVendor>> GetVendorList(GetVendor param) async {
    List<GetVendor> result = [];
    http.Response response = await http.post(
        apiurl + "Masters/GetVendor",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = GetVendor.fromJson(i);
        if (iRow.status != 0) {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }

  // ignore: non_constant_identifier_names
  Future<List<GetGoldType>> GetGoldTypeList(GetGoldType param) async {
    List<GetGoldType> result = [];
    http.Response response = await http.post(
        apiurl + "Masters/GetGoldType",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = GetGoldType.fromJson(i);
        if (iRow.status != 0) {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<Orders> UpdateOrders(Orders param) async {
    Orders result;
    http.Response response = await http.post(
        apiurl + "Order/UpdateOrder",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
    //print('tttttttttttttttttttttteeeeeeeeeeeeeeee');
    //print(json.encode(param.toParam()));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = Orders.fromJson(data);
      return result;
    }
    else {
      return result;
      //throw Exception('Failed to load album');
    }
  }

  Future<List<OrdersList>> GetOrdersList(OrdersParam param) async {
    List<OrdersList> result = [];
    http.Response response = await http.post(
        apiurl + "Order/GetOrder",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = OrdersList.fromJson(i);
        result.add(iRow);
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<List<POList>> GetPOList(OrdersParam param) async {
    List<POList> result = [];
    http.Response response = await http.post(
        apiurl + "Order/GetPO",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
//    print('tttttttttttttttttttttteeeeeeeeeeeeeeee');
//    print(json.encode(param.toParam()));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = POList.fromJson(i);
        result.add(iRow);
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<Users> GetUserData(Users param) async {
    Users result;
    //apiurl = await getUrl();
    http.Response response = await http.post(
        apiurl + "DeviceAndLogin/GetLogin",
        headers: userheaders,
        body: json.encode(param.toParam())

    );
    print('tttttttttttttttttttt');
    print(json.encode(param.toParam()));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = Users.fromJson(i);
        result = iRow;
      }
      return result;
    }
    else {
      return result;
      //throw Exception('Failed to load album');
    }
  }

  Future<ProgramRights> CheckProgramRights(ProgramRights param) async {
    ProgramRights result = ProgramRights();
    result.allowToAccess = true;
    return result;
  }

  Future<ReturnStatus> GetStoreInstallCode(String code) async {
    ReturnStatus result;
    //apiurl = await getUrl();
    var response = await http.get(apiurl + "Stores/GetStoreInstall/" + code);
    if (response.statusCode == 200) {
      var ddd = jsonDecode(response.body);
      var parsedJson = json.decode(response.body);
      result = ReturnStatus.fromJson(parsedJson);
      return result; //(json.decode(response.body));
    }
    else {
      return result;
      //throw Exception('Failed to load album');
    }
  }

  // ignore: missing_return
  Future<bool> setDefault() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs?.setString("apiUrl", "http://185.202.173.48:8082/RDSDev/api/");
//    prefs?.setString("imageUrl", "http://185.202.173.48/RdsPOS/Images/");
//    prefs?.setString("isLogin", "0");
  }

  Future<String> getUrl() async {
//    prefs = await SharedPreferences.getInstance();
//    apiurl = prefs.getString("apiUrl");
    return apiurl;
  }

  Future<List<AppsDeviceSetting>> GetAppDevieSetting() async {
    List<AppsDeviceSetting> setting = List<AppsDeviceSetting>();
    String apiurl = await getUrl();
    var response = await http.get(
        apiurl + "DeviceAndLogin/GetAppsDeviceSetting/custtomerID");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map dt in data) {
        setting.add((AppsDeviceSetting.fromJson(dt)));
      }
    }
    else {
      throw Exception('Failed to load album');
    }
    return setting;
  }

  Future<List<SignatureInvoiceList>> GetSignatureInvoiceList(
      SignatureInvoiceList param) async {
    List<SignatureInvoiceList> result = [];
    http.Response response = await http.post(
        apiurl + "Transaction/GetSignatureInvoiceList",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );
    //print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxiiiiiiiiii');
    //print(response.body );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = SignatureInvoiceList.fromJson(i);
        if (iRow.status != "0") {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<UpdateSignature> UpdateSignatureInvoice(UpdateSignature param) async {
    UpdateSignature result;
    http.Response response = await http.post(
        apiurl + "Transaction/UpdateeSignature",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = UpdateSignature.fromJson(data);
      return result;
    }
    else {
      return result;
      //throw Exception('Failed to load album');
    }
  }

  Future<UpdateEmail> UpdateMailID(UpdateEmail param) async {
    UpdateEmail result;
    http.Response response = await http.post(
        apiurl + "Transaction/UpdateMailID",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = UpdateEmail.fromJson(data);
      return result;
    }
    else {
      return result;
      //throw Exception('Failed to load album');
    }
  }

  Future<SendEmail> SendEmailtoCustomer(SendEmail param) async {
    SendEmail result;
    String sparam = '{"param":' + json.encode(param.toParam()) + '}';

    http.Response response = await http.post(
        emailapiurl + "SMSeMailService.svc/SendeMailToCustomerInvoice",
        headers: userheaders,
        //ody: json.encode(param.toParam())
        body: sparam
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = SendEmail.fromJson(data);
      return result;
    }
    else {
      return result;
      //throw Exception('Failed to load album');
    }
  }

  Future<CustomerLimit> GetCustomerLimit(Limit param) async {
    CustomerLimit result;
    http.Response response = await http.post(
        apiurl + "Masters/GetLimit",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
    //print(param.toParam());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = CustomerLimit.fromJson(data);
      return result;
    }
    else {
      return result;
    }
  }

  Future<CustomerLimit> UpdateCustomerLimit(CustomerLimit param) async {
    CustomerLimit result;
    http.Response response = await http.post(
        apiurl + "Masters/UpdateLimit",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
    //print(param.toParam());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = CustomerLimit.fromJson(data);
      return result;
    }
    else {
      return result;
    }
  }

  Future<GetSpotRate> GetSpotGoldRate(GetSpotRate param) async {
    GetSpotRate result;
    http.Response response = await http.post(
        apiurl + "Masters/GetSpotRate",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
    //print(param.toParam());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = GetSpotRate.fromJson(data);
      return result;
    }
    else {
      return result;
    }
  }

  Future<GRNTemp> UpdateGRNTemp(GRNTemp param) async {
    GRNTemp result;
    http.Response response = await http.post(
        apiurl + "Order/UpdateGRNTemp",
        headers: userheaders,
        body: json.encode(param.toParam())
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = GRNTemp.fromJson(data);
      return result;
    }
    else {
      return result;
      //throw Exception('Failed to load album');
    }
  }

  Future<GenerateGRN> UpdateGRN(GenerateGRN param) async {
    GenerateGRN result;
    http.Response response = await http.post(
        apiurl + "Order/GenerateGRN",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
    // print('tttttttttttttttttttttteeeeeeeeeeeeeeee');
    //print(json.encode(param.toParam()));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = GenerateGRN.fromJson(data);
      return result;
    }
    else {
      return result;
      //throw Exception('Failed to load album');
    }
  }

  Future<List<GRNTemp>> GetGRNTempList(GRNTemp param) async {
    List<GRNTemp> result = [];
    http.Response response = await http.post(
        apiurl + "Order/GetGRNTemp",
        headers: userheaders,
        body: json.encode(param.toParam())
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = GRNTemp.fromJson(i);
        result.add(iRow);
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<List<MailContent>> GetMessage(GetMailContent param) async {
    List<MailContent> result = [];
    http.Response response = await http.post(
        msgapiurl + "Message/GetMessage",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxiiiiiiiiii');
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = MailContent.fromJson(i);
        if (iRow.status != 0) {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }

  Future<UpdateMail> UpdateMessageContent(UpdateMail param) async {
    UpdateMail result;
    http.Response response = await http.post(
        msgapiurl + "Message/UpdateMessage",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      result = UpdateMail.fromJson(data);
      return result;
    }
    else {
      return result;
      //throw Exception('Failed to load album');
    }
  }

  Future<List<UpdateMail>> UpdateMessage(UpdateMail param) async {
    List<UpdateMail> result = [];
    http.Response response = await http.post(
        msgapiurl + "Message/UpdateMessage",
        headers: userheaders,
        body: json.encode(param.toParam())
      //body: sparam
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        var iRow = UpdateMail.fromJson(i);
        if (iRow.status != 0) {
          result.add(iRow);
        }
      }
      return result;
    }
    else {
      return result;
    }
  }
}