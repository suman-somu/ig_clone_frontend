import 'package:http/http.dart' as http;
import 'dart:convert';

var url = 'localhost:8080';
var refreshToken='';
main() async{
  // signupService();
  await login();
  logout();
}

void signupService() async {
  var uri = Uri.http(url, 'api/user/signup');
  var response = await http.post(uri, body: {
    'username': 'Suman',
    'email': 'sumansahoo943@gmail.com',
    'password': 'suman123'
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<void> login() async {
  var uri = Uri.http(url, 'api/user/login');
  var response =
      await http.post(uri, body: {'username': 'Suman', 'password': 'suman123'});
  print('Response status: ${response.statusCode}');
  refreshToken = json.decode(response.body)['refreshToken'];
  // print(refreshToken);
  print('Response body: ${response.body}');
}

void logout () async {
  var uri = Uri.http(url, 'api/user/logout');
  var response = await http.post(uri, body: {'refreshToken': refreshToken});
  print('\nResponse status: ${response.statusCode}');
  print('Response body: ${response.body}');
}