class UserModel {
  User? user;
  Token? token;

  UserModel({this.user, this.token});

  UserModel.fromJson(Map json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }

  Map toJson() {
    final Map data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    return data;
  }
}

class User {
  Meta? meta;
  AccountStatus? accountStatus;
  String? firstName;
  String? lastName;
  String? systemCode;
  String? stationHQ;
  String? email;
  bool? isEmailVerified;
  String? emailVerifiedAt;
  String? phoneNumber;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? id;

  User(
      {this.meta,
      this.accountStatus,
      this.firstName,
      this.lastName,
      this.systemCode,
      this.stationHQ,
      this.email,
      this.isEmailVerified,
      this.emailVerifiedAt,
      this.phoneNumber,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.id});

  User.fromJson(Map json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    accountStatus = json['accountStatus'] != null
        ? new AccountStatus.fromJson(json['accountStatus'])
        : null;
    firstName = json['firstName'];
    lastName = json['lastName'];
    systemCode = json['systemCode'];
    stationHQ = json['stationHQ'];
    email = json['email'];
    isEmailVerified = json['isEmailVerified'];
    emailVerifiedAt = json['emailVerifiedAt'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map toJson() {
    final Map data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.accountStatus != null) {
      data['accountStatus'] = this.accountStatus!.toJson();
    }
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['systemCode'] = this.systemCode;
    data['stationHQ'] = this.stationHQ;
    data['email'] = this.email;
    data['isEmailVerified'] = this.isEmailVerified;
    data['emailVerifiedAt'] = this.emailVerifiedAt;
    data['phoneNumber'] = this.phoneNumber;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}

class Meta {
  String? stationBranch;

  Meta({this.stationBranch});

  Meta.fromJson(Map json) {
    stationBranch = json['stationBranch'];
  }

  Map toJson() {
    final Map data = new Map<String, dynamic>();
    data['stationBranch'] = this.stationBranch;
    return data;
  }
}

class AccountStatus {
  String? status;
  String? reason;

  AccountStatus({this.status, this.reason});

  AccountStatus.fromJson(Map json) {
    status = json['status'];
    reason = json['reason'];
  }

  Map toJson() {
    final Map data = new Map();
    data['status'] = this.status;
    data['reason'] = this.reason;
    return data;
  }
}

class Token {
  String? accessToken;
  String? refreshToken;

  Token({this.accessToken, this.refreshToken});

  Token.fromJson(Map json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map toJson() {
    final Map data = new Map();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

///////////////

class CreateUserModel {
  String? email;
  String? password;
  String? loginOption;
  String? pushNotificationId;

  CreateUserModel(
      {this.email, this.password, this.loginOption, this.pushNotificationId});

  CreateUserModel.fromJson(Map json) {
    email = json['email'];
    password = json['password'];
    loginOption = json['loginOption'];
    pushNotificationId = json['pushNotificationId'];
  }

  Map toJson() {
    final Map data = {};
    data['email'] = email;
    data['password'] = password;
    data['loginOption'] = loginOption;
    data['pushNotificationId'] = pushNotificationId;
    return data;
  }
}
