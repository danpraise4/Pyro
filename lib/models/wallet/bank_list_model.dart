class bankListModel {
  String? id;
  String? name;
  String? uuid;
  String? interInstitutionCode;
  Null? sortCode;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  bankListModel(
      {this.id,
      this.name,
      this.uuid,
      this.interInstitutionCode,
      this.sortCode,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  bankListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    uuid = json['uuid'];
    interInstitutionCode = json['interInstitutionCode'];
    sortCode = json['sortCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['uuid'] = this.uuid;
    data['interInstitutionCode'] = this.interInstitutionCode;
    data['sortCode'] = this.sortCode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
