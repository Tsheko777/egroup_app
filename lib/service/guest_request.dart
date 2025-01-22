import 'package:dio/dio.dart';
import 'package:egroup_app/service/const.dart';

class GuestRequest {
  static final Dio guestRequest = Dio();

  static void init() {
    var url = "$BACKEND/api";
    guestRequest.options
      ..headers = {
        'Accept': 'application/json',
      }
      ..baseUrl = url;
  }
}
