import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:instgram_clone/services/get_details.dart';

Widget appwriteImage(String postid) {
  Client client = Client();
  Storage storage = Storage(client);

  client
      .setEndpoint(dotenv.env['APPWRITE_ENDPOINT']!) // Your API Endpoint
      .setProject(dotenv.env['APPWRITE_PROJECT_ID']!);

  return FutureBuilder<String>(
    future: _getFileId(postid), // Wait for getFileId() to complete and get the fileid as a String
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        String fileid = snapshot.data!;
        return FutureBuilder(
          future: storage.getFilePreview(
            bucketId: "64b7bba661f692c3ffa5",
            fileId: fileid,
            // quality: 10,
            // width: 200,
            // height: 200,
          ),
          builder: (context, snapshot) {
            return snapshot.hasData && snapshot.data != null
                ? Image.memory(
                    snapshot.data!,
                  )
                : const CircularProgressIndicator(
                    color: Colors.black,
                );
          },
        );
      } else {
        return const Text('No data available');
      }
    },
  );
}

Future<String> _getFileId(String postid) async {
  var result = await getFileId(postid); 
  return result;
}
