import 'package:http/http.dart' as http;

var url = 'localhost:8080';
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
  print('Response status: ${response.statusCode}');
  // refreshToken = json.decode(response.body)['refreshToken'];
  // print(refreshToken);
  print('Response body: ${response.body}');
  return response;
}

void logout () async {
  var uri = Uri.http(url, 'api/user/logout');
  var response = await http.post(uri, body: {'refreshToken': refreshToken});
  print('\nResponse status: ${response.statusCode}');
  print('Response body: ${response.body}');
}