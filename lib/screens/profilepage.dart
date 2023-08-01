import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:instgram_clone/screens/settings.dart';
import 'package:instgram_clone/services/appwrite_image_preview.dart';
import 'package:instgram_clone/services/profile_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var nameofuser = '';
  var profilepicture = '';
  var noofposts = '';
  var followerscount = '';
  var followingcount = '';
  var bio = '';
  var postsidlist = '';

  @override
  void initState() {
    super.initState();
    callprofileservice();
    // appwriteImagePreview();
  }

  callprofileservice() async {
    Map<String, String> profileinfo = await profileservice();
    setState(() {
      nameofuser = profileinfo['nameofuser']!;
      profilepicture = profileinfo['profilepicture']!;
      noofposts = profileinfo['noofposts']!;
      followerscount = profileinfo['followerscount']!;
      followingcount = profileinfo['followingcount']!;
      bio = profileinfo['bio']!;
      postsidlist = profileinfo['postsidlist']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (nameofuser == '') ? '...' : nameofuser,
          style: const TextStyle(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            AssetImage('assets/images/profileimage.png'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            (noofposts == '') ? '-1' : noofposts.toString(),
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text('Posts'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            (followerscount == '')
                                ? '-1'
                                : followerscount.toString(),
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text('Followers'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            (followingcount == '')
                                ? '-1'
                                : followingcount.toString(),
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text('Following'),
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
                  Text(
                    (bio == '') ? 'THERE IS NO BIO' : bio,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(
                    height: 0,
                    // thickness: 0.5,
                  ),
                  const SizedBox(
                    height: 20,
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
                    itemCount: postsidlist.split(',').length,
                    itemBuilder: (context, index) {
                      List<dynamic> parsedList;
                      List<String> postsidlistStrings = [""];
                      if (postsidlist.isNotEmpty) {
                        parsedList = json.decode(postsidlist);
                        postsidlistStrings =
                            parsedList.map((id) => id.toString()).toList();
                      }
                      var postId = postsidlistStrings[index];
                      return appwriteImage(postId);
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
