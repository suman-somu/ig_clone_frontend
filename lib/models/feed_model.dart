class Feed {
  final String? username;
  final String? image;
  final int? likes;
  final bool hasLiked;
  final int? comments;
  final String? caption;
  final String? postid;

  Feed({
    this.username,
    this.image,
    this.likes,
    this.hasLiked = false,
    this.comments,
    this.caption,
    this.postid,
  });

  set hasLiked(bool value) {
    hasLiked = value;
  }

    @override
  String toString() {
    return 'Feed(username: $username, image: $image, likes: $likes, comments: $comments, caption: $caption, postid: $postid, hasLiked: $hasLiked)';
  }
  factory Feed.fromJson(Map<String, dynamic> json) {
  return Feed(
    username: json['username'] ?? 'Lorem', // Provide a default value for null username
    image: json['image'] ?? 'default_image', // Provide a default value for null image
    likes: json['likes']?.length ?? 0,
    comments: json['comments']?.length ?? 0,
    caption: json['caption'] ?? 'No caption', // Provide a default value for null caption
    postid: json['postid'].toString(), // Provide a default value for null postid
  );
  }
}
