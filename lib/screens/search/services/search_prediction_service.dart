import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

var url = dotenv.env['URL'];

Future<List<dynamic>> searchPredictionService(String keywords) async {
  try {
    var uri = Uri.http(url!, 'api/user/search', {'keywords': keywords});
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      if (data.containsKey('data')) {
        var accounts = data['data'];

        return accounts;
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
  return [];
}
