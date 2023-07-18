import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var url = '192.168.133.144:8080';
var refreshToken='';

void signupService(String username, String email, String password) async {
  var uri = Uri.http(url, 'api/user/signup');
  var response = await http.post(uri, body: {
    'username': username,
    'email': email,
    'password': password
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<http.Response> login(String username, String password) async {
  var uri = Uri.http(url, 'api/user/login');
  var response =
      await http.post(uri, body: {'username': username, 'password': password});
  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');
  
  if (response.statusCode == 200) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseBody = json.decode(response.body);
    var accessToken = responseBody['accessToken'];
    var user = responseBody['data']['username'];

    prefs.setString('username', user);
    prefs.setString('accessToken', accessToken);
  }

  return response;
}

void logout () async {
  var uri = Uri.http(url, 'api/user/logout');
  var response = await http.post(uri, body: {'refreshToken': refreshToken});
  // print('\nResponse status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('accessToken');
  }
}