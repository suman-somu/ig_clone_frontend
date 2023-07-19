import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:instgram_clone/secrets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/is_email.dart';

var url = secrets().url;

void signupService(String username, String email, String password) async {
  var uri = Uri.http(url, 'api/user/signup');
  var response = await http.post(uri,
      body: {'username': username, 'email': email, 'password': password});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<http.Response> login(String userid, String password) async {

  var uri = Uri.http(url, 'api/user/login');
  var response = (isEmail(userid))? await http.post(uri, body: {'email': userid, 'password': password}) :
      await http.post(uri, body: {'username': userid, 'password': password});

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

Future<void> logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var accessToken = prefs.getString('accessToken');

  var uri = Uri.http(url, 'api/user/logout');
  var response = await http.post(uri, body: {'accessToken': accessToken});

  if (response.statusCode == 200) {
    prefs.remove('username');
    prefs.remove('accessToken');
  }
}
