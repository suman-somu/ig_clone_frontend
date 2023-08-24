import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var url = dotenv.env['URL'];

Future<String> getPostDetailsForAUser(String postid) async {
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
      // print("received successfully");
      // print("This is the decoded response body = ${responseBody}");
      // print("this is the filepath = ${responseBody['postdetails']['filepath']}");
      return responseBody['postdetails']['filepath'].toString();
    } else {
      print('Request failed with status: ${response.statusCode}');
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
      // print("received successfully");
      print("This is the decoded response body = ${responseBody}");
      // print("this is the filepath = ${responseBody['postdetails']['filepath']}");
      return responseBody['postdetails'];
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
    return {};
  } catch (e) {
    print('Error: $e');
    return {};
  }
}
