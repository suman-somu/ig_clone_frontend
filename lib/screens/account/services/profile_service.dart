import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var url = dotenv.env['URL'];

Future<Map<String, String>> profileservice() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    var accessToken = prefs.getString('accessToken');

    var uri = Uri.http(url!, 'api/user/profile');
    var response = await http.post(uri, body: {
      'username': username,
      'accessToken': accessToken,
    });

    var responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
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

      //print postidlistr
      // print("This is the postids= ${postsidlist[1].runtimeType}");

      return profile;
    } else {
      print('Request failed in profileservice with status: ${response.statusCode}');
      return {};
    }
  } catch (e) {
    print('Error: $e');
    return {};
  }
}
