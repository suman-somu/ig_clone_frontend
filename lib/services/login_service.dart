import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/is_email.dart';

var url = dotenv.env['URL'];

void signupService(String username, String email, String password) async {
  var uri = Uri.http(url!, 'api/user/signup');
  var response = await http.post(uri,
      body: {'username': username, 'email': email, 'password': password});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<http.Response> login(String userid, String password) async {

  print("login service called");
  print("userid = $userid");
  print("password = $password");

  var uri = Uri.http(url!, 'api/user/login');
  print("debug 1");
  var response = (isEmail(userid))? await http.post(uri, body: {'email': userid, 'password': password}) :
      await http.post(uri, body: {'username': userid, 'password': password});
  print("debug 2");
  if (response.statusCode == 200) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseBody = json.decode(response.body);
    var accessToken = responseBody['accessToken'];
    var user = responseBody['data']['username'];

    prefs.setString('username', user);
    prefs.setString('accessToken', accessToken);
  }
  print("debug 3");
  return response;
}

Future<void> logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var accessToken = prefs.getString('accessToken');

  var uri = Uri.http(url!, 'api/user/logout');
  var response = await http.post(uri, body: {'accessToken': accessToken});

  if (response.statusCode == 200) {
    prefs.remove('username');
    prefs.remove('accessToken');
  }
}
