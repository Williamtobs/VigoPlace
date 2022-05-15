import 'dart:convert';

import 'package:http/http.dart';

import 'api_baseUrl_helper.dart';

class ApiService {
  Future loginPost(String username, String password) async {
    final uri = Uri.parse('${ApiBase.baseUrl}${ApiBase.loginEndpoint}');
    Map<String, dynamic> body = {'username': username, 'password': password};
    Response response = await post(uri, body: body);
    print(response.body);
    print(response.statusCode);
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(data);
      return data;
    } else {
      return data;
    }
    // return response;
  }

  Future registerPost(String username, String email, String fullName,
      String dob, String password) async {
    final uri = Uri.parse('${ApiBase.baseUrl}${ApiBase.registerEndpoint}');
    Map<String, dynamic> body = {
      'username': username,
      'email': email,
      'fullname': fullName,
      'dob': dob,
      'password': password
    };
    Response response = await post(uri, body: body);
    print(response.body);
    print(response.statusCode);
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return data;
    } else {
      return data;
    }
    // return response;
  }
}
