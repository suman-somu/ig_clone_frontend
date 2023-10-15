import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

var url = dotenv.env['URL'];

void likeUnlike(String postid) async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    var accessToken = prefs.getString('accessToken');

    //get the postidlist
    var uri = Uri.http(url!, 'api/user/like');
    var response = await http.put(uri, headers: {
      'username': username!,
      'accesstoken': accessToken!,
      'postid': postid,
    });

    var responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print("successful");
    } else {
      print('Request failed: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
