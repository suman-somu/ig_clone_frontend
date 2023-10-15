import 'package:flutter/material.dart';
import 'package:instgram_clone/features/feed/services/like_service.dart';
import 'package:instgram_clone/features/feed/services/post_images_preview.dart';
import 'package:instgram_clone/features/feed/widgets/like_animation.dart';

import '../../../models/feed_model.dart';

class PostWidget extends StatefulWidget {
  final Feed feed;

  const PostWidget({super.key, required this.feed});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool checkLike() {
    return false;
  }

  bool isLikeAnimating = false;

  late bool hasLiked;
  late int likes;

  @override
  void initState() {
    hasLiked = widget.feed.hasLiked;
    likes = widget.feed.likes ?? 0;
    super.initState();
  }

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
          GestureDetector(
            onDoubleTap: () => {
              likeUnlike(widget.feed.postid!),
              setState(() {
                isLikeAnimating = true;
                if (!hasLiked) {
                  hasLiked = !hasLiked;
                  likes = (hasLiked) ? likes + 1 : likes - 1;
                }
              })
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                postImagesPreview(widget.feed.postid!),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isLikeAnimating ? 1 : 0,
                  child: LikeAnimation(
                    isAnimating: isLikeAnimating,
                    duration: const Duration(milliseconds: 200),
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
                      });
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                      size: 120,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LikeAnimation(
                duration: const Duration(milliseconds: 100),
                isAnimating: isLikeAnimating,
                child: IconButton(
                  onPressed: () {
                    isLikeAnimating = true;
                    likeUnlike(widget.feed.postid!);
                    setState(() {
                      hasLiked = !hasLiked;
                      likes = (hasLiked) ? likes + 1 : likes - 1;
                    });
                  },
                  isSelected: hasLiked,
                  icon: const Icon(Icons.favorite_border),
                  selectedIcon: const Icon(Icons.favorite),
                  color: (hasLiked) ? Colors.redAccent : Colors.black,
                ),
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
                  likes.toString(),
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
