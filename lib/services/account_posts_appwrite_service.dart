import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:instgram_clone/screens/feed/services/get_details.dart';

Widget accountPosts(String postid) {
  Client client = Client();
  Storage storage = Storage(client);

  client
      .setEndpoint(dotenv.env['APPWRITE_ENDPOINT']!) // Your API Endpoint
      .setProject(dotenv.env['APPWRITE_PROJECT_ID']!);

  return FutureBuilder<List<String>>(
    future: _getFileId(
        postid), // Wait for getFileId() to complete and get the fileid as a String
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ],
                  );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        List<String> fileids = snapshot.data!;

        return FutureBuilder(
          future: storage.getFilePreview(
            bucketId: "64b7bba661f692c3ffa5",
            fileId: fileids[0],
            quality: 10,
            // width: 200,
            // height: 200,
          ),
          builder: (context, snapshot) {
            return snapshot.hasData && snapshot.data != null
                ? Image.memory(
                    snapshot.data!,
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ],
                  );
          },
        );
      
      } else {
        return const Text('No data available');
      }
    },
  );
}

Future<List<String>> _getFileId(String postid) async {
  var result = await getFileId(postid);
  return result;
}
