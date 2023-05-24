class transactionModel {
  List<Data>? data;
  int? page;
  int? limit;
  int? totalPages;
  int? totalData;

  transactionModel(
      {this.data, this.page, this.limit, this.totalPages, this.totalData});

  transactionModel.fromJson(Map json) {
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
  String? stationBranch;
  String? transactionDump;
  String? type;
  String? pumpAttendant;
  int? amount;
  String? source;
  String? reference;
  String? purpose;
  Meta? meta;
  bool? pending;
  bool? locked;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? id;
  String? category;

  Data(
      {this.stationBranch,
      this.transactionDump,
      this.type,
      this.pumpAttendant,
      this.amount,
      this.source,
      this.reference,
      this.purpose,
      this.meta,
      this.pending,
      this.locked,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.id,
      this.category});

  Data.fromJson(Map json) {
    stationBranch = json['stationBranch'];
    transactionDump = json['transactionDump'];
    type = json['type'];
    pumpAttendant = json['pumpAttendant'];
    amount = json['amount'];
    source = json['source'];
    reference = json['reference'];
    purpose = json['purpose'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    pending = json['pending'];
    locked = json['locked'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    category = json['category'];
  }

  Map toJson() {
    final Map data = new Map();
    data['stationBranch'] = this.stationBranch;
    data['transactionDump'] = this.transactionDump;
    data['type'] = this.type;
    data['pumpAttendant'] = this.pumpAttendant;
    data['amount'] = this.amount;
    data['source'] = this.source;
    data['reference'] = this.reference;
    data['purpose'] = this.purpose;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['pending'] = this.pending;
    data['locked'] = this.locked;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    data['category'] = this.category;
    return data;
  }
}

class Meta {
  String? walletNumber;
  String? payerName;
  String? currency;
  int? fee;
  String? message;
  String? reference;

  Meta(
      {this.walletNumber,
      this.payerName,
      this.currency,
      this.fee,
      this.message,
      this.reference});

  Meta.fromJson(Map json) {
    walletNumber = json['walletNumber'];
    payerName = json['payerName'];
    currency = json['currency'];
    fee = json['fee'];
    message = json['message'];
    reference = json['reference'];
  }

  Map toJson() {
    final Map data = new Map();
    data['walletNumber'] = this.walletNumber;
    data['payerName'] = this.payerName;
    data['currency'] = this.currency;
    data['fee'] = this.fee;
    data['message'] = this.message;
    data['reference'] = this.reference;
    return data;
  }
}
