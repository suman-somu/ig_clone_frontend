import 'package:flutter/material.dart';
import 'package:instgram_clone/services/appwrite_image_preview.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import '../../models/FeedModel.dart';

class PostWidget extends StatefulWidget {
  final Feed feed;

  const PostWidget({super.key, required this.feed});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(child: Icon(Icons.person)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    widget.feed.username!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          ZoomOverlay(
            minScale: 0.8,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: const Duration(milliseconds: 300),
            modalBarrierColor: Colors.black.withOpacity(0.5),
            twoTouchOnly: true,
            onScaleStart: () {},
            onScaleStop: () {},
            child: AspectRatio(
              aspectRatio: 4 / 5,
              child: Image.asset(
                widget.feed.image!,
                fit: BoxFit.cover,
              ),
              // child: appwriteImage("7abdf3841c768bdd99e3a3dd12e726d7"),
            ),
          //   child: SizedBox(
          //     height: 100,child: appwriteImage("7abdf3841c768bdd99e3a3dd12e726d7")),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (selected) {
                      selected = false;
                    } else {
                      selected = true;
                    }
                  });
                },
                isSelected: selected,
                icon: const Icon(Icons.favorite_border),
                selectedIcon: const Icon(Icons.favorite),
                color: (selected) ? Colors.redAccent : Colors.black,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.comment_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.feed.likes.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  " likes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: widget.feed.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const WidgetSpan(child: SizedBox(width: 10)),
                  TextSpan(text: widget.feed.caption),
                ],
              ),
            ),
          ),
          const Divider(
            height: 50,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }
}
