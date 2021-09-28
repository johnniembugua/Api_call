import 'dart:async';

import 'package:api_call2/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiService {
  static var client = http.Client();

  // ignore: missing_return
  Future<List<UserModel>> fetchUsers() async {
    try {
      var response = await client
          .get('https://jsonplaceholder.typicode.com/users')
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException('Connection Timeout try again');
      });

      if (response.statusCode == 200) {
        List jsonresponse = convert.jsonDecode(response.body);
        return jsonresponse.map((e) => new UserModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print('response time out');
    }
  }
}
