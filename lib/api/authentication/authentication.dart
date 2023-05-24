import 'package:dio/dio.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/helpers/storage.dart';

class Authentication extends Api {
  Authentication(super.context);

  Login(path, {body}) async {
    Response? xy = await ApiCall(
      type: RequestType.post,
      path: path,
      data: body,
    );

    if (xy != null) {
      setStorage(key: db_user, value: xy.data);
      setStorage(key: key_token, value: xy.data[key_token]);
    }
    return xy;
  }
}
