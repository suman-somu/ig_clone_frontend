import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var url = dotenv.env['URL'];

Future<Map<String, String>> searchAccount(String searchAccountUsername) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username');
  var accessToken = prefs.getString('accessToken');

  var uri = Uri.http(url!, 'api/user/search/account', {
    'username': username,
    'accessToken': accessToken,
    'searchAccountUsername': searchAccountUsername,
  });
  var response = await http.get(uri);

  var responseBody = jsonDecode(response.body);


  var nameofuser = responseBody['data']['nameofuser'];
  var searchedUsername = responseBody['data']['username'];
  var profilepicture = responseBody['data']['profilePicture'];
  var noofposts = responseBody['data']['posts'].length.toString();
  var followerscount = responseBody['data']['followers'].length.toString();
  var followingcount = responseBody['data']['following'].length.toString();
  var bio = responseBody['data']['bio'];
  var postsidlist = responseBody['data']['posts'];

  var profile = {
    'nameofuser': nameofuser.toString(),
    'searchedUsername': searchedUsername.toString(),
    'profilepicture': profilepicture.toString(),
    'noofposts': noofposts.toString(),
    'followerscount': followerscount.toString(),
    'followingcount': followingcount.toString(),
    'bio': (bio ?? '').toString(),
    'postsidlist': (postsidlist ?? []).toString(),
  };
  return profile;
}

FollowAccount (String searchAccountUsername) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username');
  var accessToken = prefs.getString('accessToken');

  var uri = Uri.http(url!, 'api/user/search/account', {
    'username': username,
    'accessToken': accessToken,
    'searchAccountUsername': searchAccountUsername,
  });
  var response = await http.put(uri);

  var responseBody = jsonDecode(response.body);
  print(responseBody);

}

//write a unfollow account function
UnfollowAccount (String searchAccountUsername) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username');
  var accessToken = prefs.getString('accessToken');

  var uri = Uri.http(url!, 'api/user/search/account', {
    'username': username,
    'accessToken': accessToken,
    'searchAccountUsername': searchAccountUsername,
  });
  var response = await http.delete(uri);

  var responseBody = jsonDecode(response.body);
  print(responseBody);

}
