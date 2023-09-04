import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var url = dotenv.env['URL'];

Future<List<dynamic>> searchPredictionService(String keywords) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uri = Uri.http(url!, 'api/user/search', {'keywords': keywords,
    'currentusername': prefs.getString('username')!});
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      if (data.containsKey('data')) {
        var accounts = data['data'];

        return accounts;
      }
    } else {
      print('Request failed in searchPredictionService with status: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
  return [];
}
