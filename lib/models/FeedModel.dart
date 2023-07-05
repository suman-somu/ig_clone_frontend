class Feed {
  final String username;
  final String image;
  final int likes;
  final int comments;
  final int shares;
  final String caption;

  Feed( {
    required this.username,
    required this.image,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.caption,
  });
}