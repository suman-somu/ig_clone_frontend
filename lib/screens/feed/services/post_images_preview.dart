import 'package:appwrite/appwrite.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:instgram_clone/screens/feed/services/get_details.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

Widget postImagesPreview(String postid) {
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
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        List<String> fileids = snapshot.data!;

        return CarouselSlider(
          disableGesture: true,
          options: CarouselOptions(
            padEnds: false,
            enableInfiniteScroll: false,
            enlargeFactor: 1,
            viewportFraction: 1,
            aspectRatio: 1 / 1,
          ),
          items: fileids.map((fileid) {
            return FutureBuilder(
              future: storage.getFilePreview(
                bucketId: "64b7bba661f692c3ffa5",
                fileId: fileid,
                quality: 10,
              ),
              builder: (context, snapshot) {
                return snapshot.hasData && snapshot.data != null
                    ? ZoomOverlay(
                        minScale: 0.8,
                        animationCurve: Curves.fastOutSlowIn,
                        animationDuration: const Duration(milliseconds: 300),
                        modalBarrierColor: Colors.black.withOpacity(0.5),
                        twoTouchOnly: true,
                        onScaleStart: () {},
                        onScaleStop: () {},
                        child: Image.memory(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        ),
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
          }).toList(),
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
