import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

var url = dotenv.env['URL'];

Future<List<dynamic>> searchPredictionService(
    String keywords) async {
  try {
    var uri = Uri.http(url!, 'api/user/search', {'keywords': keywords});
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      // Parse the JSON response
      var data = jsonDecode(response.body);

      // Check if the response contains the 'data' key
      if (data.containsKey('data')) {
        var accounts = data['data'];

        // Print the accounts
        print(accounts);
        //print the datatype of accounts
        print(accounts.runtimeType);
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
