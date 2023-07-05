import 'package:flutter/material.dart';
import 'package:instgram_clone/services/fake_feed_service.dart';

import '../../widgets/PostWidget.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({Key? key});

  @override
  Widget build(BuildContext context) {
    List posts = getFeed();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Instagram",
              style: TextStyle(
                fontFamily: 'Cookie',
                fontWeight: FontWeight.w500,
                fontSize: 35,
                letterSpacing: 1,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 25,
                child: Image.asset('assets/images/messages.png'),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostWidget(feed: posts[index]);
          },
        ),
      ),
    );
  }
}
