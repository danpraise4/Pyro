class AttentantsModel {
  List<Data>? data;
  int? page;
  int? limit;
  int? totalPages;
  int? totalData;

  AttentantsModel(
      {this.data, this.page, this.limit, this.totalPages, this.totalData});

  AttentantsModel.fromJson(Map json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    totalData = json['totalData'];
  }

  Map toJson() {
    final Map data = new Map();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['totalPages'] = this.totalPages;
    data['totalData'] = this.totalData;
    return data;
  }
}

class Data {
  Meta? meta;
  String? firstName;
  String? lastName;
  String? systemCode;
  String? company;
  bool? isEmailVerified;
  String? emailVerifiedAt;
  String? phoneNumber;
  String? role;
  var accountStatus;
  String? createdAt;
  String? updatedAt;
  String? id;

  Data(
      {this.meta,
      this.firstName,
      this.lastName,
      this.systemCode,
      this.company,
      this.isEmailVerified,
      this.emailVerifiedAt,
      this.phoneNumber,
      this.role,
      this.accountStatus,
      this.createdAt,
      this.updatedAt,
      this.id});

  Data.fromJson(Map json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    firstName = json['firstName'];
    lastName = json['lastName'];
    systemCode = json['systemCode'];
    company = json['company'];
    isEmailVerified = json['isEmailVerified'];
    emailVerifiedAt = json['emailVerifiedAt'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    accountStatus = json['accountStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map toJson() {
    final Map data = new Map();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['systemCode'] = this.systemCode;
    data['company'] = this.company;
    data['isEmailVerified'] = this.isEmailVerified;
    data['emailVerifiedAt'] = this.emailVerifiedAt;
    data['phoneNumber'] = this.phoneNumber;
    data['role'] = this.role;
    data['accountStatus'] = this.accountStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}

class Meta {
  String? stationBranch;
  String? qrCode;

  Meta({this.stationBranch, this.qrCode});

  Meta.fromJson(Map json) {
    stationBranch = json['stationBranch'];
    qrCode = json['qrCode'];
  }

  Map toJson() {
    final Map data = Map();
    data['stationBranch'] = stationBranch;
    data['qrCode'] = qrCode;
    return data;
  }
}
