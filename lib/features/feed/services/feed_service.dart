import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:instgram_clone/features/feed/services/get_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../models/feed_model.dart';

var url = dotenv.env['URL'];

List<Feed> feedlist = [
  Feed(
    username: 'john_doe',
    image: 'assets/exampleImages/instapost1.jpg',
    likes: 150,
    comments: 20,
    caption: 'yo yo yo !!! what is up',
  ),
  Feed(
    username: 'jane_smith',
    image: 'assets/exampleImages/instapost1.jpg',
    likes: 200,
    comments: 30,
    caption: 'Lorem Ipsum',
  ),
  // Add more posts here
];
List<Feed> getFeed() {
  return feedlist;
}

Future<List<Feed>> getHomeFeed() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    var accessToken = prefs.getString('accessToken');

    //get the postidlist
    var uri = Uri.http(url!, 'api/user/feed');
    var response = await http.get(uri, headers: {
      'username': username!,
      'accesstoken': accessToken!,
    });

    var responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print("feed received");

      List<Feed> feedList = [];

      //get the details of each post
      for (var postId in responseBody['data']['postidlist']) {
        var postdetails = await getPostDetails(postId.toString());
        if (postdetails.isNotEmpty) {
          Feed feed = Feed(
            username: postdetails['username'],
            image: postdetails['filepath'][0],
            postid: postdetails['postid'].toString(),
            caption: postdetails['caption'],
            likes: postdetails['likes'].length,
            comments: postdetails['comments'].length,
            hasLiked: postdetails['likes'].contains(username),
          );
          feedList.add(feed);
        }
      }
      print("feed success");
      return feedList;
    } else {
      print(
          'Request failed in getHomeFeed with status: ${response.statusCode}');
    }
    return [];
  } catch (e) {
    print('Error: $e');
    return [];
  }
}
