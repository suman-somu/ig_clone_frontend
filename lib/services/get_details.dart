import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var url = dotenv.env['URL'];

Future<String> getFileId(String postid) async {
  try {
    var uri = Uri.http(url!, 'api/user/getfileid');
    var response = await http.get(uri, headers: {
      'pid': postid,
    });
    var responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseBody['fileid'];
    } else {
      print('Request failed in getFileId with status: ${response.statusCode}');
    }
    return "";
  } catch (e) {
    print('Error: $e');
    return "";
  }
}

Future<Map<String, dynamic>> getPostDetails(String postid) async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    var accessToken = prefs.getString('accessToken');

    var uri = Uri.http(url!, 'api/user/getpostdetails');
    var response = await http.get(uri, headers: {
      'username': username!,
      'accesstoken': accessToken!,
      'pid': postid,
    });

    var responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseBody['postdetails'];
    } else {
      print('Request failed in getPostDetails with status: ${response.statusCode}');
    }
    return {};
  } catch (e) {
    print('Error: $e');
    return {};
  }
}
