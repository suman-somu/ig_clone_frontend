import 'package:flutter/material.dart';
import 'package:instgram_clone/screens/settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    int selectedImageIndex = 0;

    var itemCount = 10;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'John Doe',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            AssetImage('assets/images/profileimage.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            '2',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text('Posts'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '500',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text('Followers'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '346',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text('Following'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Photographer | Traveller',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Pellentesque euismod bibendum odio sit amet efficitur.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImageIndex = 0;
                            itemCount = 9;
                            print("$selectedImageIndex   $itemCount");
                          });
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                              child: Image.asset(
                                  'assets/images/postsinprofile.png'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: (selectedImageIndex == 0) ? 2 : 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImageIndex = 1;
                            itemCount = 11;
                            print("$selectedImageIndex   $itemCount");
                          });
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                              child:
                                  Image.asset('assets/images/taggedposts.png'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: (selectedImageIndex == 1) ? 2 : 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.amber,
                        // child: Image.asset(
                        //   'assets/images/image_$index.png',
                        //   fit: BoxFit.cover,
                        // ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
