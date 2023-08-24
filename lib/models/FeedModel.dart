class Feed {
  final String? username;
  final String? image;
  final int? likes;
  final int? comments;
  final String? caption;

  Feed({
    this.username,
    this.image,
    this.likes,
    this.comments,
    this.caption,
  });

    @override
  String toString() {
    return 'Feed(username: $username, image: $image, likes: $likes, comments: $comments, caption: $caption)';
  }
  factory Feed.fromJson(Map<String, dynamic> json) {
  return Feed(
    username: json['username'] ?? 'Lorem', // Provide a default value for null username
    image: json['image'] ?? 'default_image', // Provide a default value for null image
    likes: json['likes']?.length ?? 0,
    comments: json['comments']?.length ?? 0,
    caption: json['caption'] ?? 'No caption', // Provide a default value for null caption
  );
  }
}
