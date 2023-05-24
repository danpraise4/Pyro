class paymentOptionsModel {
  String? _type;
  String? _bank;
  String? _number;
  String? _id;
  String? _icon;
  String? _user;
  String? _token;
  String? _createdAt;

  paymentOptionsModel(
      {String? type,
      String? bank,
      String? number,
      String? id,
      String? icon,
      String? user,
      String? token,
      String? createdAt}) {
    if (type != null) {
      _type = type;
    }
    if (bank != null) {
      _bank = bank;
    }
    if (number != null) {
      _number = number;
    }
    if (id != null) {
      _id = id;
    }
    if (icon != null) {
      _icon = icon;
    }
    if (user != null) {
      _user = user;
    }
    if (token != null) {
      _token = token;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  String? get bank => _bank;
  set bank(String? bank) => _bank = bank;
  String? get number => _number;
  set number(String? number) => _number = number;
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get icon => _icon;
  set icon(String? icon) => _icon = icon;
  String? get user => _user;
  set user(String? user) => _user = user;
  String? get token => _token;
  set token(String? token) => _token = token;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;

  paymentOptionsModel.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _bank = json['bank'];
    _number = json['number'];
    _id = json['id'];
    _icon = json['icon'];
    _user = json['user'];
    _token = json['token'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['bank'] = _bank;
    data['number'] = _number;
    data['id'] = _id;
    data['icon'] = _icon;
    data['user'] = _user;
    data['token'] = _token;
    data['createdAt'] = _createdAt;
    return data;
  }
}
