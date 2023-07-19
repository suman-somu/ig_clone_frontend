import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var url = '192.168.133.144:8080';

Future<Map<String, String>> profileservice() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username');
  var accessToken = prefs.getString('accessToken');

  var uri = Uri.http(url, 'api/user/profile');
  var response = await http.post(uri, body: {
    'username': username,
    'accessToken': accessToken,
  });

  var responseBody = jsonDecode(response.body);

  var nameofuser = responseBody['data']['nameofuser'];
  var profilepicture = responseBody['data']['profilepicture'];
  var noofposts = responseBody['data']['noofposts'];
  var followerscount = responseBody['data']['followerscount'];
  var followingcount = responseBody['data']['followingcount'];
  var bio = responseBody['data']['bio'];
  var postsidlist = responseBody['data']['postsidlist'];

  var profile = {
    'nameofuser': nameofuser.toString(),
    'profilepicture': profilepicture.toString(),
    'noofposts': noofposts.toString(),
    'followerscount': followerscount.toString(),
    'followingcount': followingcount.toString(),
    'bio': bio.toString(),
    'postsidlist': postsidlist.toString(),
  };

  return profile;
  
}