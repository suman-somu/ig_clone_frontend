import 'package:flutter/material.dart';

import 'chatpreview.dart';
import 'chatscreen.dart';

void main() {
  runApp(MaterialApp(home: MessagesPage()));
}

class MessagesPage extends StatelessWidget {
  final List<ChatPreview> chatPreviews = [
    ChatPreview(username: 'user1', lastMessage: 'Hello!', profileImage: 'assets/user1.jpg'),
    ChatPreview(username: 'user2', lastMessage: 'Hi there!', profileImage: 'assets/user2.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Direct')),
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          iconSize: 30,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_chat),
            iconSize: 40,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            iconSize: 30,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chatPreviews.length,
        itemBuilder: (context, index) {
          final chatPreview = chatPreviews[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(chatPreview.profileImage)),
            title: Text(chatPreview.username),
            subtitle: Text(chatPreview.lastMessage),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen(username: chatPreview.username)),
              );
            },
          );
        },
      ),
    );
  }
}


