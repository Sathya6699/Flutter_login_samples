import 'dart:convert' show Base64Decoder, base64, utf8;
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:myjemisysapp/data/dataService.dart';
import 'package:intl/intl.dart';


class AppsDeviceSetting{
  String CustomerId;
  String ApiUrlLocal;
  String ApiUrlInterNet;
  String DbserverLocal;
  String DbserverInterNet;
  int Port;
  String Dbuser;
  String Dbpassword;
  String Dbname;
  String StoreCode;
  String ImageUrlLocal;
  String ImageUrlInterNet;
  String InstallUser;
  String InstallPwd;
  String Version;
  DateTime ReleaseDate;
  AppsDeviceSetting({
    this.CustomerId, this.ApiUrlLocal, this.ApiUrlInterNet, this.DbserverLocal,
    this.DbserverInterNet, this.Port, this.Dbuser, this.Dbpassword,
    this.Dbname, this.StoreCode, this.ImageUrlLocal, this.ImageUrlInterNet,
    this.InstallUser, this.InstallPwd,
    this.Version, this.ReleaseDate
  });
  factory AppsDeviceSetting.fromJson(Map<String, dynamic> json){
    return AppsDeviceSetting(
      CustomerId: json['customerId'],
      ApiUrlLocal: json['apiUrlLocal'],
      ApiUrlInterNet: json['apiUrlInterNet'],
      DbserverLocal: json['dbserverLocal'],
      DbserverInterNet: json['dbserverInterNet'],
      Dbname: json['dbname'],
      StoreCode: json['storeCode'],
      ImageUrlLocal: json['imageUrlLocal'],
      ImageUrlInterNet: json['imageUrlInterNet'],
      InstallUser: json['installUser'],
      InstallPwd: json['installPwd'],
      Version: json['version'],
      ReleaseDate: DateTime.parse(json['releaseDate']),
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'CustomerId': CustomerId,
        'ApiUrlLocal': ApiUrlLocal,
        'ApiUrlInterNet': ApiUrlInterNet,
        'DbserverLocal': DbserverLocal,
        'DbserverInterNet': DbserverInterNet,
        'Dbname': Dbname,
        'StoreCode': StoreCode,
        'ImageUrlLocal': ImageUrlLocal,
        'ImageUrlInterNet': ImageUrlInterNet,
        'InstallUser': InstallUser,
        'InstallPwd': InstallPwd,
        'Version': Version,
        'ReleaseDate': ReleaseDate
      };
}
class ReturnStatus {
  String status;
  String errorMessage;
  String value1;
  String value2;
  String value3;

  ReturnStatus({this.status, this.errorMessage, this.value1, this.value2, this.value3});
  factory ReturnStatus.fromJson(Map<String, dynamic> json){
    return ReturnStatus(
        status: json['status'],
        errorMessage: json['errorMessage'],
        value1: json['value1'],
        value2: json['value2'],
        value3: json['value3']
    );
  }
}
class DeviceLog {
  int companyCode;
  int storeCode;
  String userId;
  String userName;
  String password;
  bool isActive;
  String createdBy;
  DateTime createdDate;
  String macID;
  String defaultLanguage;
  int printTerminal;
  bool isAllowChangeCompany;
  bool isAllowChangeStore;
  bool isActiveDevice;
  bool stayLogin;
  String returnStatus;
  String returnMessage;
  DeviceLog({
    this.companyCode, this.storeCode, this.userId, this.userName,
    this.password, this.isActive, this.createdBy, this.createdDate,
    this.macID, this.defaultLanguage, this.printTerminal, this.isAllowChangeCompany,
    this.isAllowChangeStore, this.isActiveDevice, this.stayLogin,
    this.returnStatus, this.returnMessage
  });
  factory DeviceLog.fromJson(Map<String, dynamic> json){
    return DeviceLog(
        companyCode: json['companyCode'],
        storeCode: json['storeCode'],
        userId: json['userId'],
        userName: json['userName'],
        password: json['password'],
        isActive: json['isActive'],
        //createdBy: json['createdBy'],
        //createdDate: DateTime.parse(json['createdDate']),
        macID: json['macId'].toString(),
        defaultLanguage: json['defaultLanguage'],
        printTerminal: json['printTerminal'],
        isAllowChangeCompany: json['isAllowChangeCompany'],
        isAllowChangeStore: json['isAllowChangeStore'],
        isActiveDevice: json['isActiveDevice'],
        stayLogin: json['stayLogin'],
        returnStatus: json['returnStatus'],
        returnMessage: json['returnMessage']
    );
  }

  Map<String, dynamic> toJson() => {
    '"companyCode"': companyCode!=null ? companyCode : null ,
    '"storeCode"': storeCode != null ? storeCode : null,
    '"userId"': userId,
    '"userName"': userName,
    '"password"': password,
    '"isActive"': isActive,
    '"macID"': macID,
    '"defaultLanguage"': defaultLanguage,
    '"printTerminal"': printTerminal,
    '"isAllowChangeCompany"': isAllowChangeCompany,
    '"isAllowChangeStore"': isAllowChangeStore,
    '"isActiveDevice"': isActiveDevice,
    '"stayLogin"': stayLogin == null ? false : stayLogin,
    '"returnStatus"': returnStatus,
    '"returnMessage"': returnMessage
  };
}
class Devices{
  int CompanyCode;
  int StoreCode;
  String MacId;
  String UserName;
  String DefaultLanguage;
  int PrintTerminal;
  bool IsAllowChangeCompany;
  bool IsAllowChangeStore;
  bool IsActive;
  DateTime CreatedDate;
  DateTime LastUsed;

  Devices({
    this.CompanyCode, this.StoreCode, this.MacId, this.UserName,
    this.DefaultLanguage, this.PrintTerminal, this.IsAllowChangeCompany,
    this.IsAllowChangeStore, this.IsActive, this.CreatedDate, this.LastUsed
  });

  factory Devices.fromJson(Map<String, dynamic> json) {
    return Devices(
        CompanyCode: json['companyCode'],
        StoreCode: json['storeCode'],
        MacId: json['macId'],
        UserName: json['userName'],
        DefaultLanguage: json['defaultLanguage'],
        PrintTerminal: json['printTerminal'],
        IsAllowChangeCompany: json['isAllowChangeCompany'],
        IsAllowChangeStore: json['isAllowChangeStore'],
        IsActive: json['isActive'],
        CreatedDate: DateTime.parse(json['createdDate']),
        LastUsed: DateTime.parse(json['lastUsed'])
    );
  }
  Map<String, dynamic> toParam() =>
      {
        'CompanyCode': CompanyCode,
        'StoreCode': StoreCode,
        'MacId': MacId,
        'UserName': UserName
      };
}
class Users {
  String userID;
  String password;
  String description;
  bool allowtoChangeCompany;
  bool allowtoChangeStore;
  String deviceName;
  String returnStatus;
  bool status;
  String errorMessage;
  String connectionString;
  String macID;

  Users({
    this.userID, this.password, this.description, this.allowtoChangeCompany, this.allowtoChangeStore, this.deviceName,this .status, this.returnStatus,this.errorMessage
  });
  factory Users.fromJson(Map<String, dynamic> json){
    print("testjson");
    return Users(
      userID: json['userID'],
      //password: json['password'],
      description: json['description'],
      //allowtoChangeCompany: json['allowtoChangeCompany'],
      // allowtoChangeStore: json['allowtoChangeStore'],
      // deviceName: json['deviceName'],
      returnStatus: json['returnStatus'],
      // errorMessage: json['errorMessage'],
    );
  }
  Map<String, dynamic> toParam() =>{
    'userID': userID,
    'password': password,
    'deviceName':deviceName,
    'connectionString':connectionString,
    'macID':macID,
  };
}


class ProgramRights{
  int companyCode;
  int storeCode;
  String userId;
  String document;
  bool allowToAccess;
  ProgramRights({
    this.companyCode, this.storeCode, this.userId, this.document, this.allowToAccess
  });
  factory ProgramRights.fromJson(Map<String, dynamic> json){
    return ProgramRights(
        companyCode: json['companyCode'],
        storeCode: json['storeCode'],
        userId: json['userId'],
        document: json['document'],
        allowToAccess: json['allowToAccess']
    );
  }
  Map<String, dynamic> toParam() =>{
    'companyCode': companyCode,
    'storeCode': storeCode,
    'userId': userId,
    'document': document,
    'allowToAccess': allowToAccess

  };
}
class SignatureInvoiceList {
  String storeCode;
  String date;
  String docNo;
  String vipNo;
  String gross;
  String discount;
  String addDiscount;
  String total;
  String gst;
  String net ;
  String refNo;
  String docStatus;
  String docType;
  String docType2;
  String orderBy;
  String reprintCount;
  String status;
  String connectionString;
  String invoiceNo;
  String fromDate;
  String toDate;
  ByteData ImageVal ;
  List<int> bytes;
  String vipName;
  String mode;
  String email;
  int filesCount;

  SignatureInvoiceList({
    this.storeCode, this.date , this.docNo, this.vipNo, this.gross, this.discount, this.addDiscount, this.total,
    this.gst, this.net,this.refNo, this.docStatus,this.docType, this.docType2, this.orderBy,this.reprintCount,this. status,
    this.ImageVal, this.bytes, this.vipName, this.email, this.filesCount
  });
  factory SignatureInvoiceList.fromJson(Map<String, dynamic> json){
    var snapshot;
    var bytesString = json["imageVal"] as String;
    //List<int> bytesList =base64.decode(bytesString);
//      print(bytesList.toString());
    return SignatureInvoiceList(

      storeCode: json['storeCode'],
      date: json['date'],
      docNo: json['docNo'],
      vipNo: json['vipNo'],
//        gross: json['gross'],
//        discount: json['discount'],
//        addDiscount: json['addDiscount'],
//        total: json['total'],
//        gst: json['gst'],
      net: json['net'].toStringAsFixed(2),
//        refNo: json['refNo'],
//        docStatus: json['docStatus'],
      docType: json['docType'],
      docType2: json['docType2'],
      orderBy: json['orderBy'],
      status: json['status'].toString(),
      bytes: bytesString != null && bytesString != "" ? base64.decode(bytesString) : null, //base64.decode(bytesString)
      vipName:json['vipName'],
      email:json['email'],
      filesCount:json['filesCount'],
      //ImageVal: json['ImageVal'] != null ? json['ImageVal'].Base64Decoder : json['ImageVal'],
    );
  }
  Map<String, dynamic> toParam() =>{
    'storeCode': storeCode,
    'date': date,
    'docNo': docNo,
    'vipNo': vipNo,
    'gross': gross,
    'discount': discount,
    'addDiscount': addDiscount,
    'total': total,
    'gst': gst,
    'net': net,
    'refNo': refNo,
    'docStatus': docStatus,
    'docType': docType,
    'docType2': docType2,
    'orderBy': orderBy,
    'reprintCount': reprintCount,
    'status': status,
    'connectionString':connectionString,
    'invoiceNo':invoiceNo,
    'fromDate':fromDate,
    'toDate':toDate,
    'mode':mode,
    'email':email,

  };
}
class UpdateSignature {
  String storeCode;
  String macID;
  String invoiceNo;
  String docType;
  ByteData ImageVal= ByteData(0) ;
  String ImageVal2 ;
  String userID;
  String Mode;
  String connectionString;
  String returnStatus;
  String errorMessage;
  String status;


  UpdateSignature({
    this.storeCode, this.invoiceNo , this.macID, this.docType, this.userID, this.returnStatus,
    this.errorMessage,this.status
  });
  factory UpdateSignature.fromJson(Map<String, dynamic> json){
    return UpdateSignature(
      /*  storeCode: json['storeCode'],
        macID: json['macID'],
        invoiceNo: json['invoiceNo'],
        docType: json['docType'],*/
      status: json['status'].toString(),
      returnStatus:json['returnStatus'],

    );
  }
  Map<String, dynamic> toParam() =>{
    'macID':macID,
    'storeCode': storeCode,
    'invoiceNo':invoiceNo,
    'docType': docType,
    'ImageVal':  ImageVal2,
    //'ImageVal':ImageVal.toString(),
    //'ImageVal2':ImageVal2==null? ByteData(0) :ImageVal,
    'userID':userID,
    'Mode':Mode,
    'connectionString':connectionString,

  };
}
class UpdatePhoto {
  String imageVal;
  String imageVal2;
  String imageVal3;
  String imageVal4;
  String imageName;
  String imageName2;
  String imageName3;
  String imageName4;
  String storeCode;
  String docNo;
  String docType;
  int filesCount;
  String connectionString;
  String returnStatus;
  String errorMessage;
  String status;

  UpdatePhoto({
    this.imageName, this.imageName2, this.imageName3, this.imageName4,
    this.storeCode, this.docNo, this.docType, this.filesCount,
    this.returnStatus, this.errorMessage, this.status
  });
  factory UpdatePhoto.fromJson(Map<String, dynamic> json){
    return UpdatePhoto(
      status: json['status'].toString(),
      returnStatus: json['returnStatus'],
    );
  }

  Map<String, dynamic> toParam() =>{
    'storeCode': storeCode,
    'docNo': docNo,
    'docType': docType,
    'filesCount': filesCount,
    'connectionString': connectionString,
    'imageName': imageName,
    'imageVal': imageVal,
    'imageVal2': imageVal2,
    'imageName2': imageName2,
    'imageVal3': imageVal3,
    'imageName3': imageName3,
    'imageVal4': imageVal4,
    'imageName4': imageName4,
  };
}
class DownloadPhoto {
  String fileName;
  String imageFileName;
  String filePath;
  String returnStatus;
  String errorMessage;
  String status;

  DownloadPhoto({
    this.fileName, this.imageFileName, this.filePath, this.returnStatus, this.errorMessage, this.status
  });
  factory DownloadPhoto.fromJson(Map<String, dynamic> json){
    return DownloadPhoto(
      imageFileName: gDocURL + json["imageFileName"],
      filePath: json["filePath"].toString(),
    );
  }

  Map<String, dynamic> toParam() =>{
    'fileName': fileName,
  };
}
class SendEmail {
  String source;
  String storeCode;
  String macid;
  String mailHost;
  String mailFrom;
  String mailTo;
  String mailSubject;
  String mailBody;
  String mailAttachFileName;
  String docno;
  String returnStatus;
  String errormsg;
  String status;
  String connectionString;
  String doctype;
  String vipname;
  String userid;
  String SendeMailToCustomerInvoiceResult;
  SendEmail({
    this.source, this.storeCode , this.macid, this.mailHost, this.mailFrom, this.mailTo,
    this.mailSubject,this.mailBody,this.mailAttachFileName,this.docno,this.returnStatus,this.errormsg,this.status,
    this.doctype,this.vipname,this.userid,this.SendeMailToCustomerInvoiceResult
  });
  factory SendEmail.fromJson(Map<String, dynamic> json){
    return SendEmail(
      returnStatus:json['SendeMailToCustomerInvoiceResult'].toString(),
    );
  }
  Map<String, dynamic> toParam() =>{

    'storeCode': storeCode,
    'docno':docno,
    'macid':macid,
    'mailTo':mailTo,
    'doctype':doctype,
    'vipname':vipname,
    'userid':userid,

  };
}
class UpdateEmail {
  String vipNo;
  String mailID;
  String phoneNo;
  String userID;
  String connectionString;
  String returnStatus;
  String errorMessage;
  String status;

  UpdateEmail({
    this.vipNo, this.mailID , this.phoneNo, this.userID, this.returnStatus,
    this.errorMessage,this.status,this.connectionString
  });
  factory UpdateEmail.fromJson(Map<String, dynamic> json){
    return UpdateEmail(
      status: json['status'].toString(),
      returnStatus:json['returnStatus'],
    );
  }
  Map<String, dynamic> toParam() =>{
    'vipNo':vipNo,
    'mailID': mailID,
    'phoneNo':phoneNo,
    'userID':userID,
    'connectionString':connectionString,

  };
}
class GetCustomer {
  String values;
  String customerCode;
  String vendorCode;
  String customerName;
  String errorMessage;
  String connectionString;
  int status;

  GetCustomer({
    this.customerCode,this.customerName,this.status,this.vendorCode
  });
  factory GetCustomer.fromJson(Map<String, dynamic> json){
    return GetCustomer(
      customerCode: json['customerCode'].toString().trim(),
      customerName: json['customerName'].toString().trim(),

    );
  }
  Map<String, dynamic> toParam() =>{
    'customerCode':customerCode,
    'vendorCode':vendorCode,
    'connectionString':connectionString,

  };
}
class Limit {
  String customerCode;
  String customerName;
  String vendorCode;
  String vendorName;
  String errorMessage;
  String connectionString;
  int status;

  Limit({
    this.customerCode, this.customerName, this.vendorCode, this.vendorName, this.status
  });
  Map<String, dynamic> toParam() =>{
    'customerCode': customerCode,
    'vendorCode': vendorCode,
    'connectionString':connectionString,

  };
}
class GetGoldType {
  String goldType;
  String goldType2;
  double purity;
  double goldWeight;
  double goldListPrice;
  bool bop_Buy;
  bool bop_Sell;
  String errorMessage;
  String connectionString;
  int status;
  String vendorCode;

  GetGoldType({
    this.goldType,this.purity,this.goldWeight,this.goldListPrice,this.bop_Buy,this.bop_Sell,this.goldType2
  });
  factory GetGoldType.fromJson(Map<String, dynamic> json){
    return GetGoldType(
      goldType: json['goldType'],
      goldType2: json['goldType2'],
      goldWeight:double.parse(json['goldWeight'].toString()),
      purity: double.parse(json['purity'].toString()),
      //bop_Buy: json['bop_Buy'],
      // bop_Sell: json['bop_Sell'],
    );
  }
  Map<String, dynamic> toParam() =>{
    'vendorCode':vendorCode,
    'connectionString':connectionString,
  };
}
class Orders {
  String orderNo;
  String orderType;
  String customerCode;
  String userID;
  String buySell;
  double priceGram;
  double costGram;
  String bookByWeight_Amount;
  double weight;
  double amount;
  String classCode;
  String connectionString;
  String returnStatus;
  String value;
  String mode;
  int status;

  Orders({
    this.orderNo,this.orderType,this.customerCode,this.userID,this.buySell,this.priceGram,
    this.bookByWeight_Amount,this.weight,this.amount,this.classCode,this.connectionString,
    this.returnStatus,this.value,this.status,this.mode,this.costGram
  });
  factory Orders.fromJson(Map<String, dynamic> json){
    return Orders(
        returnStatus: json['returnStatus'],
        value: json['value'].toString().trim(),
        status: json['status']
    );
  }
  Map<String, dynamic> toParam() =>{
    'orderNo':orderNo,
    'orderType':orderType,
    'customerCode':customerCode,
    'userID':userID,
    'buySell':buySell,
    'priceGram':priceGram,
    'costGram':costGram,
    'bookByWeight_Amount':bookByWeight_Amount,
    'weight':weight,
    'amount':amount,
    'classCode':classCode,
    'mode':mode,
  };
}
class OrdersParam {
  String orderType;
  String customerCode;
  String vendorCode;
  String buySell;
  String status;
  String dateFrom;
  String dateTo;

  OrdersParam({
    this.orderType, this.customerCode, this.vendorCode, this.buySell, this.status, this.dateFrom, this.dateTo
  });

  Map<String, dynamic> toParam() =>{
    'orderType':orderType,
    'customerCode':customerCode,
    'vendorCode':vendorCode,
    'buySell':buySell,
    'status':status,
    'dateFrom':dateFrom,
    'dateTo':dateTo
  };
}
class OrdersList {
  String orderNo;
  String orderType;
  String orderTypeDesc;
  String transDate;
  String customerCode;
  String userID;
  String buySell;
  String buySellDesc;
  double priceGram;
  String bookByWeight_Amount;
  double weight;
  double amount;
  double feesPerGram;
  double totalFees;
  double totalAmount;
  String classCode;
  String status;
  String statusDesc;
  String executedDateTime;
  String returnStatus;
  String value;

  OrdersList({
    this.orderNo,this.orderType,this.orderTypeDesc,this.transDate,this.customerCode,
    this.userID,this.buySell,this.buySellDesc,this.priceGram,this.bookByWeight_Amount,
    this.weight,this.amount,this.feesPerGram,this.totalFees,this.totalAmount,
    this.classCode,this.status,this.statusDesc,this.executedDateTime,
    this.returnStatus,this.value,
  });
  factory OrdersList.fromJson(Map<String, dynamic> json){
    return OrdersList(
      orderNo: json['orderNo'],
      orderType: json['orderType'],
      orderTypeDesc: json['orderTypeDesc'],
      transDate: json['transDate'],
      customerCode: json['customerCode'],
      userID: json['userID'],
      buySell: json['buySell'],
      buySellDesc: json['buySellDesc'],
      priceGram: double.parse(json['priceGram'].toString()),
      bookByWeight_Amount: json['bookByWeight_Amount'],
      weight: double.parse(json['weight'].toString()),
      amount: double.parse(json['amount'].toString()),
      feesPerGram: double.parse(json['feesPerGram'].toString()),
      totalFees: double.parse(json['totalFees'].toString()),
      totalAmount: double.parse(json['totalAmount'].toString()),
      classCode: json['classCode'],
      status: json['status'],
      statusDesc: json['statusDesc'],
      executedDateTime: json['executedDateTime'],
      returnStatus: json['returnStatus'],
      value: json['value'].toString().trim(),
    );
  }
}
class CustomerLimit {
  String customerCode;
  String customerName;
  String vendorCode;
  String vendorName;
  String bop_BuyGoldLimit_Wt;
  String bop_BuyGoldMin_Wt;
  String bop_BuyGoldMax_Wt;
  String bop_BuyGoldBalance_Wt;
  String bop_BuyRefinery_Gram;
  String bop_SellGoldLimit_Wt;
  String bop_SellGoldMin_Wt;
  String bop_SellGoldMax_Wt;
  String bop_SellGoldBalance_Wt;
  String bop_SellPremium_Gram;
  String errorMessage;
  String connectionString;
  String returnStatus;

  CustomerLimit({
    this.customerCode, this.customerName, this.returnStatus,this.vendorCode,this.vendorName,
    this.bop_BuyGoldBalance_Wt, this.bop_BuyGoldLimit_Wt, this.bop_BuyGoldMax_Wt, this.bop_BuyGoldMin_Wt, this.bop_BuyRefinery_Gram,
    this.bop_SellGoldBalance_Wt, this.bop_SellGoldLimit_Wt, this.bop_SellGoldMax_Wt, this.bop_SellGoldMin_Wt, this.bop_SellPremium_Gram
  });

  factory CustomerLimit.fromJson(Map<String, dynamic> json){
    return CustomerLimit(
      customerCode: json['customerCode'],
      customerName: json['customerName'].toString().trim(),
      vendorCode: json['vendorCode'],
      vendorName: json['vendorName'].toString().trim(),
      bop_BuyGoldBalance_Wt: json["bop_BuyGoldBalance_Wt"].toString != '' ? json["bop_BuyGoldBalance_Wt"].toStringAsFixed(4) : 0.0001,
      bop_BuyGoldLimit_Wt: json["bop_BuyGoldLimit_Wt"] != null ? json["bop_BuyGoldLimit_Wt"].toStringAsFixed(4) : 0.0001,
      bop_BuyGoldMax_Wt: json["bop_BuyGoldMax_Wt"] != null ? json["bop_BuyGoldMax_Wt"].toStringAsFixed(4) : 0.0001,
      bop_BuyGoldMin_Wt: json["bop_BuyGoldMin_Wt"] != null ? json["bop_BuyGoldMin_Wt"].toStringAsFixed(4) : 0.0001,
      bop_BuyRefinery_Gram: json["bop_BuyRefinery_Gram"] != null ? json["bop_BuyRefinery_Gram"].toStringAsFixed(4) : 0.0001,
      bop_SellGoldBalance_Wt: json["bop_SellGoldBalance_Wt"] != null ? json["bop_SellGoldBalance_Wt"].toStringAsFixed(4) : 0.0001,
      bop_SellGoldLimit_Wt: json["bop_SellGoldLimit_Wt"] != null ? json["bop_SellGoldLimit_Wt"].toStringAsFixed(4) : 0.0001,
      bop_SellGoldMax_Wt: json["bop_SellGoldMax_Wt"] != null ? json["bop_SellGoldMax_Wt"].toStringAsFixed(4) : 0.0001,
      bop_SellGoldMin_Wt: json["bop_SellGoldMin_Wt"] != null ? json["bop_SellGoldMin_Wt"].toStringAsFixed(4) : 0.0001,
      bop_SellPremium_Gram: json["bop_SellPremium_Gram"] != null ? json["bop_SellPremium_Gram"].toStringAsFixed(4) : 0.0001,
      returnStatus: json['returnStatus'].toString(),
    );
  }

  Map<String, dynamic> toParam() =>{
    'customerCode':customerCode,
    'customerName':customerName,
    'vendorCode':vendorCode,
    'vendorName':vendorName,
    'bop_BuyGoldMin_Wt':double.parse(bop_BuyGoldMin_Wt),
    'bop_BuyGoldMax_Wt':double.parse(bop_BuyGoldMax_Wt),
    'bop_BuyGoldLimit_Wt':double.parse(bop_BuyGoldLimit_Wt),
    'bop_BuyRefinery_Gram':double.parse(bop_BuyRefinery_Gram),
    'bop_SellGoldMin_Wt':double.parse(bop_SellGoldMin_Wt),
    'bop_SellGoldMax_Wt':double.parse(bop_SellGoldMax_Wt),
    'bop_SellGoldLimit_Wt':double.parse(bop_SellGoldLimit_Wt),
    'bop_SellPremium_Gram':double.parse(bop_SellPremium_Gram)
  };
}
class GetSpotRate {
  String currCode;
  double buySpotRate;
  double sellSpotRate;
  double exchRate;
  double buyRate;
  double sellRate;
  double buyMarkup;
  double sellMarkup;
  String createdBy;
  String errorMessage;
  String connectionString;
  int status;

  GetSpotRate({
    this.currCode,this.buySpotRate,this.sellSpotRate,this.exchRate,this.buyRate,this.sellRate,
    this.buyMarkup,this.sellMarkup,this.createdBy
  });
  factory GetSpotRate.fromJson(Map<String, dynamic> json){
    return GetSpotRate(
      buySpotRate: json['buySpotRate'],
      sellSpotRate: json['sellSpotRate'],
      buyRate: json['buyRate'],
      sellRate: json['sellRate'],
      buyMarkup: json['buyMarkup'],
      sellMarkup: json['sellMarkup'],
    );
  }
  Map<String, dynamic> toParam() =>{
    'connectionString':connectionString,
  };
}
class GetVendor {
  String values;
  String vendorCode;
  String vendorName;
  String errorMessage;
  String connectionString;
  int status;

  GetVendor({
    this.vendorCode,this.vendorName
  });
  factory GetVendor.fromJson(Map<String, dynamic> json){
    return GetVendor(
      vendorCode: json['vendorCode'].toString().trim(),
      vendorName: json['vendorName'].toString().trim(),

    );
  }
  Map<String, dynamic> toParam() =>{
    'vendorCode':vendorCode,
    'connectionString':connectionString,
  };
}
class POList {
  String fromDate;
  String toDate;
  String docNo;
  String docDesc;
  String orderNo;
  String orderType;
  String orderTypeDesc;
  String transDate;
  String customerCode;
  String userID;
  String buySell;
  String buySellDesc;
  double priceGram;
  String bookByWeight_Amount;
  double weight;
  double receivedWeight;
  double amount;
  double feesPerGram;
  double totalFees;
  double totalAmount;
  String classCode;
  String status;
  String statusDesc;
  String executedDateTime;
  String mode;

  POList({
    this.docNo,this.docDesc,this.orderNo,this.orderType,this.orderTypeDesc,this.transDate,this.customerCode,
    this.userID,this.buySell,this.buySellDesc,this.priceGram,this.bookByWeight_Amount,
    this.weight,this.amount,this.feesPerGram,this.totalFees,this.totalAmount,
    this.classCode,this.status,this.statusDesc,this.executedDateTime,
    this.mode,
  });
  factory POList.fromJson(Map<String, dynamic> json){
    return POList(
      docNo: json['docNo'],
      docDesc: json['docDesc'],
      orderNo: json['orderNo'],
      orderType: json['orderType'],
      orderTypeDesc: json['orderTypeDesc'],
      transDate: json['transDate'],
      customerCode: json['customerCode'],
      userID: json['userID'],
      buySell: json['buySell'],
      buySellDesc: json['buySellDesc'],
      priceGram: double.parse(json['priceGram'].toString()),
      bookByWeight_Amount: json['bookByWeight_Amount'],
      weight: double.parse(json['weight'].toString()),
      amount: double.parse(json['amount'].toString()),
      feesPerGram: double.parse(json['feesPerGram'].toString()),
      totalFees: double.parse(json['totalFees'].toString()),
      totalAmount: double.parse(json['totalAmount'].toString()),
      classCode: json['classCode'],
      status: json['status'],
      statusDesc: json['statusDesc'],
      executedDateTime: json['executedDateTime'],

    );
  }
//  Map<String, dynamic> toParam() =>{
//    'fromDate':fromDate,
//    'toDate':toDate,
//    'customerCode':customerCode,
//    'orderNo':orderNo,
//    'buySell':buySell,
//    'status':status,
//  };
}
class GRNTemp {
  String udID;
  String docNo;
  String docType;
  String vendorCode;
  String classCode;
  double grossWeight;
  double purity;
  double weight;
  String createdBy;
  String mode;
  String returnStatus;
  String errorMessage;
  int status;
  String value;
  GRNTemp({
    this.udID, this.docNo , this.docType, this.vendorCode, this.classCode,
    this.grossWeight,this.purity,this.weight,this.createdBy,this.mode,this.returnStatus,
    this.errorMessage,this.status,this.value
  });
  factory GRNTemp.fromJson(Map<String, dynamic> json){
    return GRNTemp(
      udID:json['udID'].toString(),
      docNo:json['docNo'].toString(),
      docType:json['docType'].toString(),
      vendorCode:json['vendorCode'].toString(),
      classCode:json['classCode'].toString(),
      grossWeight:double.parse(json['grossWeight'].toString()),
      purity:double.parse(json['purity'].toString()),
      weight:double.parse(json['weight'].toString()),
      createdBy:json['createdBy'],
      returnStatus: json['returnStatus'].toString(),
      errorMessage:json['errorMessage'],
      status:json['status'],
    );
  }
  Map<String, dynamic> toParam() =>{
    'udID':udID,
    'docNo': docNo,
    'docType':docType,
    'vendorCode':vendorCode,
    'classCode':classCode,
    'grossWeight':grossWeight,
    'purity':purity,
    'weight':weight,
    'createdBy':createdBy,
    'mode':mode,
  };
}

class GenerateGRN  {
  String udID;
  String docNo;
  String docType;
  String vendorCode;
  String classCode;
  double grossWeight;
  double purity;
  double weight;
  String createdBy;
  String mode;
  String returnStatus;
  String errorMessage;
  int status;
  String value;
  GenerateGRN({
    this.udID, this.docNo , this.docType, this.vendorCode, this.classCode,
    this.grossWeight,this.purity,this.weight,this.createdBy,this.mode,this.returnStatus,
    this.errorMessage,this.status,this.value
  });
  factory GenerateGRN.fromJson(Map<String, dynamic> json){
    return GenerateGRN(
      udID:json['udID'].toString(),
      returnStatus: json['returnStatus'].toString(),
      errorMessage:json['errorMessage'],
      status:json['status'],
    );
  }
  Map<String, dynamic> toParam() =>{
    'udID':udID,
    'vendorCode': vendorCode,
    'createdBy':createdBy,
  };
}
class UpdateMember {
  String vipNo;
  String memberType;
  String title;
  String memberName;
  String nricNo;
  String address;
  String address2;
  String address3;
  String address4;
  String country ;
  String nationality;
  String postal;
  String handphone;
  String telephone;
  String email;
  int isSendEMail;
  int isSendSMS;
  String dob;
  String gender;
  String race;
  String religion;
  String mode;
  double goldRateDiscount;
  double discountPer;
  double bDayDiscountPer;
  String referredVIPNo;
  String storeCode;
  String userID;
  int status;
  String errorMessage;
  String returnStatus;
  String connectionString;
  String value1;
  String name;
  String value;
  UpdateMember({
    this.vipNo, this.memberType , this.title, this.memberName, this.nricNo, this.address, this.address2, this.address3,
    this.address4, this.country,this.nationality, this.postal,this.handphone, this.telephone, this.email,this.isSendEMail,this. isSendSMS,
    this.dob, this.gender, this.race, this.religion,this.goldRateDiscount,this.discountPer,this.bDayDiscountPer,this.referredVIPNo,
    this.storeCode,this.userID,this.mode,this.status,this.errorMessage,this.returnStatus,this.name,this.value
  });
  factory UpdateMember.fromJson(Map<String, dynamic> json){
    var snapshot;
    return UpdateMember(
      vipNo: json['vipNo'],
      memberType: json['memberType'],
      title: json['title'],
      memberName: json['memberName'],
      name: json['name'],
      nricNo: json['nricNo'],
      address: json['address'],
      address2: json['address2'],
      address3: json['address3'],
      address4: json['address4'],
      country:json['country'],
      nationality:json['nationality'],
      postal:json['postal'],
      handphone:json['handphone'],
      telephone:json['telephone'],
      email:json['email'],
      isSendEMail:json['isSendEMail'],
      isSendSMS:json['isSendSMS'],
      // dob:json['dob'],
      gender:json['gender'],
      race:json['race'],
      religion:json['religion'],
      // goldRateDiscount:json['goldRateDiscount'].toStringAsFixed(2),
      // discountPer:json['discountPer'].toStringAsFixed(2),
      //bDayDiscountPer:json['bDayDiscountPer'].toStringAsFixed(2),
      referredVIPNo:json['referredVIPNo'],
      storeCode:json['storeCode'],
      userID:json['userID'],
      status:json['status'],
      //  errorMessage:json['errorMessage'],
      returnStatus:json['returnStatus'],
      value:json['value'],
    );
  }
  Map<String, dynamic> toParam() =>{
    'vipNo': vipNo,
    'memberType': memberType,
    'title': title,
    'memberName': memberName,
    'nricNo': nricNo,
    'address': address,
    'address2': address2,
    'address3': address3,
    'address4': address4,
    'country': country,
    'nationality': nationality,
    'postal': postal,
    'handphone': handphone,
    'telephone': telephone,
    'email': email,
    'isSendEMail':isSendEMail,
    'isSendSMS':isSendSMS,
    'dob':dob,
    'gender':gender,
    'race':race,
    'religion':religion,
    'goldRateDiscount': goldRateDiscount,
    'discountPer': discountPer,
    'bDayDiscountPer': bDayDiscountPer,
    'referredVIPNo': referredVIPNo,
    'Mode': mode,
    'connectionString':connectionString,
    'value1':value1,
  };
}
class GetMember {
  String vipNo;
  String memberType;
  String title;
  String memberName;
  String nricNo;
  String address;
  String address2;
  String address3;
  String address4;
  String country ;
  String nationality;
  String postal;
  String handphone;
  String telephone;
  String email;
  int isSendEMail;
  int isSendSMS;
  String dob;
  String gender;
  String race;
  String religion;
  String mode;
  String goldRateDiscount;
  String discountPer;
  String bDayDiscountPer;
  String referredVIPNo;
  String storeCode;
  String userID;
  int status;
  String errorMessage;
  String connectionString;
  String value1;


  GetMember({
    this.vipNo, this.memberType , this.title, this.memberName, this.nricNo, this.address, this.address2, this.address3,
    this.address4, this.country,this.nationality, this.postal,this.handphone, this.telephone, this.email,
    this.dob, this.gender, this.race, this.religion,this.goldRateDiscount,this.discountPer,this.bDayDiscountPer,this.referredVIPNo,
    this.storeCode,this.userID,this.mode,this.status,this.errorMessage,this.isSendEMail,this.isSendSMS
  });
  factory GetMember.fromJson(Map<String, dynamic> json){
    return GetMember(
      vipNo: json['vipNo'],
      memberType: json['memberType'],
      title: json['title'],
      memberName: json['memberName'],
      nricNo: json['nricNo'],
      address: json['address'],
      address2: json['address2'],
      address3: json['address3'],
      address4: json['address4'],
      country:json['country'],
      nationality:json['nationality'],
      postal:json['postal'],
      handphone:json['handphone'],
      telephone:json['telephone'],
      email:json['email'],
      isSendEMail:json['isSendEMail'],
      isSendSMS:json['isSendSMS'],
      dob:json['dob'],
      gender:json['gender'],
      race:json['race'],
      religion:json['religion'],
      // goldRateDiscount:json['goldRateDiscount'].toStringAsFixed(2),
      // discountPer:json['discountPer'].toStringAsFixed(2),
      //bDayDiscountPer:json['bDayDiscountPer'].toStringAsFixed(2),
      referredVIPNo:json['referredVIPNo'],
      storeCode:json['storeCode'],
      userID:json['userID'],
      status:json['status'],
      errorMessage:json['errorMessage'],

    );
  }
  Map<String, dynamic> toParam() =>{
    'value1':value1,
    'connectionString':connectionString,
  };
}
class GetMemberMaster {
  String values;
  String connectionString;
  String errorMessage;
  int status;

  GetMemberMaster({
    this.values,this.errorMessage,this.status
  });
  factory GetMemberMaster.fromJson(Map<String, dynamic> json){
    return GetMemberMaster(
      status: json['status'],
      values: json['values'].toString().trim(),

    );
  }
  Map<String, dynamic> toParam() =>{
    'values':values,
    'connectionString':connectionString,

  };
}
class MailContent{
  int iD;
  String fromUID;
  String fromEmail;
  String toUID;
  String toEmail;
  String subject;
  String message;
  String messageType;
  String mode;
  int status;
  String value;
  String returnStatus;
  String errorMessage;
  int parentID;
  String connectionString;
  String createdDate;
  String imageFileName;
  String fdatetime;

  MailContent({this.iD,this.fromUID,this.fromEmail,this.toUID,this.toEmail,this.subject,
    this.message,this.messageType,this.mode,this.status,this.value,this.returnStatus,
    this.errorMessage,this.parentID,this.connectionString,this.createdDate,this.imageFileName,this.fdatetime});

  factory MailContent.fromJson(Map<String, dynamic> json){
    return MailContent(
      iD: json['iD'],
      fromUID: json['fromUID'].toString(),
      fromEmail: json['fromEmail'].toString(),
      toUID: json['toUID'].toString(),
      toEmail: json['toEmail'].toString(),
      subject: json['subject'].toString(),
      message: json['message'].toString(),
      messageType: json['messageType'].toString(),
      // mode: json['mode'].toString(),
      // status: json['status'],
      errorMessage: json['errorMessage'].toString(),
      parentID: json['parentID'],
      createdDate: json['createdDate'].toString(),
      imageFileName: json['imageFileName'],
    );
  }

  Map<String, dynamic> toParam() =>{
    'iD':iD,
    'fromUID':fromUID,
    'fromEmail':fromEmail,
    'toUID':toUID,
    'toEmail':toEmail,
    'subject':subject,
    'message':message,
    'messageType':messageType,
    'mode':mode,
    'ImageFileName':imageFileName,

  };
}
class GetMailContent{
  int iD;
  String fromUID;
  String fromEmail;
  String toUID;
  String toEmail;
  String subject;
  String message;
  String messageType;
  String mode;
  int status;
  String value;
  String returnStatus;
  String errorMessage;
  int parentID;
  String connectionString;
  String createdDate;

// ignore: non_constant_identifier_names
  String ImageFileName;
  GetMailContent({this.iD,this.fromUID,this.fromEmail,this.toUID,this.toEmail,this.subject,
    this.message,this.messageType,this.mode,this.status,this.value,this.returnStatus,
    // ignore: non_constant_identifier_names
    this.errorMessage,this.parentID,this.connectionString,this.createdDate,this.ImageFileName});

  factory GetMailContent.fromJson(Map<String, dynamic> json){
    return GetMailContent(
      iD: json['iD'],
      fromUID: json['fromUID'].toString(),
      fromEmail: json['fromEmail'].toString(),
      toUID: json['toUID'].toString(),
      toEmail: json['toEmail'].toString(),
      subject: json['subject'].toString(),
      message: json['message'].toString(),
      messageType: json['messageType'].toString(),
      mode: json['mode'].toString(),
      status: json['status'],
      value: json['value'].toString(),
      returnStatus: json['returnStatus'].toString(),
      errorMessage: json['errorMessage'].toString(),
      parentID: json['parentID'],
      connectionString: json['connectionString'].toString(),
      createdDate: json['createdDate'],
      ImageFileName: json['ImageFileName'].toString(),

    );
  }
  Map<String, dynamic> toParam() =>{
    'fromUID':fromUID,
    'toEmail':toEmail,
    'createdDate':createdDate,
  };
}
class UpdateMail{
  int iD;
  String fromUID;
  String fromEmail;
  String toUID;
  String toEmail;
  String subject;
  String message;
  String messageType;
  String mode;
  int status;
  String value;
  String returnStatus;
  String errorMessage;
  int parentID;
  String connectionString;
  String createdDate;
  // ignore: non_constant_identifier_names
  String ImageFileName;

  UpdateMail({this.iD,this.fromUID,this.fromEmail,this.toUID,this.toEmail,this.subject,
    this.message,this.messageType,this.mode,this.status,this.value,this.returnStatus,
    // ignore: non_constant_identifier_names
    this.errorMessage,this.parentID,this.connectionString,this.createdDate,this.ImageFileName});

  factory UpdateMail.fromJson(Map<String, dynamic> json){
    return UpdateMail(
      status: json['status'],
      returnStatus:json['returnStatus'],
    );
  }
  Map<String, dynamic> toParam() =>{
    'iD':iD,
    'fromUID':fromUID,
    'toEmail':toEmail,
    'toUID' :toUID,
    'fromEmail':fromEmail,
    'subject':subject,
    'message':message,
    'messageType':messageType,
    'ImageFileName':ImageFileName,
    'mode':mode,
    'createdDate': createdDate
  };
}