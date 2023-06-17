import 'package:flutter/material.dart';
import 'package:instgram_clone/services/postsservice.dart';

import '../../widgets/PostWidget.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({Key? key});

  @override
  Widget build(BuildContext context) {

    List posts = getPosts();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Instagram",
          style: TextStyle(
            fontFamily: 'Cookie',
            fontWeight: FontWeight.w500,
            fontSize: 35,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostWidget(post: posts[index]);
          },
        ),
      ),
    );
  }
}
