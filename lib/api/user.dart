// ignore_for_file: empty_catche
import 'package:egroup_app/service/auth_request.dart';
import 'package:dio/dio.dart';

class UserRequest {
  user(context, setLoading) async {
    Response response;
    try {
      await AuthRequest.init();
      response = await AuthRequest.authRequest.get('/user');
      setLoading(false);
      return response.data;
    } on DioException catch (dioError) {
      if (dioError.response?.statusCode == 422) {
        return dioError.response?.data['message'];
      } else {
        return "Error : please contact webmaster";
      }
    }
  }
}
