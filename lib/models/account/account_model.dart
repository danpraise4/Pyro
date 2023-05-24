class AccountModel {
  String? status;
  Station? station;

  AccountModel({this.status, this.station});

  AccountModel.fromJson(Map json) {
    status = json['status'];
    station =
        json['station'] != null ? new Station.fromJson(json['station']) : null;
  }

  Map toJson() {
    final Map data = new Map();
    data['status'] = this.status;
    if (this.station != null) {
      data['station'] = this.station!.toJson();
    }
    return data;
  }
}

class Station {
  String? sId;
  String? name;
  String? phoneNumber;
  Location? location;
  String? systemCode;
  StationHQ? stationHQ;
  String? status;
  Config? config;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Manager? manager;
  Wallets? wallets;
  List<PumpAttendants>? pumpAttendants;
  List<dynamic>? ratings;

  Station(
      {this.sId,
      this.name,
      this.phoneNumber,
      this.location,
      this.systemCode,
      this.stationHQ,
      this.status,
      this.config,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.manager,
      this.wallets,
      this.pumpAttendants,
      this.ratings});

  Station.fromJson(Map json) {
    sId = json['_id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    systemCode = json['systemCode'];
    stationHQ = json['stationHQ'] != null
        ? new StationHQ.fromJson(json['stationHQ'])
        : null;
    status = json['status'];
    config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    manager =
        json['manager'] != null ? new Manager.fromJson(json['manager']) : null;
    wallets =
        json['wallets'] != null ? new Wallets.fromJson(json['wallets']) : null;
    if (json['pumpAttendants'] != null) {
      pumpAttendants = <PumpAttendants>[];
      json['pumpAttendants'].forEach((v) {
        pumpAttendants!.add(new PumpAttendants.fromJson(v));
      });
    }
    ratings = json['ratings'];
  }

  Map toJson() {
    final Map data = new Map();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['systemCode'] = this.systemCode;
    if (this.stationHQ != null) {
      data['stationHQ'] = this.stationHQ!.toJson();
    }
    data['status'] = this.status;
    if (this.config != null) {
      data['config'] = this.config!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.manager != null) {
      data['manager'] = this.manager!.toJson();
    }
    if (this.wallets != null) {
      data['wallets'] = this.wallets!.toJson();
    }
    if (this.pumpAttendants != null) {
      data['pumpAttendants'] =
          this.pumpAttendants!.map((v) => v.toJson()).toList();
    }
    data['ratings'] = this.ratings;
    return data;
  }
}

class Location {
  String? lga;
  String? state;
  String? latitude;
  String? longitude;
  String? address;

  Location({this.lga, this.state, this.latitude, this.longitude, this.address});

  Location.fromJson(Map json) {
    lga = json['lga'];
    state = json['state'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
  }

  Map toJson() {
    final Map data = new Map();
    data['lga'] = this.lga;
    data['state'] = this.state;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    return data;
  }
}

class StationHQ {
  String? sId;
  String? admin;
  String? systemCode;
  String? name;
  String? email;
  String? phoneNumber;
  String? hqAddress;
  String? state;
  LegalDocs? legalDocs;
  String? createdAt;
  String? updatedAt;
  int? iV;

  StationHQ(
      {this.sId,
      this.admin,
      this.systemCode,
      this.name,
      this.email,
      this.phoneNumber,
      this.hqAddress,
      this.state,
      this.legalDocs,
      this.createdAt,
      this.updatedAt,
      this.iV});

  StationHQ.fromJson(Map json) {
    sId = json['_id'];
    admin = json['admin'];
    systemCode = json['systemCode'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    hqAddress = json['hqAddress'];
    state = json['state'];
    legalDocs = json['legalDocs'] != null
        ? new LegalDocs.fromJson(json['legalDocs'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map toJson() {
    final Map data = new Map();
    data['_id'] = this.sId;
    data['admin'] = this.admin;
    data['systemCode'] = this.systemCode;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['hqAddress'] = this.hqAddress;
    data['state'] = this.state;
    if (this.legalDocs != null) {
      data['legalDocs'] = this.legalDocs!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class LegalDocs {
  CertificateOfIncorporation? certificateOfIncorporation;
  CertificateOfIncorporation? taxIdentificationNumber;
  CertificateOfIncorporation? certificateToOperateFuelStation;

  LegalDocs(
      {this.certificateOfIncorporation,
      this.taxIdentificationNumber,
      this.certificateToOperateFuelStation});

  LegalDocs.fromJson(Map json) {
    certificateOfIncorporation = json['certificateOfIncorporation'] != null
        ? new CertificateOfIncorporation.fromJson(
            json['certificateOfIncorporation'])
        : null;
    taxIdentificationNumber = json['taxIdentificationNumber'] != null
        ? new CertificateOfIncorporation.fromJson(
            json['taxIdentificationNumber'])
        : null;
    certificateToOperateFuelStation =
        json['certificateToOperateFuelStation'] != null
            ? new CertificateOfIncorporation.fromJson(
                json['certificateToOperateFuelStation'])
            : null;
  }

  Map toJson() {
    final Map data = new Map();
    if (this.certificateOfIncorporation != null) {
      data['certificateOfIncorporation'] =
          this.certificateOfIncorporation!.toJson();
    }
    if (this.taxIdentificationNumber != null) {
      data['taxIdentificationNumber'] = this.taxIdentificationNumber!.toJson();
    }
    if (this.certificateToOperateFuelStation != null) {
      data['certificateToOperateFuelStation'] =
          this.certificateToOperateFuelStation!.toJson();
    }
    return data;
  }
}

class CertificateOfIncorporation {
  String? publicId;
  String? url;

  CertificateOfIncorporation({this.publicId, this.url});

  CertificateOfIncorporation.fromJson(Map json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map toJson() {
    final Map data = new Map();
    data['public_id'] = this.publicId;
    data['url'] = this.url;
    return data;
  }
}

class Config {
  int? pumpCount;
  OpenTime? openTime;
  Petrol? petrol;
  Petrol? diesel;
  Petrol? kerosene;
  Petrol? gas;

  Config(
      {this.pumpCount,
      this.openTime,
      this.petrol,
      this.diesel,
      this.kerosene,
      this.gas});

  Config.fromJson(Map json) {
    pumpCount = json['pumpCount'];
    openTime = json['openTime'] != null
        ? new OpenTime.fromJson(json['openTime'])
        : null;
    petrol =
        json['petrol'] != null ? new Petrol.fromJson(json['petrol']) : null;
    diesel =
        json['diesel'] != null ? new Petrol.fromJson(json['diesel']) : null;
    kerosene =
        json['kerosene'] != null ? new Petrol.fromJson(json['kerosene']) : null;
    gas = json['gas'] != null ? new Petrol.fromJson(json['gas']) : null;
  }

  Map toJson() {
    final Map data = new Map();
    data['pumpCount'] = this.pumpCount;
    if (this.openTime != null) {
      data['openTime'] = this.openTime!.toJson();
    }
    if (this.petrol != null) {
      data['petrol'] = this.petrol!.toJson();
    }
    if (this.diesel != null) {
      data['diesel'] = this.diesel!.toJson();
    }
    if (this.kerosene != null) {
      data['kerosene'] = this.kerosene!.toJson();
    }
    if (this.gas != null) {
      data['gas'] = this.gas!.toJson();
    }
    return data;
  }
}

class OpenTime {
  String? from;
  String? to;

  OpenTime({this.from, this.to});

  OpenTime.fromJson(Map json) {
    from = json['from'];
    to = json['to'];
  }

  Map toJson() {
    final Map data = Map();
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}

class Petrol {
  int? price;
  bool? isAvailable;

  Petrol({this.price, this.isAvailable});

  Petrol.fromJson(Map json) {
    price = json['price'];
    isAvailable = json['isAvailable'];
  }

  Map toJson() {
    final Map data = new Map();
    data['price'] = this.price;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}

class Manager {
  String? sId;
  String? firstName;
  String? lastName;
  String? systemCode;
  String? stationHQ;
  String? email;
  bool? isEmailVerified;
  String? emailVerifiedAt;
  String? phoneNumber;
  String? role;
  Metas? metas;
  String? accountStatus;
  String? createdAt;
  String? updatedAt;
  String? pushNotificationId;

  Manager(
      {this.sId,
      this.firstName,
      this.lastName,
      this.systemCode,
      this.stationHQ,
      this.email,
      this.isEmailVerified,
      this.emailVerifiedAt,
      this.phoneNumber,
      this.role,
      this.metas,
      this.accountStatus,
      this.createdAt,
      this.updatedAt,
      this.pushNotificationId});

  Manager.fromJson(Map json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    systemCode = json['systemCode'];
    stationHQ = json['stationHQ'];
    email = json['email'];
    isEmailVerified = json['isEmailVerified'];
    emailVerifiedAt = json['emailVerifiedAt'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    metas = json['meta'] != null ? new Metas.fromJson(json['meta']) : null;
    accountStatus = json['accountStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    pushNotificationId = json['pushNotificationId'];
  }

  Map toJson() {
    final Map data = new Map();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['systemCode'] = this.systemCode;
    data['stationHQ'] = this.stationHQ;
    data['email'] = this.email;
    data['isEmailVerified'] = this.isEmailVerified;
    data['emailVerifiedAt'] = this.emailVerifiedAt;
    data['phoneNumber'] = this.phoneNumber;
    data['role'] = this.role;
    if (this.metas != null) {
      data['meta'] = metas!.toJson();
    }
    data['accountStatus'] = this.accountStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['pushNotificationId'] = this.pushNotificationId;
    return data;
  }
}

class Metas {
  String? stationBranch;

  Metas({this.stationBranch});

  Metas.fromJson(Map json) {
    stationBranch = json['stationBranch'];
  }

  Map toJson() {
    final Map data = new Map();
    data['stationBranch'] = this.stationBranch;
    return data;
  }
}

class Wallets {
  String? sId;
  String? stationBranch;
  int? availableBalance;
  String? walletNumber;
  String? walletName;
  String? bankName;
  String? bankReferenceNumber;
  String? callbackUrl;
  bool? locked;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Wallets(
      {this.sId,
      this.stationBranch,
      this.availableBalance,
      this.walletNumber,
      this.walletName,
      this.bankName,
      this.bankReferenceNumber,
      this.callbackUrl,
      this.locked,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Wallets.fromJson(Map json) {
    sId = json['_id'];
    stationBranch = json['stationBranch'];
    availableBalance = json['availableBalance'];
    walletNumber = json['walletNumber'];
    walletName = json['walletName'];
    bankName = json['bankName'];
    bankReferenceNumber = json['bankReferenceNumber'];
    callbackUrl = json['callbackUrl'];
    locked = json['locked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map toJson() {
    final Map data = new Map();
    data['_id'] = this.sId;
    data['stationBranch'] = this.stationBranch;
    data['availableBalance'] = this.availableBalance;
    data['walletNumber'] = this.walletNumber;
    data['walletName'] = this.walletName;
    data['bankName'] = this.bankName;
    data['bankReferenceNumber'] = this.bankReferenceNumber;
    data['callbackUrl'] = this.callbackUrl;
    data['locked'] = this.locked;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PumpAttendants {
  String? sId;
  String? firstName;
  String? lastName;
  String? systemCode;
  String? stationHQ;
  bool? isEmailVerified;
  String? emailVerifiedAt;
  String? phoneNumber;
  String? role;
  Meta? meta;
  String? accountStatus;
  String? createdAt;
  String? updatedAt;

  PumpAttendants(
      {this.sId,
      this.firstName,
      this.lastName,
      this.systemCode,
      this.stationHQ,
      this.isEmailVerified,
      this.emailVerifiedAt,
      this.phoneNumber,
      this.role,
      this.meta,
      this.accountStatus,
      this.createdAt,
      this.updatedAt});

  PumpAttendants.fromJson(Map json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    systemCode = json['systemCode'];
    stationHQ = json['stationHQ'];
    isEmailVerified = json['isEmailVerified'];
    emailVerifiedAt = json['emailVerifiedAt'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    accountStatus = json['accountStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map toJson() {
    final Map data = new Map();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['systemCode'] = this.systemCode;
    data['stationHQ'] = this.stationHQ;
    data['isEmailVerified'] = this.isEmailVerified;
    data['emailVerifiedAt'] = this.emailVerifiedAt;
    data['phoneNumber'] = this.phoneNumber;
    data['role'] = this.role;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['accountStatus'] = this.accountStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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
    final Map data = new Map();
    data['stationBranch'] = this.stationBranch;
    data['qrCode'] = this.qrCode;
    return data;
  }
}
