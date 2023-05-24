class parseTransactionModel {
  int? _total;
  String? _title;
  String? _status;
  String? _message;
  List<Data>? _data;

  parseTransactionModel(
      {int? total,
      String? title,
      String? status,
      String? message,
      List<Data>? data}) {
    if (total != null) {
      _total = total;
    }
    if (title != null) {
      _title = title;
    }
    if (status != null) {
      _status = status;
    }
    if (message != null) {
      _message = message;
    }
    if (data != null) {
      _data = data;
    }
  }

  int? get total => _total;
  set total(int? total) => _total = total;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  parseTransactionModel.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    _title = json['title'];
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = _total;
    data['title'] = _title;
    data['status'] = _status;
    data['message'] = _message;
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? _mKey;
  var _mValue;
  bool? _isAmount;
  bool? _copy;

  Data({String? mKey, var mValue, bool? isAmount, bool? copy}) {
    if (mKey != null) {
      _mKey = mKey;
    }
    if (mValue != null) {
      _mValue = mValue;
    }
    if (isAmount != null) {
      _isAmount = isAmount;
    }
    if (copy != null) {
      _copy = copy;
    }
  }

  String? get mKey => _mKey;
  set mKey(var mKey) => _mKey = mKey;

  get mValue => _mValue;
  set mValue(var mValue) => _mValue = mValue;
  bool? get isAmount => _isAmount;
  set isAmount(bool? isAmount) => _isAmount = isAmount;
  bool? get copy => _copy;
  set copy(bool? copy) => _copy = copy;

  Data.fromJson(Map<String, dynamic> json) {
    _mKey = json['mKey'];
    _mValue = json['mValue'];
    _isAmount = json['isAmount'];
    _copy = json['copy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mKey'] = _mKey;
    data['mValue'] = _mValue;
    data['isAmount'] = _isAmount;
    data['copy'] = _copy;
    return data;
  }
}
