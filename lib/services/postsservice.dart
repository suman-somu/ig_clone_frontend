import '../models/PostModel.dart';

List<Post> posts = [
  Post(
    username: 'john_doe',
    image: 'assets/images/about.png',
    likes: 150,
    comments: 20,
    shares: 10,
    caption: 'what is up',
  ),
  Post(
    username: 'jane_smith',
    image: 'assets/exampleImages/instapost1.jpg',
    likes: 200,
    comments: 30,
    shares: 5,
    caption: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  ),
  // Add more posts here
];

List<Post> getPosts() {
  return posts;
}
