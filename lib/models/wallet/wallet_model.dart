class walletModel {
  String? stationBranch;
  int? availableBalance;
  String? walletNumber;
  String? walletName;
  String? bankName;
  bool? locked;
  String? createdAt;
  String? updatedAt;
  String? id;

  walletModel(
      {this.stationBranch,
      this.availableBalance,
      this.walletNumber,
      this.walletName,
      this.bankName,
      this.locked,
      this.createdAt,
      this.updatedAt,
      this.id});

  walletModel.fromJson(Map json) {
    stationBranch = json['stationBranch'];
    availableBalance = json['availableBalance'];
    walletNumber = json['walletNumber'];
    walletName = json['walletName'];
    bankName = json['bankName'];
    locked = json['locked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map toJson() {
    final Map data = new Map();
    data['stationBranch'] = this.stationBranch;
    data['availableBalance'] = this.availableBalance;
    data['walletNumber'] = this.walletNumber;
    data['walletName'] = this.walletName;
    data['bankName'] = this.bankName;
    data['locked'] = this.locked;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}
